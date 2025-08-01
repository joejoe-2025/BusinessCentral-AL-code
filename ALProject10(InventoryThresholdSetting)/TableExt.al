tableextension 50550 ItemExt extends Item
{
    fields
    {
        field(51100; "Inventory Threshold"; Integer)
        {
            Caption = 'Inventory Threshold';
            DataClassification = CustomerContent;
        }

        field(51101; "Low Inventory"; Option)
        {
            Caption = 'Low Inventory';
            OptionMembers = "No","Yes";
            OptionCaption = 'No,Yes';
            Editable = false;
            DataClassification = CustomerContent;
        }

        field(51102; "Low Inventory Style"; Text[20])
        {
            Caption = 'Low Inventory Style';
            Editable = false;
            DataClassification = ToBeClassified;
        }

        field(51103; "RestockQuantity"; Text[20])
        {
            Caption = 'RestockQuantity';
            Editable = true;
            DataClassification = ToBeClassified;
        }


    }
}
