codeunit 53012 "Create SKUs For Location"
{
    // ... 你已有的代码（RunWithFilter / EnsureSku / CopyOne ...）

    /// 从 SKU 列表发起：对当前筛选/选中的 SKU 批量复制到目标 Location
    procedure RunFromSKU(var SKUFilter: Record "Stockkeeping Unit"; TargetLocation: Code[10])
    var
        SKU: Record "Stockkeeping Unit";
    begin
        if TargetLocation = '' then
            Error('Target Location is required.');

        SKU.CopyFilters(SKUFilter);
        if SKU.FindSet() then
            repeat
                // 每条 SKU 的源地点 = SKU."Location Code"
                CopyOne(SKU."Item No.", SKU."Location Code", TargetLocation);
            until SKU.Next() = 0;
    end;

    local procedure CopyOne(ItemNo: Code[20]; SrcLoc: Code[10]; TgtLoc: Code[10])
    var
        Src: Record "Stockkeeping Unit";
        Dst: Record "Stockkeeping Unit";
    begin
        // 目标 SKU 不存在则创建
        Dst.Reset();
        Dst.SetRange("Item No.", ItemNo);
        Dst.SetRange("Location Code", TgtLoc);
        if not Dst.FindFirst() then begin
            Dst.Init();
            Dst.Validate("Item No.", ItemNo);
            Dst.Validate("Location Code", TgtLoc);
            Dst.Insert(true);
        end;

        // 从源地点复制关键参数（按需增减字段）
        Src.Reset();
        Src.SetRange("Item No.", ItemNo);
        Src.SetRange("Location Code", SrcLoc);
        if Src.FindFirst() then begin
            Dst."Safety Stock Quantity" := Src."Safety Stock Quantity";
            Dst."Reordering Policy" := Src."Reordering Policy";
            Dst."Reorder Point" := Src."Reorder Point";
            Dst."Reorder Quantity" := Src."Reorder Quantity";
            Dst."Maximum Inventory" := Src."Maximum Inventory";
            Dst."Vendor No." := Src."Vendor No.";
            Dst."Shelf No." := Src."Shelf No.";
            // ... 需要的字段继续补
            Dst.Modify(true);
        end;
    end;
}
