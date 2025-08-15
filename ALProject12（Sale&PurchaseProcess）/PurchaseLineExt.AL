tableextension 50190 PurchaseLineExt extends "Purchase Line"
{
    fields
    {
        // 实时显示：来自 Item 的 Tariff Code（不落库）
        field(50316; "BZ Tariff Code"; Code[50])
        {
            Caption = 'Tariff Code';
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."BZ Tariff Code" WHERE("No." = FIELD("No.")));
            Editable = false;
        }

        // 实时显示：来自 Item 的 DUTY%1 (Import)（不落库）
        field(50318; "AX Duty%1"; Decimal)
        {
            Caption = 'DUTY%1 (Import)';
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AX Duty%1" WHERE("No." = FIELD("No.")));
            Editable = false;
            DecimalPlaces = 0 : 5;
        }

        // 金额为实存字段：用于过账保留历史
        field(50315; "AY Duty_Amt1"; Decimal)
        {
            Caption = 'Duty Amount1 (Based on AV)';
            DecimalPlaces = 0 : 2;
        }
    }
}

pageextension 50191 PurchOrderLineExt extends "Purchase Order Subform"
{
    layout
    {
        addafter("Line Amount")
        {
            field("BZ Tariff Code"; Rec."BZ Tariff Code")
            {
                Caption = '🔴 Tariff Code';
                ApplicationArea = All;
                ToolTip = 'Tariff code from Item.';
            }
            field("AX Duty%1"; Rec."AX Duty%1")
            {
                Caption = '🔴 Duty%1 (Import)';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Duty%1 resolved from Item/Tariff.';
            }
            field("AY Duty_Amt1"; Rec."AY Duty_Amt1")
            {
                Caption = '🔴 Duty Amount1';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Line Amount * Duty%1 / 100.';
            }
        }
    }
}
