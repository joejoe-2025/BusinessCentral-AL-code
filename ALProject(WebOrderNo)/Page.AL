pageextension 50111 SalesOrderCardExt extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("Web Order No."; Rec."Web Order No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
