// Calculate total Duty amount in Purchase Header
tableextension 50282 PurchHeader_DutyTotalsExt extends "Purchase Header"
{
    fields
    {
        field(50330; "Duty1 Total Amount"; Decimal)
        {
            Caption = '🔵Duty1 Total Amount';
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line"."AY Duty_Amt1"
                              WHERE("Document Type" = FIELD("Document Type"),
                                    "Document No." = FIELD("No.")));
            Editable = false;
            DecimalPlaces = 0 : 2;
        }
    }
}

// Show Duty Total Amount & All included total amount in Purchase Order
pageextension 50283 PurchaseOrder_TotalsExt extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("Duty1 Total Amount"; Rec."Duty1 Total Amount")
            {
                Caption = '🔵Duty1 Total Amount';
                ApplicationArea = All;
                Editable = false;
            }
            field("Grand Total (Incl. VAT + Duty1)"; GrandTotalInclVATWithDuty1)
            {
                Caption = '🔵Grand Total (Incl. VAT + Duty1)';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Amount Including VAT + Duty1 Total Amount.';
            }
        }
    }

    var
        GrandTotalInclVATWithDuty1: Decimal;

    trigger OnOpenPage()
    begin
        Rec.SetAutoCalcFields("Duty1 Total Amount", "Amount Including VAT");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields("Duty1 Total Amount", "Amount Including VAT");
        GrandTotalInclVATWithDuty1 := Rec."Amount Including VAT" + Rec."Duty1 Total Amount";
    end;
}


// Refresh Purchase Order header totals when lines change
pageextension 50286 PO_SubformRefreshExt extends "Purchase Order Subform"
{
    layout
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                CurrPage.Update(false);
            end;
        }
        modify(Quantity)
        {

            trigger OnAfterValidate()
            begin
                CurrPage.Update(false);
            end;

        }
        modify("Direct Unit Cost")
        {
            trigger OnAfterValidate()
            begin
                CurrPage.Update(false);
            end;
        }
        modify("Line Discount %")
        {
            trigger OnAfterValidate()
            begin
                CurrPage.Update(false);
            end;
        }
        modify("Line Discount Amount")
        {
            trigger OnAfterValidate()
            begin
                CurrPage.Update(false);
            end;
        }
    }
}


// Calculate Total Duty in Purch. Inv. Header
tableextension 50284 PurchInvHeader_DutyTotalsExt extends "Purch. Inv. Header"
{
    fields
    {
        field(50330; "Duty1 Total Amount"; Decimal)
        {
            Caption = 'Duty1 Total Amount';
            FieldClass = FlowField;
            CalcFormula = Sum("Purch. Inv. Line"."AY Duty_Amt1"
                              WHERE("Document No." = FIELD("No.")));
            Editable = false;
            DecimalPlaces = 0 : 2;
        }
    }
}


// Show Total Duty and All included Total Amount in Posted Purchase Invoice
pageextension 50285 PostedPurchInvoice_TotalsExt extends "Posted Purchase Invoice"
{
    layout
    {
        addlast(General)
        {
            field("Duty1 Total Amount"; GetDuty1Total())
            {
                Caption = '🔵Duty1 Total Amount';
                ApplicationArea = All;
                Editable = false;
            }
            field("Grand Total (Incl. VAT + Duty1)"; GetGrandInclVATPlusDuty1())
            {
                Caption = '🔵Grand Total (Incl. VAT + Duty1)';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Total Incl. VAT + Duty1 Total Amount.';
            }
        }
    }

    local procedure GetDuty1Total(): Decimal
    var
        H: Record "Purch. Inv. Header";
    begin
        H := Rec;
        H.CalcFields("Duty1 Total Amount");
        exit(H."Duty1 Total Amount");
    end;

    local procedure GetGrandInclVATPlusDuty1(): Decimal
    begin
        Rec.CalcFields("Duty1 Total Amount", "Amount Including VAT");
        exit(Rec."Amount Including VAT" + Rec."Duty1 Total Amount");
    end;
}
