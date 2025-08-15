report 50150 "Custom Sales Posted Invoice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Custom Paper Invoice';
    DefaultLayout = Word;
    WordLayout = 'SalesCustomPaper.docx';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No."; // Allow filtering by invoice number

            column(InvoiceNo; "No.") { }
            column(BillToName; "Bill-to Name") { }
            column(DocumentDate; "Document Date") { }
            column(AmountInclVAT; "Amount Including VAT") { }
            column(Duty2_Total_Amount; "Duty2 Total Amount") { }


            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(LineNo; "Line No.") { }
                column(ItemNo; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(UnitPrice; "Unit Price") { }
                column(BZ_Tariff_Code; "BZ Tariff Code") { }
                column(DC_DUTY_2; "DC DUTY%2") { }
                column(DutyAmt2; "AY Duty_Amt2") { }
                column(LineInclVAT; "Amount Including VAT") { }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field("Show Logo"; ShowLogo) { ApplicationArea = All; }
                }
            }
        }
        actions { }
    }

    var
        ShowLogo: Boolean;
}
