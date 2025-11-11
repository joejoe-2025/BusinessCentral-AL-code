pageextension 50145 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Referral Person Code"; Rec."Referral Person Code")
            {
                ApplicationArea = All;
                
                LookupPageId = 14;
            }
        }
    }
}
