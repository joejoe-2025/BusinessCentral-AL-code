tableextension 50171 SalesInvLineExt extends "Sales Invoice Line"
{
    fields
    {
        field(50316; "BZ Tariff Code"; Code[50]) { Caption = 'Tariff Code'; }
        field(50314; "DC DUTY%2"; Decimal) { Caption = 'DUTY%2(Export)'; DecimalPlaces = 0 : 5; }
        field(50315; "AY Duty_Amt2"; Decimal) { Caption = 'Duty Amount2(Based on AV)'; DecimalPlaces = 0 : 2; }
    }
}

pageextension 50171 PostedSalesInvoiceLineExt extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Line Amount")
        {
            field("BZ Tariff Code"; Rec."BZ Tariff Code")
            {
                Caption = '🔴Tafiff Code';
                ApplicationArea = All;
            }
            field("DC DUTY%2"; Rec."DC DUTY%2")
            {
                ApplicationArea = All;
            }
            field("AY Duty_Amt2"; Rec."AY Duty_Amt2")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
