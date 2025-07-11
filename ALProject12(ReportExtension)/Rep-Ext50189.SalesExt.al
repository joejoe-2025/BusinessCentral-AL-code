namespace ALProjectReportExtension.ALProjectReportExtension;

using Microsoft.Inventory.Reports;

reportextension 50189 SalesExt extends "Item List"
{
    dataset
    {
        add(Item)
        {
            column(AllowInvoiceDisc; "Allow Invoice Disc.")
            {
            }
            column(AssemblyBOM; "Assembly BOM")
            {
            }
            column(BlockReason; "Block Reason")
            {
            }
            column(Blocked; Blocked)
            {
            }
        }
    }
    rendering
    {
        layout(Layout1)
        {
            Type = RDLC;
            LayoutFile = 'ItemList.rdlc';
        }
    }
    var
        DisplayMessage: Label 'Extended Report Version';
}
