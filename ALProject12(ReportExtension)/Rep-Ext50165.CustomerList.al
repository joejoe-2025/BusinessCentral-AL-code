namespace ALProjectReportExtension.ALProjectReportExtension;

using Microsoft.Sales.Reports;

reportextension 50165 CustomerList extends "Customer - List"
{

    dataset
    {
        add(Customer)
        {
            column(Address; Address)
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(DisplayMessage; DisplayMessage)
            {

            }
        }
    }

    rendering
    {
        layout(Layout1)
        {
            Type = RDLC;
            LayoutFile = 'CustomerList11.rdlc';
        }
    }
    var
        DisplayMessage: Label 'Extended Report Version';
}
