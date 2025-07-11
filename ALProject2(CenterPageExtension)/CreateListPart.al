page 50120 ItemListPart
{
    PageType = ListPart;
    SourceTable = Item;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Top Items';

    layout
    {
        area(Content)
        {
            repeater(ItemList)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Inventory; Rec.Inventory) { ApplicationArea = All; }
            }
        }
    }
}
