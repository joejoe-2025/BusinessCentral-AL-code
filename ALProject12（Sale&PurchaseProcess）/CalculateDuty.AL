codeunit 50143 SalesLineDuty2Handler
{
    // 选定 Item：把 Item 的 Tariff 带到行；随后按 Tariff 取 Duty%2 并计算金额
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', true, true)]
    local procedure SL_OnAfterValidate_No(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    var
        ItemRec: Record Item;
    begin
        if Rec.Type <> Rec.Type::Item then begin
            Rec."BZ Tariff Code" := '';
            Rec."DC DUTY%2" := 0;
            Rec."AY Duty_Amt2" := 0;
            exit;
        end;

        if ItemRec.Get(Rec."No.") then
            Rec."BZ Tariff Code" := ItemRec."BZ Tariff Code"; // 只带 Tariff，Duty%2 由映射表决定

        ResolveDutyFromTariff(Rec);
        RecalcDuty2(Rec);
    end;

    // 手动在行上改 Tariff：重新取 Duty%2 并重算金额
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'BZ Tariff Code', true, true)]
    local procedure SL_OnAfterValidate_Tariff(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        ResolveDutyFromTariff(Rec);
        RecalcDuty2(Rec);
    end;

    // 数量/单价/折扣变化：仅重算金额
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

    // === Helpers ===
    local procedure ResolveDutyFromTariff(var SL: Record "Sales Line")
    var
        TariffSetup: Record "Tariff Duty Setup";
    begin
        SL."DC DUTY%2" := 0;
        if (SL."BZ Tariff Code" <> '') and TariffSetup.Get(SL."BZ Tariff Code") then
            SL."DC DUTY%2" := TariffSetup."Duty%2";
    end;

    local procedure RecalcDuty2(var SL: Record "Sales Line")
    begin
        if SL.Type <> SL.Type::Item then begin
            SL."AY Duty_Amt2" := 0;
            exit;
        end;
        SL."AY Duty_Amt2" := Round(SL."Line Amount" * SL."DC DUTY%2" / 100, 0.01, '=');
    end;
}
