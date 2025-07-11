tableextension 50222 ItemExtension extends Item
{
    fields
    {
        field(50100; "SubCategory"; Code[30])
        {
            DataClassification = ToBeClassified;
        }

        field(50101; "Brand"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }
}

pageextension 50222 ItemCardExtension extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("SubCategory"; Rec."SubCategory")
            {
                ApplicationArea = All;
            }

            field("Brand"; Rec."Brand")
            {
                ApplicationArea = All;
            }
        }
    }
}
