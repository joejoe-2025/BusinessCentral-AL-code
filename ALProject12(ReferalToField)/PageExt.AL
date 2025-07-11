pageextension 50145 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Referral Person Code"; Rec."Referral Person Code")
            {
                ApplicationArea = All;
                // 这里可以指定 LookupPageId
                LookupPageId = 14;
            }
        }
    }
}
