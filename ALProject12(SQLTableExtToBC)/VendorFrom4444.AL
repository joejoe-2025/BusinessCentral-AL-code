tableextension 51106 Vendor444 extends Item
{
    fields
    {


        // 🔴 Vendor from 4444
        field(50460; "DP Vendor Key in 4444"; Code[50]) { Caption = 'Vendor Key in 4444'; }
        field(50461; "DQ Vendor Code in 4444"; Code[50]) { Caption = 'Vendor Code in 4444'; }
        field(50462; "DR Vendor Name in 4444"; Text[255]) { Caption = 'Vendor Name in 4444'; }
        field(50463; "DS Vendor Rank in 4444"; Integer) { Caption = 'Vendor Rank in 4444'; }
        field(50464; "DT Date Listed in 4444"; Date) { Caption = 'Date Listed in 4444'; }
        field(50465; "DU Add the RAnnnn Vendor to 4444"; Boolean) { Caption = 'Add Vendor to 4444'; }
    }
}

pageextension 51106 Vendor444 extends "Item Card"
{
    layout
    {
        addafter("Replenishment")
        {
            group("🔴 Vendor from 4444")
            {
                field("DP Vendor Key in 4444"; Rec."DP Vendor Key in 4444") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DQ Vendor Code in 4444"; Rec."DQ Vendor Code in 4444") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DR Vendor Name in 4444"; Rec."DR Vendor Name in 4444") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DS Vendor Rank in 4444"; Rec."DS Vendor Rank in 4444") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DT Date Listed in 4444"; Rec."DT Date Listed in 4444") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DU Add the RAnnnn Vendor to 4444"; Rec."DU Add the RAnnnn Vendor to 4444") { ApplicationArea = All; StyleExpr = 'Attention'; }
            }
        }
    }
}