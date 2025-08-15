tableextension 50171 SalesInvLineExt extends "Sales Invoice Line"
{
    fields
    {
        field(50316; "BZ Tariff Code"; Code[50]) { Caption = 'Tariff Code'; }
        field(50314; "DC DUTY%2"; Decimal) { Caption = 'DUTY%2(Export)'; DecimalPlaces = 0 : 5; }
        field(50315; "AY Duty_Amt2"; Decimal) { Caption = 'Duty Amount2(Based on AV)'; DecimalPlaces = 0 : 2; }
    }
}
codeunit 50172 PostToInvoice_DutySnapshot
{
    // 在“将要写入 Sales Invoice Line”时，把当时的 Tariff/Duty%2/Duty金额写到 Rec 上
    [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Line", 'OnBeforeInsertEvent', '', true, true)]
    local procedure SIL_OnBeforeInsert(var Rec: Record "Sales Invoice Line"; RunTrigger: Boolean)
    var
        ItemRec: Record Item;
        pct: Decimal;
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        // 以“当前 Item 的值”作为历史快照（也可改成从来源 Sales Line 取，见下方说明）
        if ItemRec.Get(Rec."No.") then begin
            Rec."BZ Tariff Code" := ItemRec."BZ Tariff Code";
            Rec."DC DUTY%2" := ItemRec."DC DUTY%2";
        end else begin
            Rec."BZ Tariff Code" := '';
            Rec."DC DUTY%2" := 0;
        end;

        pct := Rec."DC DUTY%2";

        // 计算金额：以行金额为基数；若要含税基数，换成 Rec."Amount Including VAT"
        Rec."AY Duty_Amt2" := Round(Rec."Line Amount" * pct / 100, 0.01, '=');

        // 关键点：这里不需要 Rec.Modify()，系统随后会把 Rec 插入到表 113
    end;
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
