query 56663 "Top 5 Customer"
{
    Caption = 'Top 5 Customer';
    QueryType = Normal;
    TopNumberOfRows = 5;
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
