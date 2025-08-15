codeunit 50143 SalesLineDuty2_FromItem
{
    // 选定物料/数量/单价/折扣变化都重算 Duty 金额
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', true, true)]
    local procedure SL_OnAfterValidate_No(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty2(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', true, true)]
    local procedure SL_OnAfterValidate_Qty(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty2(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Unit Price', true, true)]
    local procedure SL_OnAfterValidate_UnitPrice(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty2(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Line Discount %', true, true)]
    local procedure SL_OnAfterValidate_DiscPct(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty2(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Line Discount Amount', true, true)]
    local procedure SL_OnAfterValidate_DiscAmt(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty2(Rec);
    end;

    // —— 计算逻辑 ——（以 Line Amount 为基数；要按含税可改成 "Amount Including VAT"）
    local procedure RecalcDuty2(var SL: Record "Sales Line")
    var
        ItemRec: Record Item;
        pct: Decimal;
    begin
        if SL.Type <> SL.Type::Item then begin
            SL."AY Duty_Amt2" := 0;
            exit;
        end;

        pct := 0;
        if ItemRec.Get(SL."No.") then
            pct := ItemRec."DC DUTY%2"; // 直接取 Item 上的 Duty%2

        SL."AY Duty_Amt2" := Round(SL."Line Amount" * pct / 100, 0.01, '=');
    end;
}
