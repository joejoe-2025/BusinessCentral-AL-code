pageextension 50109 ItemCardExt_CustomFields extends "Item Card"
{
    layout
    {
        // 将 SubCategory、Brand、WebCode、Size、Product Group、Components 插入 Item FastTab
        addafter("Manufacturer Code")
        {

            field("Category"; rec."Category")
            {
                ApplicationArea = All;
            }
            field("SubCategory"; rec."SubCategory") { ApplicationArea = All; }
            field("Parent Item"; Rec."Parent Item")
            {
                ApplicationArea = All;
            }
            field("Brand"; rec."Brand") { ApplicationArea = All; }

            field("Product Size"; Rec."Product Size") { ApplicationArea = All; }
            field("Product Group"; rec."Product Group") { ApplicationArea = All; }
            field("Related Item Group"; Rec.RelatedItemGroup) { ApplicationArea = All; }
            field("Components"; rec."Components") { ApplicationArea = All; }
            field("AvailableRetail"; rec."AvailableRetail")
            {
                ApplicationArea = All;
            }
            field("AvailableSalesCenter"; Rec."AvailableSalesCenter")
            {
                ApplicationArea = All;
            }
            field("WebCode"; rec."WebCode") { ApplicationArea = All; }
            field("AvailableWeb"; rec."AvailableWeb")
            {
                ApplicationArea = All;
            }

        }

        // Duty 字段加在 Costs & Posting FastTab → Foreign Trade 区下方
        addafter("Tariff No.")
        {
            group("Duties & Tariffs")
            {
                field("Duty %"; rec."Duty %") { ApplicationArea = All; }
                field("Tariff %"; rec."Tariff %") { ApplicationArea = All; }
                field("Fixed Duty Amount"; rec."Fixed Duty Amount") { ApplicationArea = All; }
                field("Tariff Code"; rec."Tariff Code") { ApplicationArea = All; }
            }
        }
    }
}
