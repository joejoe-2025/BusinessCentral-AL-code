pageextension 51101 ItemCardExt extends "Item Card"
{
    layout
    {

        addlast(Item)
        {
            group("New fields needed")
            {
                Caption = '🔴 New Fields Needed'; // 显示红色圆点模拟“红色提示”



                field("F Desc_Length"; Rec."F Desc_Length")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("G First 30 chars"; Rec."G First 30 chars")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("H Next 10 chars"; Rec."H Next 10 chars")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("I UPC"; Rec."I UPC")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("J ASWO#"; Rec."J ASWO#")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("K Item_Status"; Rec."K Item_Status")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("L Sell_UoM"; Rec."L Sell_UoM")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("M Xfer_UoM"; Rec."M Xfer_UoM")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("N Xfer_UNITS"; Rec."N Xfer_UNITS")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("BW Web_Item"; Rec."BW Web_Item")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("BX Item#"; Rec."BX Item#")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("CV FINAL Prod ID"; Rec."CV FINAL Prod ID")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("DF Current PetSave Web flag"; Rec."DF Current PetSave Web flag")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("DG PetSave Website Y/N"; Rec."DG PetSave Website Y/N")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("DH Set PetSave Web Flag"; Rec."DH Set PetSave Web Flag")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }

                field("DK Admin Cells Chgd"; Rec."DK Admin Cells Chgd")
                {
                    ApplicationArea = All;
                    StyleExpr = 'Attention';
                }


            }
        }
    }

}
