pageextension 50621 ItemCardExt extends "Item Card"
{
    layout
    {
        addbefore(Blocked) // Image type field can not be shown on Card Page
        {
            field(ItemLogo1; Rec.ItemLogo1)
            {
                Caption = 'ItemLogo1';
                ApplicationArea = All;
            }
        }

        addlast(FactBoxes)
        {
            part(ItemLogoFactBox; "Item Logo FactBox")
            {
                SubPageLink = "No." = FIELD("No.");
                ApplicationArea = All;
            }
        }
    }
}
