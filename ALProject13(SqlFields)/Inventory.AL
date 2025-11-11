tableextension 53230 ItemInventoryExt extends Item
{
    fields
    {
        field(53330; "in 998"; Boolean)
        {
            Caption = 'in 998';
            DataClassification = ToBeClassified;

        }
    }
}
pageextension 53230 ItemInventoryExt extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            group("🟦 In 998")
            {
                Caption = '🟦  In 998';



                field("in 998"; Rec."in 998") { ApplicationArea = All; }

            }
        }
    }
}

page 53231 "Item Inventory API"
{
    PageType = API;
    Caption = 'Item Inventory API';
    APIPublisher = 'bigals';
    APIGroup = 'ItemFields';
    APIVersion = 'v1.0';
    EntityName = 'itemInventory';
    EntitySetName = 'itemInventories';
    SourceTable = Item;
    ODataKeyFields = SystemId; // 用 SystemId 作主键更稳
    DelayedInsert = true;
    Extensible = false;

    // 是否允许改写（按需收紧）
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = false; // 一般不允许通过此 API 删除 Item

    layout
    {
        area(content)
        {
            // —— 主键/关键字段 ——
            field(id; Rec.SystemId)
            {
                Caption = 'SystemId';
                Editable = false;
            }
            field(no; Rec."No.")
            {
                Caption = 'No.';
            }

            // —— 53230 中的自定义字段 ——
            field(in998; Rec."in 998")
            {
                Caption = 'in 998';
                // Power Automate 里用 true/false
            }
        }
    }

}
