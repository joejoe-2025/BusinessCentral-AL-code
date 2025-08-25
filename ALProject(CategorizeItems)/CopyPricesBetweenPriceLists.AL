codeunit 53190 "Copy PriceList Lines"
{
    /// 把当前页面筛选/选中的 Item，从 SourcePL 复制 Price List Lines 到 TargetPL
    procedure RunWithFilter(var ItemFilter: Record Item; SourcePL: Code[20]; TargetPL: Code[20]): Integer
    var
        Item: Record Item;
        Copied: Integer;
    begin
        if (SourcePL = '') or (TargetPL = '') then
            Error('Source and Target Price List are required.');

        Item.CopyFilters(ItemFilter);
        if Item.FindSet() then
            repeat
                Copied += CopyOneItem(Item."No.", SourcePL, TargetPL);
            until Item.Next() = 0;

        exit(Copied);
    end;

    // === codeunit 53190 "Copy PriceList Lines" 内 ===

    local procedure CopyOneItem(ItemNo: Code[20]; SrcPL: Code[20]; TgtPL: Code[20]): Integer
    var
        Src: Record "Price List Line";
        NewL: Record "Price List Line";
        Added: Integer;
        NextNo: Integer;
    begin
        // 取源价目表中该物料的所有行
        Src.Reset();
        Src.SetRange("Price List Code", SrcPL);
        Src.SetRange("Asset Type", Src."Asset Type"::Item);
        Src.SetRange("Asset No.", ItemNo);

        if Src.FindSet() then
            repeat
                // 先用一个候选记录装载维度，拿去重函数判断是否已存在
                NewL.Init();
                NewL."Price List Code" := TgtPL;
                NewL."Price Type" := Src."Price Type";            // Price / Discount
                NewL."Asset Type" := Src."Asset Type";            // Item
                NewL."Asset No." := Src."Asset No.";
                NewL."Variant Code" := Src."Variant Code";
                NewL."Unit of Measure Code" := Src."Unit of Measure Code";
                NewL."Currency Code" := Src."Currency Code";
                NewL."Starting Date" := Src."Starting Date";
                NewL."Ending Date" := Src."Ending Date";
                NewL."Minimum Quantity" := Src."Minimum Quantity";
                // 如你们使用以下字段，可放开
                // NewL."Work Type Code"      := Src."Work Type Code";
                // NewL."Location Code"       := Src."Location Code";

                // 金额类型 + 金额/折扣（用于去重判等）
                NewL."Amount Type" := Src."Amount Type";
                NewL."Unit Price" := Src."Unit Price";
                NewL."Line Discount %" := Src."Line Discount %";

                if not ExistsSameLine(NewL) then begin
                    // === 进入真正插入 ===
                    NextNo := GetNextLineNo(TgtPL);

                    NewL.Init();
                    NewL.Validate("Price List Code", TgtPL);
                    NewL."Line No." := NextNo;

                    // 基本维度
                    NewL.Validate("Price Type", Src."Price Type");
                    NewL.Validate("Asset Type", Src."Asset Type");
                    NewL.Validate("Asset No.", Src."Asset No.");
                    NewL.Validate("Variant Code", Src."Variant Code");
                    NewL.Validate("Unit of Measure Code", Src."Unit of Measure Code");
                    NewL.Validate("Currency Code", Src."Currency Code");
                    NewL.Validate("Starting Date", Src."Starting Date");
                    NewL.Validate("Ending Date", Src."Ending Date");
                    NewL.Validate("Minimum Quantity", Src."Minimum Quantity");
                    // NewL.Validate("Work Type Code",       Src."Work Type Code");
                    // NewL.Validate("Location Code",        Src."Location Code");

                    // —— 关键：价格/折扣只能二选一 —— 
                    NewL.Validate("Amount Type", Src."Amount Type"); // 若你是 Defines 则改成 "Defines"

                    case NewL."Amount Type" of
                        NewL."Amount Type"::Price:
                            begin
                                NewL.Validate("Unit Price", Src."Unit Price");
                                if NewL."Line Discount %" <> 0 then
                                    NewL.Validate("Line Discount %", 0);
                            end;
                        NewL."Amount Type"::Discount:
                            begin
                                NewL.Validate("Line Discount %", Src."Line Discount %");
                                if NewL."Unit Price" <> 0 then
                                    NewL.Validate("Unit Price", 0);
                            end;
                    end;

                    // 其它行为标志
                    NewL.Validate("Allow Line Disc.", Src."Allow Line Disc.");
                    NewL.Validate("Allow Invoice Disc.", Src."Allow Invoice Disc.");

                    NewL.Insert(); // 显式分配了 Line No.，无需 Insert(true)
                    Added += 1;
                end;
            until Src.Next() = 0;

        exit(Added);
    end;


    // 生成下一个行号（按 10000 递增；按你们规范可改）
    // 找到“同维度”的现有行（不比较 Unit Price/Discount 值，便于做更新）
    local procedure TryGetExistingLine(var Candidate: Record "Price List Line"; var Existing: Record "Price List Line"): Boolean
    begin
        Existing.Reset();
        Existing.SetRange("Price List Code", Candidate."Price List Code");
        Existing.SetRange("Price Type", Candidate."Price Type");
        Existing.SetRange("Asset Type", Candidate."Asset Type");
        Existing.SetRange("Asset No.", Candidate."Asset No.");
        Existing.SetRange("Variant Code", Candidate."Variant Code");
        Existing.SetRange("Unit of Measure Code", Candidate."Unit of Measure Code");
        Existing.SetRange("Currency Code", Candidate."Currency Code");
        Existing.SetRange("Starting Date", Candidate."Starting Date");
        Existing.SetRange("Ending Date", Candidate."Ending Date");
        Existing.SetRange("Minimum Quantity", Candidate."Minimum Quantity");
        // 如需要维度更严格，可放开：
        // Existing.SetRange("Work Type Code",     Candidate."Work Type Code");
        // Existing.SetRange("Location Code",      Candidate."Location Code");
        exit(Existing.FindFirst());
    end;

    // 按 10000 递增生成行号
    local procedure GetNextLineNo(PriceListCode: Code[20]) LineNo: Integer
    var
        L: Record "Price List Line";
    begin
        L.Reset();
        L.SetCurrentKey("Price List Code", "Line No.");
        L.SetRange("Price List Code", PriceListCode);
        if L.FindLast() then
            LineNo := L."Line No." + 10000
        else
            LineNo := 10000;
    end;

    // 去重
    local procedure ExistsSameLine(var L: Record "Price List Line"): Boolean
    var
        Q: Record "Price List Line";
    begin
        Q.Reset();
        Q.SetRange("Price List Code", L."Price List Code");
        Q.SetRange("Price Type", L."Price Type");
        Q.SetRange("Asset Type", L."Asset Type");
        Q.SetRange("Asset No.", L."Asset No.");
        Q.SetRange("Variant Code", L."Variant Code");
        Q.SetRange("Unit of Measure Code", L."Unit of Measure Code");
        Q.SetRange("Currency Code", L."Currency Code");
        Q.SetRange("Starting Date", L."Starting Date");
        Q.SetRange("Ending Date", L."Ending Date");
        Q.SetRange("Minimum Quantity", L."Minimum Quantity");
        // Q.SetRange("Work Type Code",       L."Work Type Code");
        // Q.SetRange("Location Code",        L."Location Code");
        Q.SetRange("Amount Type", L."Amount Type");
        Q.SetRange("Unit Price", L."Unit Price");
        Q.SetRange("Line Discount %", L."Line Discount %");
        exit(Q.FindFirst());
    end;

    /// 可选：打开目标价目表的行（若你环境无该页可注释此过程及调用）
    procedure OpenTargetPriceList(TargetPL: Code[20])
    var
        L: Record "Price List Line";
        P: Page "Price List Lines";
    begin
        L.SetRange("Price List Code", TargetPL);
        P.SetTableView(L);
        P.Run();
    end;
}
