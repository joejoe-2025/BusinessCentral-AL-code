tableextension 53150 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(53250; "Packing Charge"; Decimal)
        {
            Caption = '🟦Packing Charge';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }

        field(53251; "Commission%"; Decimal)
        {
            Caption = '🟦Commission%';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }

        field(53252; "CommissionAmt"; Decimal)
        {
            Caption = '🟦Commission Amt';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }
    }
}
pageextension 53150 SalesOrderSubformExt extends "Sales Order Subform"
{
    layout
    {
        addlast(Control1)   // Control1 通常是 repeater；如不同，请用 Page Inspector 查看 repeater 名称
        {
            field("Packing Charge"; Rec."Packing Charge")
            {
                ApplicationArea = All;
            }
            field("Commission%"; Rec."Commission%")
            {
                ApplicationArea = All;
            }
            field("CommissionAmt"; Rec."CommissionAmt")
            {
                ApplicationArea = All;
            }
        }
    }
}
