table 50188 "Demo Field Types"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "ID"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Text Field"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Date Field"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(4; "DateTime Field"; DateTime)
        {
            DataClassification = CustomerContent;
        }

        field(5; "Code Field"; Code[30])
        {
            DataClassification = CustomerContent;
        }

        field(6; "Integer Field"; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(7; "Decimal Field"; Decimal)
        {
            DataClassification = CustomerContent;

        }

        field(8; "Boolean Field"; Boolean)
        {
            DataClassification = CustomerContent;
        }

        field(9; "Option Field"; Option)
        {
            OptionMembers = None,Low,Medium,High;
            DataClassification = CustomerContent;
        }
        field(10; Color; Enum "Color Emoji")
        {

        }
        field(11; "Referral Person Code"; Code[20])
        {
            Caption = 'LookUp Field';
            TableRelation = "Salesperson/Purchaser".Code;
        }


        field(12; "Company Code"; Code[10])
        {
            Caption = 'AutoNumber - Company Code';
            DataClassification = CustomerContent;
        }

        field(13; "AutoNumber Customer No."; Code[30])
        {
            Caption = 'AutoNumber - Customer No.';
            DataClassification = CustomerContent;
        }
        field(14; "Number 1"; Decimal) { DataClassification = CustomerContent; }
        field(15; "Number 2"; Decimal) { DataClassification = CustomerContent; }
        field(16; "Number 3"; Decimal) { DataClassification = CustomerContent; }
        field(17; "Result"; Decimal) { DataClassification = CustomerContent; }
        field(18; "Customer Sales Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Line Amount" WHERE("Document Type" = CONST(Order)));
            Caption = 'Customer Sales (All Orders)';
            Editable = false;
        }

        field(19; Customer_Onlookup; Text[100])
        {
            Caption = 'CustomerName_Onlookup';
        }




    }

    keys
    {
        key(PK; "ID")
        {
            Clustered = true;
        }
    }
    procedure CalculateResult(): Decimal
    begin
        exit("Number 1" * "Number 2" - "Number 3");
    end;


}
enum 50180 "Color Emoji"
{
    Extensible = true;

    value(0; None) { Caption = ' '; }
    value(1; Red) { Caption = '🔴 Red'; }
    value(2; Blue) { Caption = '🔵 Blue'; }
    value(3; Purple) { Caption = '🟣 Purple'; }
    value(4; Green) { Caption = '🟢 Green'; }
    value(5; Black) { Caption = '⚫ Black'; }
    value(6; Fish) { Caption = '🐠 Fish'; }
    value(7; Smile) { Caption = '😄 Smile'; }
    value(8; Hundred) { Caption = '💯 100'; }
    value(9; Hand) { Caption = '🫳 Hand'; }
}


