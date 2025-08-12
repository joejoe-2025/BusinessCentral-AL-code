tableextension 51102 ItemReplenishmentExt extends Item
{
    fields
    {
        field(51200; "B NAME"; Text[255])
        {
            Caption = 'Vendor Name';
        }

        field(51201; "P Purch_UNITS"; Integer)
        {
            Caption = 'Purchase Units';
        }

        field(51202; "BK Purch_UoM1"; Code[10])
        {
            Caption = 'Purchase UoM 1';
            TableRelation = "Unit of Measure";
        }

        field(51203; "BL Purch_Units1"; Integer)
        {
            Caption = 'Purchase Units 1';
        }

        field(51204; "BM Disc%"; Decimal)
        {
            Caption = 'Discount % 1';
        }

        field(51205; "BN Purch_UoM2"; Code[10])
        {
            Caption = 'Purchase UoM 2';
            TableRelation = "Unit of Measure";
        }

        field(51206; "BO Purch_Units2"; Integer)
        {
            Caption = 'Purchase Units 2';
        }

        field(51207; "BP Disc%1"; Decimal)
        {
            Caption = 'Discount % 2';
        }

        field(51208; "BQ DATE_CHANGED"; Date)
        {
            Caption = 'Date Changed';
        }

        field(51209; "BR 1 YR FREE"; Text[10])
        {
            Caption = '1 YR Free';
        }

        field(51210; "BS 2 YR"; Text[10])
        {
            Caption = '2 YR Free';
        }

        field(51211; "BT 3 YR"; Text[10])
        {
            Caption = '3 YR Free';
        }

        field(51212; "BU Notes"; Text[255])
        {
            Caption = 'Replenishment Notes';
        }

        field(51213; "BY Vendor_Rank"; Integer)
        {
            Caption = 'Vendor Rank';
        }

        field(51214; "CB FDA"; Text[10])
        {
            Caption = 'FDA Code';
            ToolTip = 'Food and Drug Administration';
        }

        field(51215; "CX Purch_UoM3"; Code[10])
        {
            Caption = 'Purchase UoM 3';
            TableRelation = "Unit of Measure";
        }

        field(51216; "CY Purch_UNITS3"; Integer)
        {
            Caption = 'Purchase UnitS3';
        }

        field(51217; "CZ Purch_UoM_PRICE1"; Decimal)
        {
            Caption = 'Unit Price 1';
        }

        field(51218; "DA Purch_UoM_DISC%1"; Decimal)
        {
            Caption = 'Discount % 1';
        }
    }
}
