pageextension 50102 ItemCardCostExt extends "Item Card"
{
    layout
    {

        addlast("Costs & Posting")
        {
            group(" New Cost Fields")
            {
                Caption = '🔴 New Cost Fields';
                field("Q Purch_UoM_PRICE"; Rec."Q Purch_UoM_PRICE") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("R Purch_UoM_DISC%"; Rec."R Purch_UoM_DISC%") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("S Purch_NET_PRICE_each"; Rec."S Purch_NET_PRICE_each") { ApplicationArea = All; StyleExpr = 'Attention'; }

                field("U FRT%"; Rec."U FRT%") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("V Frt_Amt"; Rec."V Frt_Amt") { ApplicationArea = All; StyleExpr = 'Attention'; }

                field("W DUTY%"; Rec."W DUTY%") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("X Duty_Amt"; Rec."X Duty_Amt") { ApplicationArea = All; StyleExpr = 'Attention'; }

                field("Y FINAL_COST_each"; Rec."Y FINAL_COST_each") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("AE Magstar_LAST_Landed_Cost"; Rec."AE Magstar_LAST_Landed_Cost") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("AF Magstar_Ref_Landed_Cost"; Rec."AF Magstar_Ref_Landed_Cost") { ApplicationArea = All; StyleExpr = 'Attention'; }

                field("Exchange price"; Rec."Exchange price") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("AG Calc_Landed_Cost_each"; Rec."AG Calc_Landed_Cost_each") { ApplicationArea = All; StyleExpr = 'Attention'; }

                field("AH WAC"; Rec."AH WAC") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("AI WAC_is"; Rec."AI WAC_is") { ApplicationArea = All; StyleExpr = 'Attention'; }

                //field("AX Duty%1"; Rec."AX Duty%1") { ApplicationArea = All; StyleExpr = 'Attention'; }
                //field("AY Duty_Amt1"; Rec."AY Duty_Amt1") { ApplicationArea = All; StyleExpr = 'Attention'; }

                //field("BZ Tariff Code"; Rec."BZ Tariff Code") { ApplicationArea = All; StyleExpr = 'Attention'; }
                //field("DB FRT%1"; Rec."DB FRT%1") { ApplicationArea = All; StyleExpr = 'Attention'; }
                //field("DC DUTY%2"; Rec."DC DUTY%2") { ApplicationArea = All; StyleExpr = 'Attention'; }
            }
        }
    }

}
