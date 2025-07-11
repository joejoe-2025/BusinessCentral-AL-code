pageextension 50127 SalesOrderPageExt extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field(ProcessedDateTime; Rec.ProcessedDateTime)
            {
                ApplicationArea = All;
            }
        }
    }
}
