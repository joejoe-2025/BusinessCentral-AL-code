pageextension 50101 ItemCardReplenishmentExt extends "Item Card"
{
    layout
    {

        addlast(Replenishment)
        {
            group(" New Replenishment Fields")
            {
                Caption = '🔴New Replenishment Fields';
                field("B NAME"; Rec."B NAME") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("P Purch_UNITS"; Rec."P Purch_UNITS") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BK Purch_UoM1"; Rec."BK Purch_UoM1") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BL Purch_Units1"; Rec."BL Purch_Units1") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BM Disc%"; Rec."BM Disc%") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BN Purch_UoM2"; Rec."BN Purch_UoM2") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BO Purch_Units2"; Rec."BO Purch_Units2") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BP Disc%1"; Rec."BP Disc%1") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BQ DATE_CHANGED"; Rec."BQ DATE_CHANGED") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BR 1 YR FREE"; Rec."BR 1 YR FREE") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BS 2 YR"; Rec."BS 2 YR") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BT 3 YR"; Rec."BT 3 YR") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BU Notes"; Rec."BU Notes") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("BY Vendor_Rank"; Rec."BY Vendor_Rank") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CB FDA"; Rec."CB FDA") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CX Purch_UoM3"; Rec."CX Purch_UoM3") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CY Purch_UNITS3"; Rec."CY Purch_UNITS3") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CZ Purch_UoM_PRICE1"; Rec."CZ Purch_UoM_PRICE1") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DA Purch_UoM_DISC%1"; Rec."DA Purch_UoM_DISC%1") { ApplicationArea = All; StyleExpr = 'Attention'; }
            }
        }
    }

}
