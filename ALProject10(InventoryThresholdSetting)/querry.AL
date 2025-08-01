query 52100 "Low Inventory Items"
{
    QueryType = Normal;
    QueryCategory = 'Inventory';

    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Inventory; Inventory)
            {
            }
            column(InventoryThreshold; "Inventory Threshold")
            {
            }
            column(MaxInventory; "Maximum Inventory")
            {
            }
        }
    }

    //filter(Item."Inventory Threshold"; <> 0)尚未完成
}
