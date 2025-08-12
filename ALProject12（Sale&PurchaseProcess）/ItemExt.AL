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
            begin
                Rec."DC DUTY%2" := 0;
                if Rec."BZ Tariff Code" <> '' then
                    if TariffSetup.Get(Rec."BZ Tariff Code") then
                        Rec."DC DUTY%2" := TariffSetup."Duty%2";
            end;
        }

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
                ApplicationArea = all;
                StyleExpr = 'Favorable';
            }

            field("DC DUTY%2"; Rec."DC DUTY%2")
            {
                Caption = '🔴 Duty2（Export）';
                ApplicationArea = all;
                StyleExpr = 'Favorable';
            }
        }
    }


}