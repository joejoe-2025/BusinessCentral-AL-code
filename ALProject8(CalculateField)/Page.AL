pageextension 50664 MyItemCardExt extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            field("Inventory Value"; InventoryValue)
            {
                ApplicationArea = All;
                Caption = 'Inventory Value (Calculated)';
                Editable = false;
            }
        }
    }

    var
        InventoryValue: Decimal;

    trigger OnAfterGetRecord()
    begin
        InventoryValue := CalcInventoryValue(Rec);
    end;

    local procedure CalcInventoryValue(Item: Record Item): Decimal
    begin
        case Item."Stockout Warning" of
            Item."Stockout Warning"::Yes:
                exit(Item.Inventory * Item."Unit Price");
            Item."Stockout Warning"::No:
                exit(Item.Inventory * Item."Unit Price" + Item."Unit Price" * 0.1);
            else
                exit(Item.Inventory * Item."Unit Price" + Item."Unit Price" * 0.1 + Item."Unit Cost");
        end;
    end;
}
