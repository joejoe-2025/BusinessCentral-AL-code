tableextension 53110 ItemPriceSalesExt extends Item
{
    fields
    {
        // —— Promo 折扣与净价 ——
        field(53000; "FINAL PROMO DISC%"; Decimal) { Caption = 'FINAL PROMO DISC%'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53001; "PROMO NET PRICE each"; Decimal) { Caption = 'PROMO NET PRICE each'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53002; "Packing Charge"; Decimal) { Caption = 'Packing Charge'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53003; "Commission%"; Decimal) { Caption = 'Commission%'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }

        // —— US Retail（Desired / Suggested / Final / Margin）——
        field(53010; "DESIRED US Retail MARGIN"; Decimal) { Caption = 'DESIRED US Retail MARGIN'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53011; "SUGGESTED US Retail PRICE"; Decimal) { Caption = 'SUGGESTED US Retail PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53012; "MARGIN on SUGGESTED US Retail PRICE"; Decimal) { Caption = 'MARGIN on SUGGESTED US Retail PRICE'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53013; "FINAL US Retail PRICE"; Decimal) { Caption = 'FINAL US Retail PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53014; "MARGIN on FINAL US Retail PRICE"; Decimal) { Caption = 'MARGIN on FINAL US Retail PRICE'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }

        // —— Wholesale（Desired / Suggested / Final / Margin）——
        field(53020; "DESIRED Wholesale MARGIN"; Decimal) { Caption = 'DESIRED Wholesale MARGIN'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53021; "SUGGESTED Wholesale PRICE"; Decimal) { Caption = 'SUGGESTED Wholesale PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53022; "MARGIN on SUGGESTED Wholesale PRICE"; Decimal) { Caption = 'MARGIN on SUGGESTED Wholesale PRICE'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53023; "FINAL Wholesale PRICE"; Decimal) { Caption = 'FINAL Wholesale PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53024; "MARGIN on FINAL Wholesale PRICE"; Decimal) { Caption = 'MARGIN on FINAL Wholesale PRICE'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }

        // —— Competitor Wholesale（竞品批发价与汇率）——
        field(53030; "Competitor Wholesale PRICE"; Decimal) { Caption = 'Competitor Wholesale PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53031; "Competitor Wholesale PRICE at EXCH RATE"; Decimal) { Caption = 'Competitor Wholesale PRICE at EXCH RATE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53032; "MARGIN on Competitor Wholesale PRICE"; Decimal) { Caption = 'MARGIN on Competitor Wholesale PRICE'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }

        // —— Promo Wholesale（促销批发）——
        field(53040; "DESIRED PROMO Wholesale MARGIN"; Decimal) { Caption = 'DESIRED PROMO Wholesale MARGIN'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53041; "SUGGESTED PROMO Wholesale PRICE"; Decimal) { Caption = 'SUGGESTED PROMO Wholesale PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53042; "MARGIN on SUGGESTED PROMO Wholesale PRICE and Calc PROMO L.C."; Decimal) { Caption = 'MARGIN on SUGGESTED PROMO Wholesale PRICE and Calc PROMO L.C.'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53043; "PROMO Wholesale PRICE"; Decimal) { Caption = 'PROMO Wholesale PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53044; "MARGIN on PROMO Wholesale PRICE and Calc PROMO L.C."; Decimal) { Caption = 'MARGIN on PROMO Wholesale PRICE and Calc PROMO L.C.'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }

        // —— Retail（常规）——
        field(53050; "DESIRED Retail MARGIN"; Decimal) { Caption = 'DESIRED Retail MARGIN'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53051; "SUGGESTED Retail PRICE"; Decimal) { Caption = 'SUGGESTED Retail PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53052; "MARGIN on SUGGESTED Retail PRICE"; Decimal) { Caption = 'MARGIN on SUGGESTED Retail PRICE'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53053; "FINAL Retail PRICE"; Decimal) { Caption = 'FINAL Retail PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53054; "MARGIN on FINAL Retail PRICE"; Decimal) { Caption = 'MARGIN on FINAL Retail PRICE'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }

        // —— Promo Retail（促销零售）——
        field(53060; "DESIRED PROMO Retail MARGIN"; Decimal) { Caption = 'DESIRED PROMO Retail MARGIN'; DecimalPlaces = 0 : 5; DataClassification = ToBeClassified; }
        field(53061; "SUGGESTED PROMO Retail PRICE"; Decimal) { Caption = 'SUGGESTED PROMO Retail PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53062; "MARGIN on SUGGESTED PROMO Retail PRICE and PROMO Wholesale PRICE"; Decimal)
        {
            Caption = 'MARGIN on SUGGESTED PROMO Retail PRICE and PROMO Wholesale PRICE';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }
        field(53063; "PROMO Retail PRICE"; Decimal) { Caption = 'PROMO Retail PRICE'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53064; "MARGIN on PROMO Retail PRICE and PROMO Wholesale PRICE"; Decimal)
        {
            Caption = 'MARGIN on PROMO Retail PRICE and PROMO Wholesale PRICE';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }

        // —— MAP 价 ——
        field(53070; "CDN MAP Price"; Decimal) { Caption = 'CDN MAP Price'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }
        field(53071; "US MAP Price"; Decimal) { Caption = 'US MAP Price'; DecimalPlaces = 0 : 2; DataClassification = ToBeClassified; }

        // —— Flags & Points ——
        field(53080; "Open Price Item Y/N"; Boolean) { Caption = 'Open Price Item'; DataClassification = ToBeClassified; }
        field(53081; "Coupon Item Y/N"; Boolean) { Caption = 'Coupon Item'; DataClassification = ToBeClassified; }
        field(53082; "Points Needed to Use Coupon"; Integer) { Caption = 'Points Needed to Use Coupon'; DataClassification = ToBeClassified; }
        field(53083; "Returnable Item Y/N"; Boolean) { Caption = 'Returnable Item'; DataClassification = ToBeClassified; }
    }
}

pageextension 53110 ItemCardPriceSalesExt extends "Item Card"
{
    layout
    {
        addlast("Prices & Sales")
        {
            group("🟦 Extended Pricing & Margins")
            {
                Caption = '🟦 Extended Pricing & Margins';

                // 🔵 Promo 基础
                group("🔵 Promo Basics")
                {
                    Caption = '🔵 Promo Basics';
                    field("FINAL PROMO DISC%"; Rec."FINAL PROMO DISC%") { ApplicationArea = All; }
                    field("PROMO NET PRICE each"; Rec."PROMO NET PRICE each") { ApplicationArea = All; }
                    field("Packing Charge"; Rec."Packing Charge") { ApplicationArea = All; }
                    field("Commission%"; Rec."Commission%") { ApplicationArea = All; }
                }

                // 🟠 US Retail
                group("🟠 US Retail")
                {
                    Caption = '🟠 US Retail';
                    field("DESIRED US Retail MARGIN"; Rec."DESIRED US Retail MARGIN") { ApplicationArea = All; }
                    field("SUGGESTED US Retail PRICE"; Rec."SUGGESTED US Retail PRICE") { ApplicationArea = All; }
                    field("MARGIN on SUGGESTED US Retail PRICE"; Rec."MARGIN on SUGGESTED US Retail PRICE") { ApplicationArea = All; }
                    field("FINAL US Retail PRICE"; Rec."FINAL US Retail PRICE") { ApplicationArea = All; }
                    field("MARGIN on FINAL US Retail PRICE"; Rec."MARGIN on FINAL US Retail PRICE") { ApplicationArea = All; }
                }

                // 🟢 Wholesale
                group("🟢 Wholesale")
                {
                    Caption = '🟢 Wholesale';
                    field("DESIRED Wholesale MARGIN"; Rec."DESIRED Wholesale MARGIN") { ApplicationArea = All; }
                    field("SUGGESTED Wholesale PRICE"; Rec."SUGGESTED Wholesale PRICE") { ApplicationArea = All; }
                    field("MARGIN on SUGGESTED Wholesale PRICE"; Rec."MARGIN on SUGGESTED Wholesale PRICE") { ApplicationArea = All; }
                    field("FINAL Wholesale PRICE"; Rec."FINAL Wholesale PRICE") { ApplicationArea = All; }
                    field("MARGIN on FINAL Wholesale PRICE"; Rec."MARGIN on FINAL Wholesale PRICE") { ApplicationArea = All; }
                }

                // 🟣 Competitor Wholesale
                group("🟣 Competitor Wholesale")
                {
                    Caption = '🟣 Competitor Wholesale';
                    field("Competitor Wholesale PRICE"; Rec."Competitor Wholesale PRICE") { ApplicationArea = All; }
                    field("Competitor Wholesale PRICE at EXCH RATE"; Rec."Competitor Wholesale PRICE at EXCH RATE") { ApplicationArea = All; }
                    field("MARGIN on Competitor Wholesale PRICE"; Rec."MARGIN on Competitor Wholesale PRICE") { ApplicationArea = All; }
                }

                // 🟡 Promo Wholesale
                group("🟡 Promo Wholesale")
                {
                    Caption = '🟡 Promo Wholesale';
                    field("DESIRED PROMO Wholesale MARGIN"; Rec."DESIRED PROMO Wholesale MARGIN") { ApplicationArea = All; }
                    field("SUGGESTED PROMO Wholesale PRICE"; Rec."SUGGESTED PROMO Wholesale PRICE") { ApplicationArea = All; }
                    field("MARGIN on SUGGESTED PROMO Wholesale PRICE and Calc PROMO L.C."; Rec."MARGIN on SUGGESTED PROMO Wholesale PRICE and Calc PROMO L.C.") { ApplicationArea = All; }
                    field("PROMO Wholesale PRICE"; Rec."PROMO Wholesale PRICE") { ApplicationArea = All; }
                    field("MARGIN on PROMO Wholesale PRICE and Calc PROMO L.C."; Rec."MARGIN on PROMO Wholesale PRICE and Calc PROMO L.C.") { ApplicationArea = All; }
                }

                // 🔷 Retail
                group("🔷 Retail")
                {
                    Caption = '🔷 Retail';
                    field("DESIRED Retail MARGIN"; Rec."DESIRED Retail MARGIN") { ApplicationArea = All; }
                    field("SUGGESTED Retail PRICE"; Rec."SUGGESTED Retail PRICE") { ApplicationArea = All; }
                    field("MARGIN on SUGGESTED Retail PRICE"; Rec."MARGIN on SUGGESTED Retail PRICE") { ApplicationArea = All; }
                    field("FINAL Retail PRICE"; Rec."FINAL Retail PRICE") { ApplicationArea = All; }
                    field("MARGIN on FINAL Retail PRICE"; Rec."MARGIN on FINAL Retail PRICE") { ApplicationArea = All; }
                }

                // 🟥 Promo Retail
                group("🟥 Promo Retail")
                {
                    Caption = '🟥 Promo Retail';
                    field("DESIRED PROMO Retail MARGIN"; Rec."DESIRED PROMO Retail MARGIN") { ApplicationArea = All; }
                    field("SUGGESTED PROMO Retail PRICE"; Rec."SUGGESTED PROMO Retail PRICE") { ApplicationArea = All; }
                    field("MARGIN on SUGGESTED PROMO Retail PRICE and PROMO Wholesale PRICE"; Rec."MARGIN on SUGGESTED PROMO Retail PRICE and PROMO Wholesale PRICE") { ApplicationArea = All; }
                    field("PROMO Retail PRICE"; Rec."PROMO Retail PRICE") { ApplicationArea = All; }
                    field("MARGIN on PROMO Retail PRICE and PROMO Wholesale PRICE"; Rec."MARGIN on PROMO Retail PRICE and PROMO Wholesale PRICE") { ApplicationArea = All; }
                }

                // 🟫 MAP & Flags
                group("🟫 MAP & Flags")
                {
                    Caption = '🟫 MAP & Flags';
                    field("CDN MAP Price"; Rec."CDN MAP Price") { ApplicationArea = All; }
                    field("US MAP Price"; Rec."US MAP Price") { ApplicationArea = All; }
                    field("Open Price Item Y/N"; Rec."Open Price Item Y/N") { ApplicationArea = All; }
                    field("Coupon Item Y/N"; Rec."Coupon Item Y/N") { ApplicationArea = All; }
                    field("Points Needed to Use Coupon"; Rec."Points Needed to Use Coupon") { ApplicationArea = All; }
                    field("Returnable Item Y/N"; Rec."Returnable Item Y/N") { ApplicationArea = All; }
                }
            }
        }
    }
}
