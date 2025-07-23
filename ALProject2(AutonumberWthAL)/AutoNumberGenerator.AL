//This code is used to generate an Autonumber base on the Company Name and Year, Example：ABC202500000001


codeunit 50152 AutoNumberInsertHandler
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeValidateEvent', 'Company Code', false, false)]
    local procedure HandleCompanyCodeValidate(var Rec: Record Customer; xRec: Record Customer; CurrFieldNo: Integer)
    begin
        // If create a new record or Company Code changed
        if (Rec."AutoNumber Customer No." = '') or (Rec."Company Code" <> xRec."Company Code") then
            Rec."AutoNumber Customer No." := GenerateCustomerNo(Rec."Company Code");
    end;


    local procedure GenerateCustomerNo(CompanyCode: Code[10]): Code[30]
    var
        Tracker: Record "AutoNumber Tracker";
        YearInt: Integer;
        NextNoText: Text;
    begin
        YearInt := Date2DMY(Today(), 3);
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

        // fullfill 8 numbers
        NextNoText := Format(Tracker."Last No.");
        while StrLen(NextNoText) < 8 do
            NextNoText := '0' + NextNoText;

        exit(CompanyCode + Format(YearInt) + NextNoText); // Example：ABC202500000001
    end;
}
