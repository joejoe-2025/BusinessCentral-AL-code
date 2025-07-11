tableextension 50133 ItemExtension_CustomFields extends Item
{
    fields
    {
        field(50100; "Duty %"; Decimal)
        {
            Caption = 'Duty %';
        }

        field(50101; "Tariff %"; Decimal)
        {
            Caption = 'Tariff %';
        }

        field(50102; "Fixed Duty Amount"; Decimal)
        {
            Caption = 'Fixed Duty Amount';
        }

        field(50103; "Tariff Code"; Text[50])
        {
            Caption = 'Tariff Code';
        }

        field(50104; "SubCategory"; Text[100])
        {
            Caption = 'SubCategory';
        }

        field(50105; "WebCode"; Text[100])
        {
            Caption = 'WebCode';
        }

        field(50106; "Brand"; Text[100])
        {
            Caption = 'Brand';
        }

        field(50107; "Product Group"; Text[100])
        {
            Caption = 'Product Group';
        }

        field(50108; "Components"; Text[100])
        {
            Caption = 'Components';
        }

        field(50109; "Product Size"; Text[100])
        {
            Caption = 'Product Size';

        }
        field(50110; "Parent Item"; Code[20])
        {
            Caption = 'Parent Item';
            TableRelation = Item."No.";
            DataClassification = ToBeClassified;
        }
        field(50111; "AvailableRetail"; Boolean)
        {
            Caption = 'Available for Retail';
        }

        field(50112; "AvailableSalesCenter"; Boolean)
        {
            Caption = 'Available for Sales Center';
        }

        field(50113; "AvailableWeb"; Boolean)
        {
            Caption = 'Available for Web';
        }

        field(50114; "Category"; Text[100])
        {
            Caption = 'Category';
        }
        field(50150; "RelatedItemGroup"; Code[20])
        {
            Caption = 'Related Item Group';
        }
    }
}
