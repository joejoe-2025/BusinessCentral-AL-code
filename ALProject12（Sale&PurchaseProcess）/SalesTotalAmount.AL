//Show Line Total Amount(Incl. VAT + Duty2) on Sales Order Line
pageextension 50180 SalesOrderLine_TotalExt extends "Sales Order Subform"
{
    layout
    {
        addafter("Amount Including VAT")
        {
            field("Incl. VAT + Duty2"; LineInclVATPlusDuty2)
            {
                Caption = '🔴Incl. VAT + Duty2';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Amount Including VAT + Duty Amount2.';
            }
        }
    }

    var
        LineInclVATPlusDuty2: Decimal;

    trigger OnAfterGetRecord()
    begin

        LineInclVATPlusDuty2 := Rec."Amount Including VAT" + Rec."AY Duty_Amt2";
    end;
}

//Show Line Total Amount(Incl. VAT + Duty2) on Posted Sales Invoice Line
pageextension 50181 PostedInvLine_TotalExt extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Amount Including VAT")
        {
            field("Incl. VAT + Duty2"; LineInclVATPlusDuty2)
            {
                Caption = '🔴Incl. VAT + Duty2';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    var
        LineInclVATPlusDuty2: Decimal;

    trigger OnAfterGetRecord()
    begin
        LineInclVATPlusDuty2 := Rec."Amount Including VAT" + Rec."AY Duty_Amt2";
    end;
}

//Calculate total Duty amount in Sales Header
tableextension 50182 SalesHeader_DutyTotalsExt extends "Sales Header"
{
    fields
    {
        field(50330; "Duty2 Total Amount"; Decimal)
        {
            Caption = '🔴Duty2 Total Amount';
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."AY Duty_Amt2"
                              WHERE("Document Type" = FIELD("Document Type"),
                                    "Document No." = FIELD("No.")));
            Editable = false;
            DecimalPlaces = 0 : 2; // ← 去掉空格
        }
    }
}

//Show Duty Total Amount & All included total amount in Sales Order


pageextension 50183 SalesOrder_TotalsExt extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("Duty2 Total Amount"; Rec."Duty2 Total Amount")
            {
                Caption = '🔴Duty2 Total Amount';
                ApplicationArea = All;
                Editable = false;
            }
            field("Grand Total (Incl. VAT + Duty2)"; GrandTotalInclVATWithDuty2)
            {
                Caption = '🔴"Grand Total (Incl. VAT + Duty2)';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    var
        GrandTotalInclVATWithDuty2: Decimal;

    trigger OnOpenPage()
    begin
        // 让读取记录时自动计算这些 FlowField
        Rec.SetAutoCalcFields("Duty2 Total Amount", "Amount Including VAT");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        // 保守再算一次（确保值最新）
        Rec.CalcFields("Duty2 Total Amount", "Amount Including VAT");
        GrandTotalInclVATWithDuty2 := Rec."Amount Including VAT" + Rec."Duty2 Total Amount";
    end;
}

pageextension 50186 SO_SubformRefreshExt extends "Sales Order Subform"
{
    layout
    {
        // 放在 layout{} 里面！
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

        modify("Unit Price")
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

//Calculate Total Duty in Sales Invoice Header
tableextension 50184 SalesInvHeader_DutyTotalsExt extends "Sales Invoice Header"
{
    fields
    {
        field(50330; "Duty2 Total Amount"; Decimal)
        {
            Caption = 'Duty2 Total Amount';
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Invoice Line"."AY Duty_Amt2"
                              WHERE("Document No." = FIELD("No.")));
            Editable = false;
            DecimalPlaces = 0 : 2; // ← 去掉空格
        }
    }
}
//Show Total Duty and All included Total Amount in Sales Invoice

pageextension 50185 PostedSalesInvoice_TotalsExt extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("Duty2 Total Amount"; GetDuty2Total())
            {
                Caption = '🔴Duty2 Total Amount';
                ApplicationArea = All;
                Editable = false;
            }
            field("Grand Total (Incl. VAT + Duty2)"; GetGrandInclVATPlusDuty2())
            {
                Caption = '🔴Grand Total (Incl. VAT + Duty2)';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Total Incl. VAT (CAD) + Duty2 Total Amount.';
            }
        }
    }

    local procedure GetDuty2Total(): Decimal
    var
        H: Record "Sales Invoice Header";
    begin
        H := Rec;
        H.CalcFields("Duty2 Total Amount");
        exit(H."Duty2 Total Amount");
    end;

    local procedure GetGrandInclVATPlusDuty2(): Decimal
    var
        H: Record "Sales Invoice Header";
    begin
        // 发票头上的 Amount Including VAT 通常是普通字段；CalcFields 只算 Duty 总额即可
        Rec.CalcFields("Duty2 Total Amount", "Amount Including VAT");
        exit(Rec."Amount Including VAT" + Rec."Duty2 Total Amount");
    end;
}









