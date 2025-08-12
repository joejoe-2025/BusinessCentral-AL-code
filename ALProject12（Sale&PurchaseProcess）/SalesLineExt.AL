tableextension 50143 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50316; "BZ Tariff Code"; Code[50])
        {
            Caption = 'Tariff Code';
            TableRelation = "Tariff Duty Setup"."Tariff Code";
        }
        field(50314; "DC DUTY%2"; Decimal)
        {
            Caption = 'DUTY%2(Export)';
            DecimalPlaces = 0 : 5;
        }
        field(50315; "AY Duty_Amt2"; Decimal)
        {
            Caption = 'Duty Amount2(Based on AV)';
            DecimalPlaces = 0 : 2;
        }
    }
}

pageextension 50143 SalesOrderLineExt extends "Sales Order Subform"
{
    layout
    {
        addafter("Line Amount")
        {
            field("BZ Tariff Code"; Rec."BZ Tariff Code")
            {
                Caption = '🔴 Tariff Code';
                ApplicationArea = All;
                ToolTip = 'Tariff code snapshot from Item; can be overridden.';
            }
            field("DC DUTY%2"; Rec."DC DUTY%2")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Duty%2 resolved from Tariff.';
            }
            field("AY Duty_Amt2"; Rec."AY Duty_Amt2")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Line Amount * Duty%2 / 100.';
            }
        }
    }
}
