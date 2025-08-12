tableextension 51107 AdditionalInfo extends Item
{
    fields
    {

        // 🔴 Other Information
        field(50470; "BV Mfg Warranty"; Code[50]) { Caption = 'Mfg Warranty'; }
        field(50471; "CA Mfg_Code"; Code[50]) { Caption = 'Mfg Code'; }
        field(50472; "CJ b1"; Code[10]) { Caption = 'b1'; }
        field(50473; "CK b2"; Code[10]) { Caption = 'b2'; }
        field(50474; "CL b3"; Code[10]) { Caption = 'b3'; }
        field(50475; "CM b4"; Code[10]) { Caption = 'b4'; }
        field(50476; "CN b5"; Code[10]) { Caption = 'b5'; }
        field(50477; "CO b6"; Code[10]) { Caption = 'b6'; }
        field(50478; "CP b7"; Code[10]) { Caption = 'b7'; }
        field(50479; "CQ b8"; Code[10]) { Caption = 'b8'; }
        field(50480; "CR b9"; Code[10]) { Caption = 'b9'; }
        field(50481; "CS b10"; Code[10]) { Caption = 'b10'; }
        field(50482; "CT b11"; Code[10]) { Caption = 'b11'; }
        field(50483; "CU b12"; Code[10]) { Caption = 'b12'; }
        field(50484; "CW b13"; Code[10]) { Caption = 'b13'; }
        field(50485; "DI F113"; Code[50]) { Caption = 'F113'; }
        field(50486; "DJ F114"; Code[50]) { Caption = 'F114'; }
        field(50487; "DM F117"; Code[50]) { Caption = 'F117'; }
        field(50488; "DN F118"; Code[50]) { Caption = 'F118'; }
        field(50489; "DO F119"; Code[50]) { Caption = 'F119'; }
    }
}

pageextension 51107 AddtionInfo extends "Item Card"
{
    layout
    {
        addlast(Content)
        {
            group("🔴 Other Information")
            {
                field("BV Mfg Warranty"; Rec."BV Mfg Warranty") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CA Mfg_Code"; Rec."CA Mfg_Code") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CJ b1"; Rec."CJ b1") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CK b2"; Rec."CK b2") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CL b3"; Rec."CL b3") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CM b4"; Rec."CM b4") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CN b5"; Rec."CN b5") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CO b6"; Rec."CO b6") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CP b7"; Rec."CP b7") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CQ b8"; Rec."CQ b8") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CR b9"; Rec."CR b9") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CS b10"; Rec."CS b10") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CT b11"; Rec."CT b11") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CU b12"; Rec."CU b12") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("CW b13"; Rec."CW b13") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DI F113"; Rec."DI F113") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DJ F114"; Rec."DJ F114") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DM F117"; Rec."DM F117") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DN F118"; Rec."DN F118") { ApplicationArea = All; StyleExpr = 'Attention'; }
                field("DO F119"; Rec."DO F119") { ApplicationArea = All; StyleExpr = 'Attention'; }
            }
        }
    }
}
