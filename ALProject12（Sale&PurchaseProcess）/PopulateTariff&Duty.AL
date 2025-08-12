codeunit 50161 TariffDutySetupInstall
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        SeedTariffs();
    end;

    local procedure SeedTariffs()
    begin
        InsertTariff('HS0101', 5.0);   // 活牛（示例）
        InsertTariff('HS0201', 7.0);   // 牛肉（示例）
        InsertTariff('HS0402', 12.5);  // 乳制品（示例）
        InsertTariff('HS0701', 4.0);   // 蔬菜（示例）
        InsertTariff('HS0901', 7.5);   // 咖啡豆（示例）
        InsertTariff('HS1701', 10.0);  // 蔗糖（示例）
        InsertTariff('HS2203', 15.0);  // 啤酒（示例）
        InsertTariff('HS2710', 6.5);   // 矿物燃料（示例）
        InsertTariff('HS3004', 2.0);   // 药品（示例）
        InsertTariff('HS8501', 8.0);   // 电动机（示例）
    end;

    local procedure InsertTariff(TariffCode: Code[50]; DutyPct: Decimal)
    var
        RecTariff: Record "Tariff Duty Setup";
    begin
        if not RecTariff.Get(TariffCode) then begin
            RecTariff.Init();
            RecTariff."Tariff Code" := TariffCode;
            RecTariff."Duty%2" := DutyPct;
            RecTariff.Insert();
        end;
    end;
}
