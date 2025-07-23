pageextension 50664 MyItemCardExt extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            field("Inventory Value"; Rec."Inventory Value")
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec."Inventory Value" := CalcInventoryValue();
    end;

    local procedure CalcInventoryValue(): Decimal
    begin
        exit(Rec.Inventory * Rec."Unit Price");
    end;
}
