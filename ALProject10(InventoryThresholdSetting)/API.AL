page 50160 "Item Inventory API"
{
    PageType = API;
    APIPublisher = 'custom';
    APIGroup = 'inventoryreplenishment'; // ✅ 建议全部小写（符合 URL 要求）
    APIVersion = 'v1.0';
    EntityName = 'itemInventory';        // ✅ 单数，小写推荐
    EntitySetName = 'itemInventories';   // ✅ 复数，小写推荐

    SourceTable = Item;
    DelayedInsert = true;
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Number"; Rec."No.") { Caption = 'Item No.'; }
                field("Description"; Rec."Description") { }
                field("Inventory"; Rec."Inventory") { }
                field("InventoryThreshold"; Rec."Inventory Threshold") { }
                field("MaximumInventory"; Rec."Maximum Inventory") { }
                field("RestockQuantity"; Rec."RestockQuantity") { }
            }
        }
    }
}
