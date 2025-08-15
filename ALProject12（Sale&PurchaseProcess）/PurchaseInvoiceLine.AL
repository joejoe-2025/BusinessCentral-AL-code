tableextension 50172 PurchInvLineExt extends "Purch. Inv. Line"
{
    fields
    {
        field(50316; "BZ Tariff Code"; Code[50])
        {
            Caption = 'Tariff Code';
        }
        field(50318; "AX Duty%1"; Decimal)
        {
            Caption = 'DUTY%1 (Import)';
            DecimalPlaces = 0 : 5;
        }
        field(50315; "AY Duty_Amt1"; Decimal)
        {
            Caption = 'Duty Amount1 (Based on AV)';
            DecimalPlaces = 0 : 2;
        }
    }
}

codeunit 50192 PurchInvLine_DutySnapshot
{
    // 在“将要写入 Purch. Inv. Line”时，把当时的 Tariff/Duty%1/Duty金额写到 Rec 上
    [EventSubscriber(ObjectType::Table, Database::"Purch. Inv. Line", 'OnBeforeInsertEvent', '', true, true)]
    local procedure PIL_OnBeforeInsert(var Rec: Record "Purch. Inv. Line"; RunTrigger: Boolean)
    var
        ItemRec: Record Item;
        pct: Decimal;
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        // 以“当前 Item 的值”作为历史快照（完全对齐你给的 Sales 模板思路）
        if ItemRec.Get(Rec."No.") then begin
            Rec."BZ Tariff Code" := ItemRec."BZ Tariff Code";
            Rec."AX Duty%1" := ItemRec."AX Duty%1";
        end else begin
            Rec."BZ Tariff Code" := '';
            Rec."AX Duty%1" := 0;
        end;

        pct := Rec."AX Duty%1";

        // 计算金额：以行金额为基数；若要含税基数，换成 Rec."Amount Including VAT"
        Rec."AY Duty_Amt1" := Round(Rec."Line Amount" * pct / 100, 0.01, '=');

        // 关键点：这里不需要 Rec.Modify()，系统随后会把 Rec 插入到表 123
    end;
}


pageextension 50172 PostedPurchInvLineExt extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter("Line Amount")
        {
            field("BZ Tariff Code"; Rec."BZ Tariff Code")
            {
                Caption = '🔴 Tariff Code';
                ApplicationArea = All;
            }
            field("AX Duty%1"; Rec."AX Duty%1")
            {
                Caption = '🔴 Duty%1 (Import)';
                ApplicationArea = All;
                Editable = false;
            }
            field("AY Duty_Amt1"; Rec."AY Duty_Amt1")
            {
                Caption = '🔴 Duty Amount1';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
