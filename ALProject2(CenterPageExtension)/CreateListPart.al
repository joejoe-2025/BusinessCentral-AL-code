page 50120 ItemListPart
{
    PageType = List;
    SourceTable = Item;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Our Big Al''s Items';

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
