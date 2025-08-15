codeunit 50161 TariffDutySetupInstall
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        SeedTariffs(); // 新装时插/改
    end;

    local procedure SeedTariffs()
    begin
        UpsertTariff('HS0101', 5.0, 4.5);
        UpsertTariff('HS0201', 7.0, 6.0);
        UpsertTariff('HS0402', 12.5, 11.0);
        UpsertTariff('HS0701', 4.0, 3.5);
        UpsertTariff('HS0901', 7.5, 7.0);
        UpsertTariff('HS1701', 10.0, 9.0);
        UpsertTariff('HS2203', 15.0, 14.0);
        UpsertTariff('HS2710', 6.5, 5.5);
        UpsertTariff('HS3004', 2.0, 1.5);
        UpsertTariff('HS8501', 8.0, 7.5);
    end;

    local procedure UpsertTariff(TariffCode: Code[50]; Duty2Pct: Decimal; Duty1Pct: Decimal)
    var
        T: Record "Tariff Duty Setup";
        changed: Boolean;
    begin
        if T.Get(TariffCode) then begin
            changed := false;
            // 需要就更新（避免每次都写库）
            if T."Duty%2" = 0 then begin
                T."Duty%2" := Duty2Pct;
                changed := true;
            end;
            if T."Duty%1" <> Duty1Pct then begin
                T."Duty%1" := Duty1Pct;
                changed := true;
            end;
            if changed then
                T.Modify(true);
        end else begin
            T.Init();
            T."Tariff Code" := TariffCode;
            T."Duty%2" := Duty2Pct;
            T."Duty%1" := Duty1Pct;
            T.Insert(true);
        end;
    end;
}


codeunit 50162 TariffDutySetupUpgrade
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        BackfillDuty1();
    end;

    local procedure BackfillDuty1()
    var
        T: Record "Tariff Duty Setup";
    begin
        if T.FindSet(true) then
            repeat
                // 只给 0 的补值；你也可以根据 HS code 自己定规则
                if T."Duty%1" = 0 then begin
                    // 这里示例：如果没有具体规则，就先用 Duty%2 填上，或者给默认值
                    T."Duty%1" := T."Duty%2"; // 或者：SomeDefaultByHS(T."Tariff Code")
                    T.Modify(true);
                end;
            until T.Next() = 0;
    end;
}
