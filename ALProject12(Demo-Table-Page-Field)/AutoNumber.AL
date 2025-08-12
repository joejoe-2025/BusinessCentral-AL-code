codeunit 50155 AutoNumberInsertHandler
{
    [EventSubscriber(ObjectType::Table, Database::"Demo Field Types", 'OnBeforeValidateEvent', 'Company Code', false, false)]
    local procedure HandleCompanyCodeValidate(var Rec: Record "Demo Field Types"; xRec: Record "Demo Field Types"; CurrFieldNo: Integer)
    begin
        // 如果是新纪录，或公司编码被更改，则生成新的编号
        if (Rec."AutoNumber Customer No." = '') or (Rec."Company Code" <> xRec."Company Code") then
            Rec."AutoNumber Customer No." := GenerateCustomerNo(Rec."Company Code");
    end;

    local procedure GenerateCustomerNo(CompanyCode: Code[10]): Code[30]
    var
        Tracker: Record "AutoNumberTracker";
        YearInt: Integer;
        NextNoText: Text;
    begin
        YearInt := Date2DMY(Today(), 3); // 取得年份，如 2025

        Tracker.SetRange("Company Code", CompanyCode);
        Tracker.SetRange("Year", YearInt);

        if Tracker.FindFirst() then begin
            if Tracker."Last No." >= 99999999 then
                Error('The auto number has reached its maximum limit (99999999).');
            Tracker."Last No." += 1;
            Tracker.Modify();
        end else begin
            Tracker.Init();
            Tracker."Company Code" := CompanyCode;
            Tracker."Year" := YearInt;
            Tracker."Last No." := 1;
            Tracker.Insert();
        end;

        // 补足8位数字
        NextNoText := Format(Tracker."Last No.");
        while StrLen(NextNoText) < 8 do
            NextNoText := '0' + NextNoText;

        exit(CompanyCode + Format(YearInt) + NextNoText); // 例：ABC202500000001
    end;
}
