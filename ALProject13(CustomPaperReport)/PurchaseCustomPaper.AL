report 50201 "Custom Posted Purchase Invoice"
{
    Caption = 'Custom Posted Purchase Invoice';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    DefaultLayout = Word;
    WordLayout = 'PurchaseCustomPaper.docx';


    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.";

            // Header columns
            column(InvoiceNo; "No.") { }
            column(VendorName; "Buy-from Vendor Name") { }
            column(PostingDate; "Posting Date") { }
            column(AmountInclVAT; "Amount Including VAT") { }
            column(Duty1_Total_Amount; "Duty1 Total Amount") { }

            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = FIELD("No.");

                // Line columns
                column(LineNo; "Line No.") { }
                column(ItemNo; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(DirectUnitCost; "Direct Unit Cost") { }
                column(LineInclVAT; "Amount Including VAT") { }

                // Duty1 (Import) - 已过账行上的历史快照
                column(BZ_Tariff_Code; "BZ Tariff Code") { }
                column(AX_DUTY_1; "AX Duty%1") { }
                column(DutyAmt1; "AY Duty_Amt1") { }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
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