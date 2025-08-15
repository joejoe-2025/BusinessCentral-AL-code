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

        // ⬇ 新增：采购侧用的 Import Duty
        field(3; "Duty%1"; Decimal)
        {
            Caption = 'DUTY%1(Import)';
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(PK; "Tariff Code") { Clustered = true; }
    }
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
                // ⬇ 新增字段在页面上展示
                field("Duty%1"; Rec."Duty%1") { ApplicationArea = All; }
            }
        }
    }
}
