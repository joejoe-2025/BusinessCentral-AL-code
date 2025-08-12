tableextension 51105 InventoryExt extends Item
{
    fields
    {

        field(50450; "DD 999_Qty_OH"; Integer) { Caption = '999 Qty On Hand'; }
        field(50451; "DE 998_Qty_OH"; Code[2]) { Caption = '998 Qty On Hand'; }
    }
}

pageextension 51105 InventoryExt extends "Item Card"
{
    layout
    {

        addlast(InventoryGrp)
        {
            group("Special Inventory Fields")
            {
                Caption = '🔴 Special Inventory Fields';
                field("DD 999_Qty_OH"; Rec."DD 999_Qty_OH") { ApplicationArea = All; StyleExpr = ' Attention'; }
                field("DE 998_Qty_OH"; Rec."DE 998_Qty_OH") { ApplicationArea = All; StyleExpr = ' Attention'; }
            }
        }

    }
}
