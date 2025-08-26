codeunit 53140 "Item Copy Tools"
{
    // 将“当前公司”中选择的 Items，为指定 Location 建立/补齐 SKU
    procedure CreateSKUsForLocation(var ItemSel: Record Item; TargetLoc: Code[10])
    var
        Itm: Record Item;
        SKU: Record "Stockkeeping Unit";
    begin
        if TargetLoc = '' then
            Error('Please choose a Location.');

        // 如果页面没传选择集，就处理全表；否则只处理选择集
        if ItemSel.IsEmpty then begin
            Itm.Reset();
            if Itm.FindSet() then
                repeat
                    EnsureSku(Itm."No.", TargetLoc);
                until Itm.Next() = 0;
        end else begin
            ItemSel.MarkedOnly(true);
            if ItemSel.FindSet() then
                repeat
                    EnsureSku(ItemSel."No.", TargetLoc);
                until ItemSel.Next() = 0;
        end;
    end;

    local procedure EnsureSku(ItemNo: Code[20]; LocCode: Code[10])
    var
        SKU: Record "Stockkeeping Unit";
        Itm: Record Item;
    begin
        if not Itm.Get(ItemNo) then
            exit;

        SKU.Reset();
        SKU.SetRange("Item No.", ItemNo);
        SKU.SetRange("Location Code", LocCode);
        if not SKU.FindFirst() then begin
            SKU.Init();
            SKU.Validate("Item No.", ItemNo);
            SKU.Validate("Location Code", LocCode);
            // 需要的话在这里从 Item 同步补货策略/货位/供应商默认等
            SKU.Insert(true);
        end;
    end;

    // 将“当前公司”中选择的 Items 复制到目标公司（只复制主数据 + UoM）
    // OverwriteIfExists = TRUE 时，目标公司已存在则更新关键字段
    procedure CopyItemsToCompany(var Sel: Record Item; TargetCompany: Text[30]; OverwriteIfExists: Boolean)
    var
        Itm: Record Item;
    begin
        if TargetCompany = '' then
            Error('Target company is required.');
        if TargetCompany = CompanyName then
            Error('Target company (%1) cannot be the same as current company.', TargetCompany);

        // 没选 = 全表；选了 = 按选择
        if Sel.IsEmpty then begin
            Itm.Reset();
            if Itm.FindSet() then
                repeat
                    CopyOneItemToCompany(Itm, TargetCompany, OverwriteIfExists);
                until Itm.Next() = 0;
        end else begin
            Sel.MarkedOnly(true);
            if Sel.FindSet() then
                repeat
                    CopyOneItemToCompany(Sel, TargetCompany, OverwriteIfExists);
                until Sel.Next() = 0;
        end;
    end;

    local procedure CopyOneItemToCompany(Src: Record Item; TargetCompany: Text[30]; OverwriteIfExists: Boolean)
    var
        Dst: Record Item;
        U1: Record "Item Unit of Measure";
        U2: Record "Item Unit of Measure";
        IS: Record "Inventory Setup";
        NS: Record "No. Series";
        NoSeries: Codeunit "No. Series";
        ManualNos: Boolean;
        NewNo: Code[20];
        TargetItemNo: Code[20];
        BaseCode: Code[10];
        HasEntries: Boolean;
    begin
        Dst.ChangeCompany(TargetCompany);

        // =============== 目标已存在 =================
        if Dst.Get(Src."No.") then begin
            if not OverwriteIfExists then
                exit;

            TargetItemNo := Dst."No.";
            BaseCode := Dst."Base Unit of Measure";
            HasEntries := HasEntriesInCompany(TargetCompany, TargetItemNo);

            // 有分录：只更新「安全字段」，绝不动 Base UoM & Posting 参数
            if HasEntries then begin
                // 安全字段（根据你司政策可自行增减）
                if Dst.Description <> Src.Description then
                    Dst.Validate(Description, Src.Description);
                if Dst."Item Category Code" <> Src."Item Category Code" then
                    Dst.Validate("Item Category Code", Src."Item Category Code");

                // 可选：Search Description、Weight 等等…
                // if Dst."Search Description" <> Src."Search Description" then
                //    Dst.Validate("Search Description", Src."Search Description");

                Dst.Modify(true);
            end else begin
                // 没有分录：仍然不要动 Base UoM（为了简单和安全）
                if Dst.Description <> Src.Description then
                    Dst.Validate(Description, Src.Description);
                if Dst."Item Category Code" <> Src."Item Category Code" then
                    Dst.Validate("Item Category Code", Src."Item Category Code");
                if Dst."Inventory Posting Group" <> Src."Inventory Posting Group" then
                    Dst.Validate("Inventory Posting Group", Src."Inventory Posting Group");
                if Dst."Gen. Prod. Posting Group" <> Src."Gen. Prod. Posting Group" then
                    Dst.Validate("Gen. Prod. Posting Group", Src."Gen. Prod. Posting Group");
                if Dst."VAT Prod. Posting Group" <> Src."VAT Prod. Posting Group" then
                    Dst.Validate("VAT Prod. Posting Group", Src."VAT Prod. Posting Group");

                Dst.Modify(true);
            end;

        end else begin
            // =============== 目标不存在：新建 =================
            ManualNos := true;
            IS.ChangeCompany(TargetCompany);
            if IS.Get() and (IS."Item Nos." <> '') then begin
                NS.ChangeCompany(TargetCompany);
                if NS.Get(IS."Item Nos.") then
                    ManualNos := NS."Manual Nos.";
            end;

            Dst.Init();
            if ManualNos then
                Dst.Validate("No.", Src."No.")
            else begin
                if IS."Item Nos." = '' then
                    Error('Target company %1 has empty "Item Nos." in Inventory Setup.', TargetCompany);
                NewNo := NoSeries.GetNextNo(IS."Item Nos.", WorkDate(), true);
                Dst.Validate("No.", NewNo);
            end;

            // 先确保目标公司存在对应 UOM 代码（Base UoM 一定要存在）
            EnsureUomCodeInCompany(TargetCompany, Src."Base Unit of Measure");

            // 新建时才可写 Base UoM
            Dst.Validate("Base Unit of Measure", Src."Base Unit of Measure");
            Dst.Validate(Description, Src.Description);
            Dst.Validate("Item Category Code", Src."Item Category Code");
            Dst.Validate("Inventory Posting Group", Src."Inventory Posting Group");
            Dst.Validate("Gen. Prod. Posting Group", Src."Gen. Prod. Posting Group");
            Dst.Validate("VAT Prod. Posting Group", Src."VAT Prod. Posting Group");
            Dst.Insert(true);

            TargetItemNo := Dst."No.";
            BaseCode := ''; // 新建：允许复制 Base 行
            HasEntries := false; // 新建不可能有分录
        end;

        // =============== 复制单位 ===============
        U1.Reset();
        U1.SetRange("Item No.", Src."No.");
        if U1.FindSet() then
            repeat
                // 先确保目标公司存在该 UOM 代码
                EnsureUomCodeInCompany(TargetCompany, U1.Code);

                U2.ChangeCompany(TargetCompany);
                U2.Reset();
                U2.SetRange("Item No.", TargetItemNo);
                U2.SetRange(Code, U1.Code);

                // 目标存在旧物料，则跳过 Base UoM 行的变更（有分录时尤其不能动）
                if (BaseCode <> '') and (U1.Code = BaseCode) then
                    continue;

                if not U2.FindFirst() then begin
                    U2.Init();
                    U2.Validate("Item No.", TargetItemNo);
                    U2.Validate(Code, U1.Code);
                    U2.Validate("Qty. per Unit of Measure", U1."Qty. per Unit of Measure");
                    U2.Insert(true);
                end else if OverwriteIfExists then begin
                    // 有分录 & Base 行：已 continue 跳过；其它行可更新
                    U2.Validate("Qty. per Unit of Measure", U1."Qty. per Unit of Measure");
                    U2.Modify(true);
                end;
            until U1.Next() = 0;
    end;

    local procedure HasEntriesInCompany(TargetCompany: Text[30]; ItemNo: Code[20]): Boolean
    var
        ILE: Record "Item Ledger Entry";
    begin
        ILE.ChangeCompany(TargetCompany);
        ILE.SetRange("Item No.", ItemNo);
        exit(ILE.FindFirst()); // 只要有任何分录，就算“有分录”
    end;

    local procedure EnsureUomCodeInCompany(TargetCompany: Text[30]; UomCode: Code[10])
    var
        UOM: Record "Unit of Measure";
    begin
        if UomCode = '' then
            exit;
        UOM.ChangeCompany(TargetCompany);
        if not UOM.Get(UomCode) then begin
            UOM.Init();
            UOM.Code := UomCode;
            // 可选：给 Description 复制一下
            UOM."International Standard Code" := '';  // 需要再补也行
            UOM.Insert(true);
        end;
    end;

    // —— 仅在目标已存在物料时，同步单位。不会创建物料
    procedure CopyUomsOnly_ExistingItem(ItemNo: Code[20]; TargetCompany: Text[30]; OverwriteIfExists: Boolean)
    var
        SrcU: Record "Item Unit of Measure";
        DstU: Record "Item Unit of Measure";
        DstItem: Record Item;
    begin
        DstItem.ChangeCompany(TargetCompany);
        if not DstItem.Get(ItemNo) then
            Error('Item %1 does not exist in %2. Use "Copy Items to Company" instead.', ItemNo, TargetCompany);

        SrcU.Reset();
        SrcU.SetRange("Item No.", ItemNo);
        if SrcU.FindSet() then
            repeat
                DstU.ChangeCompany(TargetCompany);
                DstU.Reset();
                DstU.SetRange("Item No.", ItemNo);
                DstU.SetRange(Code, SrcU.Code);
                if not DstU.FindFirst() then begin
                    DstU.Init();
                    DstU.Validate("Item No.", ItemNo);
                    DstU.Validate(Code, SrcU.Code);
                    DstU.Validate("Qty. per Unit of Measure", SrcU."Qty. per Unit of Measure");
                    DstU.Insert(true);
                end else if OverwriteIfExists then begin
                    DstU.Validate("Qty. per Unit of Measure", SrcU."Qty. per Unit of Measure");
                    DstU.Modify(true);
                end;
            until SrcU.Next() = 0;
    end;




    // （可选）到“目标公司+目标地点”同时生成 SKU
    procedure CreateSKUsInOtherCompany(var ItemSel: Record Item; TargetCompany: Text[30]; TargetLoc: Code[10])
    var
        Src: Record Item;
        SKU: Record "Stockkeeping Unit";
    begin
        if (TargetCompany = '') or (TargetLoc = '') then
            Error('Target company and location are required.');

        // 循环源项
        if ItemSel.IsEmpty then begin
            Src.Reset();
            if Src.FindSet() then
                repeat
                    EnsureSkuInOtherCompany(Src."No.", TargetCompany, TargetLoc);
                until Src.Next() = 0;
        end else begin
            ItemSel.MarkedOnly(true);
            if ItemSel.FindSet() then
                repeat
                    EnsureSkuInOtherCompany(ItemSel."No.", TargetCompany, TargetLoc);
                until ItemSel.Next() = 0;
        end;
    end;

    local procedure EnsureSkuInOtherCompany(ItemNo: Code[20]; TargetCompany: Text[30]; TargetLoc: Code[10])
    var
        SKU: Record "Stockkeeping Unit";
    begin
        SKU.ChangeCompany(TargetCompany);
        SKU.Reset();
        SKU.SetRange("Item No.", ItemNo);
        SKU.SetRange("Location Code", TargetLoc);
        if not SKU.FindFirst() then begin
            SKU.Init();
            SKU.Validate("Item No.", ItemNo);
            SKU.Validate("Location Code", TargetLoc);
            SKU.Insert(true);
        end;
    end;
}
