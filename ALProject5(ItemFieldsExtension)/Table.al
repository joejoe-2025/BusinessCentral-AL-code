tableextension 50133 ItemExtension_CustomFields extends Item
{
    fields
    {
        field(51200; "Duty %"; Decimal)
        {
            Caption = 'Duty %';
        }

        field(51201; "Tariff %"; Decimal)
        {
            Caption = 'Tariff %';
        }

        field(51202; "Fixed Duty Amount"; Decimal)
        {
            Caption = 'Fixed Duty Amount';
        }

        field(51203; "Tariff Code"; Text[50])
        {
            Caption = 'Tariff Code';
        }

        field(51204; "SubCategory"; Text[100])
        {
            Caption = 'SubCategory';
        }

        field(51205; "WebCode"; Text[100])
        {
            Caption = 'WebCode';
        }

        field(51206; "Brand"; Text[100])
        {
            Caption = 'Brand';
        }

        field(51207; "Product Group"; Text[100])
        {
            Caption = 'Product Group';
        }

        field(51208; "Components"; Text[100])
        {
            Caption = 'Components';
        }

        field(5109; "Product Size"; Text[100])
        {
            Caption = 'Product Size';

        }
        field(51210; "Parent Item"; Code[20])
        {
            Caption = 'Parent Item';
            TableRelation = Item."No.";
            DataClassification = ToBeClassified;
        }
        field(51211; "AvailableRetail"; Boolean)
        {
            Caption = 'Available for Retail';
        }

        field(51212; "AvailableSalesCenter"; Boolean)
        {
            Caption = 'Available for Sales Center';
        }

        field(51213; "AvailableWeb"; Boolean)
        {
            Caption = 'Available for Web';
        }

        field(51214; "Category"; Text[100])
        {
            Caption = 'Category';
        }
        field(51250; "RelatedItemGroup"; Code[20])
        {
            Caption = 'Related Item Group';
        }
    }
}
