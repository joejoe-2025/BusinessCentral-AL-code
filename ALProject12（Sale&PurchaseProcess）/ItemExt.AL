tableextension 51143 ItemCostPostingExt extends Item
{
    fields
    {
        field(50316; "BZ Tariff Code"; Code[50])
        {
            Caption = 'Tariff Code';
            TableRelation = "Tariff Duty Setup"."Tariff Code";

            trigger OnValidate()
            var
                TariffSetup: Record "Tariff Duty Setup";
                NewDuty1: Decimal;
                NewDuty2: Decimal;
            begin
                NewDuty1 := 0;
                NewDuty2 := 0;

                if Rec."BZ Tariff Code" <> '' then
                    if TariffSetup.Get(Rec."BZ Tariff Code") then begin
                        NewDuty1 := TariffSetup."Duty%1";
                        NewDuty2 := TariffSetup."Duty%2";
                    end;

                Rec."AX Duty%1" := NewDuty1;
                Rec."DC DUTY%2" := NewDuty2;
            end;
        }

        // ✅ 新增：采购用 Import Duty
        field(50319; "AX Duty%1"; Decimal)
        {
            Caption = 'DUTY%1(Import)';
            DecimalPlaces = 0 : 5;
        }

        // ✅ 你已有的 Export Duty
        field(50318; "DC DUTY%2"; Decimal)
        {
            Caption = 'DUTY%2(Export)';
            DecimalPlaces = 0 : 5;
        }
    }
}


pageextension 50144 MyExtension extends "Item Card"
{
    layout
    {
        addlast("Costs & Posting")
        {
            field("BZ Tariff Code"; Rec."BZ Tariff Code")
            {
                Caption = '🔴 Tariff Code';
                ApplicationArea = All;
                StyleExpr = 'Favorable';
            }

            field("AX Duty%1"; Rec."AX Duty%1")
            {
                Caption = '🔴 Duty1 (Import)';
                ApplicationArea = All;
                StyleExpr = 'Favorable';
                Editable = false;
            }

            field("DC DUTY%2"; Rec."DC DUTY%2")
            {
                Caption = '🔴 Duty2 (Export)';
                ApplicationArea = All;
                StyleExpr = 'Favorable';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        RefreshDutiesFromTariff();
    end;

    local procedure RefreshDutiesFromTariff()
    var
        TariffSetup: Record "Tariff Duty Setup";
        NewDuty1: Decimal;
        NewDuty2: Decimal;
        NeedModify: Boolean;
    begin
        NewDuty1 := 0;
        NewDuty2 := 0;
        NeedModify := false;

        if Rec."BZ Tariff Code" <> '' then
            if TariffSetup.Get(Rec."BZ Tariff Code") then begin
                NewDuty1 := TariffSetup."Duty%1";
                NewDuty2 := TariffSetup."Duty%2";
            end;

        if Rec."AX Duty%1" <> NewDuty1 then begin
            Rec."AX Duty%1" := NewDuty1;
            NeedModify := true;
        end;

        if Rec."DC DUTY%2" <> NewDuty2 then begin
            Rec."DC DUTY%2" := NewDuty2;
            NeedModify := true;
        end;

        if NeedModify then begin
            // 仅在值确实变化时写库，避免循环与不必要触发
            if CurrPage.Editable then
                Rec.Modify(false);
            CurrPage.Update(false);
        end;
    end;
}
