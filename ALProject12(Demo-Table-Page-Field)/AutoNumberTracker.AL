table 50180 "AutoNumberTracker"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Company Code"; Code[10]) { }
        field(2; "Year"; Integer) { }
        field(3; "Last No."; Integer) { }
    }

    keys
    {
        key(PK; "Company Code", "Year") { Clustered = true; }
    }
}