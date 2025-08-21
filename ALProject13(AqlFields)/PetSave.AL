tableextension 53140 ItemPetSaveExt extends Item
{
    fields
    {
        field(53240; "PetSaveXferUoM"; Code[10])
        {
            Caption = 'PetSave Xfer UoM';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }

        field(53241; "PetSaveXferUnits"; Integer)
        {
            Caption = 'PetSave Xfer Units';
            DataClassification = ToBeClassified;
        }

        field(53242; "PetSave Dist Price"; Decimal)
        {
            Caption = 'PetSave Dist Price';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }

        field(53243; "Disc% off PetSave Dist Price"; Decimal)
        {
            Caption = 'Disc% off PetSave Dist Price';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }

        field(53244; "PetSave PROMO Dist Price"; Decimal)
        {
            Caption = 'PetSave PROMO Dist Price';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }

        field(53245; "PetSave 5% above PROMO WP"; Decimal)
        {
            Caption = 'PetSave 5% above PROMO WP';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }

        field(53246; "PetSave Promo Disc% Start Date"; Date)
        {
            Caption = 'PetSave Promo Disc% Start Date';
            DataClassification = ToBeClassified;
        }

        field(53247; "PetSave Promo Disc% End Date"; Date)
        {
            Caption = 'PetSave Promo Disc% End Date';
            DataClassification = ToBeClassified;
        }
    }
}

pageextension 53140 ItemCardPetSaveExt extends "Item Card"
{
    layout
    {
        addlast(Content)
        {
            group("🟪 PetSave Settings")
            {
                Caption = '🟪 PetSave Settings';


                field("PetSaveXferUoM"; Rec."PetSaveXferUoM") { ApplicationArea = All; }
                field("PetSaveXferUnits"; Rec."PetSaveXferUnits") { ApplicationArea = All; }

                field("PetSave Dist Price"; Rec."PetSave Dist Price") { ApplicationArea = All; }
                field("Disc% off PetSave Dist Price"; Rec."Disc% off PetSave Dist Price") { ApplicationArea = All; }
                field("PetSave PROMO Dist Price"; Rec."PetSave PROMO Dist Price") { ApplicationArea = All; }
                field("PetSave 5% above PROMO WP"; Rec."PetSave 5% above PROMO WP") { ApplicationArea = All; }

                field("PetSave Promo Disc% Start Date"; Rec."PetSave Promo Disc% Start Date") { ApplicationArea = All; }
                field("PetSave Promo Disc% End Date"; Rec."PetSave Promo Disc% End Date") { ApplicationArea = All; }
            }
        }
    }
}
