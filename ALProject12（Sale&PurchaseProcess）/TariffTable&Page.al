table 50160 "Tariff Duty Setup"
{
    Caption = 'Tariff Duty Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Tariff Code"; Code[50]) { Caption = 'Tariff Code'; }
        field(2; "Duty%2"; Decimal)
        {
            Caption = 'DUTY%2(Export)';
            DecimalPlaces = 0 : 5;
        }
    }
    keys { key(PK; "Tariff Code") { Clustered = true; } }
}

page 50160 "Tariff Duty Setup"
{
    PageType = List;
    SourceTable = "Tariff Duty Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(G)
            {
                field("Tariff Code"; Rec."Tariff Code") { ApplicationArea = All; }
                field("Duty%2"; Rec."Duty%2") { ApplicationArea = All; }
            }
        }
    }
}
