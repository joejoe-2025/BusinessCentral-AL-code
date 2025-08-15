codeunit 50190 PurchaseLineDuty1_FromItem
{
    // 选定物料后重算
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'No.', true, true)]
    local procedure PL_OnAfterValidate_No(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty1(Rec);
    end;

    // 数量/单价/折扣变更重算
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'Quantity', true, true)]
    local procedure PL_OnAfterValidate_Quantity(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty1(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'Direct Unit Cost', true, true)]
    local procedure PL_OnAfterValidate_UnitCost(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty1(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'Line Discount %', true, true)]
    local procedure PL_OnAfterValidate_DiscPct(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty1(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'Line Discount Amount', true, true)]
    local procedure PL_OnAfterValidate_DiscAmt(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer)
    begin
        RecalcDuty1(Rec);
    end;

    // —— 计算逻辑：以 Line Amount（不含税）为基数；若需含税可改为 "Amount Including VAT"
    local procedure RecalcDuty1(var PL: Record "Purchase Line")
    var
        ItemRec: Record Item;
        pct: Decimal;
    begin
        if PL.Type <> PL.Type::Item then begin
            PL."AY Duty_Amt1" := 0;
            exit;
        end;

        pct := 0;
        if ItemRec.Get(PL."No.") then
            pct := ItemRec."AX Duty%1"; // 直接取 Item 的 Duty%1 (Import)

        PL."AY Duty_Amt1" := Round(PL."Line Amount" * pct / 100, 0.01, '=');
    end;
}
