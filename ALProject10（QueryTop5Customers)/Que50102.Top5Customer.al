query 56663 "Top Customer"
{
    Caption = 'Top Customer';
    QueryType = Normal;
    TopNumberOfRows = 10;
    OrderBy = descending(SalesLCY);
    QueryCategory = 'Customer List';

    elements
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {
            filter(Posting_Date; "Posting Date")
            {

            }
            column(CustomerName; "Customer Name")
            {
            }
            column(Amount; Amount)
            {
            }
            column(DebitAmount; "Debit Amount")
            {
            }
            column(Description; Description)
            {
            }
            column(SalesLCY; "Sales (LCY)")
            {
                Method = Sum;
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
