pageextension 50664 MyItemCardExt extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            field("Inventory Value"; Rec."InventoryValue")
            {
                ApplicationArea = All;
            }
        }
    }




}

codeunit 50151 ItemSaveHandler
{
    [EventSubscriber(ObjectType::Table, Database::Item, 'OnBeforeModifyEvent', '', true, true)]
    local procedure OnBeforeItemModify(var Rec: Record Item; xRec: Record Item; RunTrigger: Boolean)
    begin
        Rec."InventoryValue" := CalcInventoryValue(Rec);
    end;

    local procedure CalcInventoryValue(Item: Record Item): Decimal
    begin
        case Item."Stockout Warning" of
            Item."Stockout Warning"::Yes:
                exit(Item.Inventory * Item."Unit Cost");
            Item."Stockout Warning"::No:
                exit(Item.Inventory * Item."Unit Cost" + Item."Unit Price" * 0.1);
            else
                exit(0);
        end;
    end;
}