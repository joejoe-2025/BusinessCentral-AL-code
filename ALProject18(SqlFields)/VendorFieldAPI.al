page 53120 "Item Vendor API"
{
    PageType = API;
    Caption = 'Item Vendor API';
    APIPublisher = 'joe';
    APIGroup = 'ItemFieldsFromSQL';
    APIVersion = 'v1.0';
    EntityName = 'itemVendor';
    EntitySetName = 'itemVendors';
    SourceTable = Item;
    DelayedInsert = true;

    layout
    {
        area(content)
        {

            field(Description; Rec.Description)
            {
                Caption = 'Description';
            }
            field("VendorNo"; Rec."Vendor No.")
            {
                Caption = 'Vendor No.';
            }
            field("VendorItemNo"; Rec."Vendor Item No.")
            {
                Caption = 'Vendor Item No.';
            }

            field(Inventory; Rec.Inventory)
            {
                Caption = 'Inventory';
            }

        }
    }

}
