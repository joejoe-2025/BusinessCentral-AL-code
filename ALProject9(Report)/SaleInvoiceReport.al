report 50199 "Sales Invoice Report"
{
    ApplicationArea = All;
    Caption = 'Sales Invoice Report';
    UsageCategory = ReportsAndAnalysis;

    WordLayout = 'Sales Invoice.docx';
    DefaultLayout = Word;
    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            column(Amount; Amount)
            {
            }

            column(DueDate; "Due Date")
            {
            }
            column(InvoiceDiscountAmount; "Invoice Discount Amount")
            {
            }
            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }
        }
    }

}
