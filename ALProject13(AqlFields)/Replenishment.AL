tableextension 53130 ItemReplenishmentExt extends Item
{
    fields
    {
        field(53230; "Purch UoM1"; Code[10])
        {
            Caption = 'Purch UoM1';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";  // 可选，如果你希望下拉选择 BC 里的计量单位
        }

        field(53231; "Purch UoM2"; Code[10])
        {
            Caption = 'Purch UoM2';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }

        field(53232; "Mfg Code for Country of Origin"; Code[10])
        {
            Caption = 'Mfg Code for Country of Origin';
            DataClassification = ToBeClassified;

        }
    }
}
pageextension 53130 ItemCardReplenishmentExt extends "Item Card"
{
    layout
    {
        addlast(Replenishment)
        {
            group("🟦 Additional Purch UoM")
            {
                Caption = '🟦 Additional Purch UoM';


                field("Purch UoM1"; Rec."Purch UoM1") { ApplicationArea = All; }
                field("Purch UoM2"; Rec."Purch UoM2") { ApplicationArea = All; }
                field("Mfg Code for Country of Origin"; Rec."Mfg Code for Country of Origin") { ApplicationArea = All; }

            }
        }
    }
}
