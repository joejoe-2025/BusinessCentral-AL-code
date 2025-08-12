pageextension 51108 ItemCardPriceSalesExt extends "Item Card"
{
    layout
    {

        addlast("Prices & Sales")
        {
            group("💱 Currency Info")
            {
                field("C CURR_CODE"; Rec."C CURR_CODE") { ApplicationArea = All; }
            }
            group("🛍️ US Retail Pricing")
            {
                field("Z DESIRED_US Retail_MARGIN"; Rec."Z DESIRED_US Retail_MARGIN") { ApplicationArea = All; }
                field("AA SUGGESTED_US Retail_PRICE"; Rec."AA SUGGESTED_US Retail_PRICE") { ApplicationArea = All; }
                field("AB MARGIN on SUGGESTED US Retail PRICE"; Rec."AB MARGIN on SUGGESTED US Retail PRICE") { ApplicationArea = All; }
                field("AC FINAL_US Retail_PRICE"; Rec."AC FINAL_US Retail_PRICE") { ApplicationArea = All; }
                field("AD MARGIN on FINAL US Retail PRICE"; Rec."AD MARGIN on FINAL US Retail PRICE") { ApplicationArea = All; }
            }
            group("📦 Magstar Wholesale Pricing & Margins")
            {
                field("AJ Magstar_CURRENT_Wholesale_Price"; Rec."AJ Magstar_CURRENT_Wholesale_Price") { ApplicationArea = All; }
                field("AK Margin on Magstar CURRENT Wholesale and Last LC"; Rec."AK Margin on Magstar CURRENT Wholesale and Last LC") { ApplicationArea = All; }
                field("AL Margin on Magstar CURRENT Wholesale and Calc LC"; Rec."AL Margin on Magstar CURRENT Wholesale and Calc LC") { ApplicationArea = All; }
                field("AM Magstar_CURRENT_PROMO_Wholesale_Price"; Rec."AM Magstar_CURRENT_PROMO_Wholesale_Price") { ApplicationArea = All; }
                field("AN Markdown on Current Wholesale for Magstar CUR"; Rec."AN Markdown on Current Wholesale for Magstar CUR") { ApplicationArea = All; }
                field("AO Margin on PROMO Wholesale and Last LC"; Rec."AO Margin on PROMO Wholesale and Last LC") { ApplicationArea = All; }
                field("AP Margin on PROMO Wholesale and Calc LC"; Rec."AP Margin on PROMO Wholesale and Calc LC") { ApplicationArea = All; }
            }
            group("📈 Suggested & Final Wholesale Price")
            {
                field("AQ DESIRED_Wholesale_MARGIN"; Rec."AQ DESIRED_Wholesale_MARGIN") { ApplicationArea = All; }
                field("AR SUGGESTED_Wholesale_PRICE"; Rec."AR SUGGESTED_Wholesale_PRICE") { ApplicationArea = All; }
                field("AS MARGIN on Suggested Wholesale and Calc LC"; Rec."AS MARGIN on Suggested Wholesale and Calc LC") { ApplicationArea = All; }
                field("AT FINAL_Wholesale_PRICE"; Rec."AT FINAL_Wholesale_PRICE") { ApplicationArea = All; }
                field("AU MARGIN on FINAL Wholesale and Calc LC"; Rec."AU MARGIN on FINAL Wholesale and Calc LC") { ApplicationArea = All; }
            }
            group("👑 Royal Pricing")
            {
                field("AV ROYAL_Wholesale_PRICE"; Rec."AV ROYAL_Wholesale_PRICE") { ApplicationArea = All; }
                field("AW ROYAL_PROMO_PRICE"; Rec."AW ROYAL_PROMO_PRICE") { ApplicationArea = All; }
                field("AZ ROYAL_Wholesale_PRICE_at EXCH_RATE"; Rec."AZ ROYAL_Wholesale_PRICE_at EXCH_RATE") { ApplicationArea = All; }
                field("BA MARGIN_on ROYAL_Wholesale_PRICE"; Rec."BA MARGIN_on ROYAL_Wholesale_PRICE") { ApplicationArea = All; }
            }
            group("🏬 Retail Pricing (Current & Promo)")
            {
                field("BB CURRENT_Retail_Price"; Rec."BB CURRENT_Retail_Price") { ApplicationArea = All; }
                field("BC Margin_on CURRENT Retail and Wholesale"; Rec."BC Margin_on CURRENT Retail and Wholesale") { ApplicationArea = All; }
                field("BD CURRENT_PROMO_Retail_Price"; Rec."BD CURRENT_PROMO_Retail_Price") { ApplicationArea = All; }
                field("BE Margin_on CURRENT PROMO and Wholesale"; Rec."BE Margin_on CURRENT PROMO and Wholesale") { ApplicationArea = All; }
            }
            group("🎯 Suggested & Final Retail Price")
            {
                field("BF DESIRED_Retail_MARGIN"; Rec."BF DESIRED_Retail_MARGIN") { ApplicationArea = All; }
                field("BG SUGGESTED_Retail_PRICE"; Rec."BG SUGGESTED_Retail_PRICE") { ApplicationArea = All; }
                field("BH MARGIN on SUGGESTED Retail and FINAL Wholesale"; Rec."BH MARGIN on SUGGESTED Retail and FINAL Wholesale") { ApplicationArea = All; }
                field("BI FINAL_Retail_PRICE"; Rec."BI FINAL_Retail_PRICE") { ApplicationArea = All; }
                field("BJ MARGIN on FINAL Retail and Wholesale"; Rec."BJ MARGIN on FINAL Retail and Wholesale") { ApplicationArea = All; }
            }
            group("⚙️ Other Sales Settings")
            {
                field("CD Open_Price_Item_Y/N"; Rec."CD Open_Price_Item_Y/N") { ApplicationArea = All; }
                field("CE Coupon_Item_Y/N"; Rec."CE Coupon_Item_Y/N") { ApplicationArea = All; }
                field("CF Points_Needed_to Use_Coupon"; Rec."CF Points_Needed_to Use_Coupon") { ApplicationArea = All; }
                field("CC Sell-Fractions_Y/N"; Rec."CC Sell-Fractions_Y/N") { ApplicationArea = All; }
                field("CH Date Listed"; Rec."CH Date Listed") { ApplicationArea = All; }
                field("CI Item_STORE_Status"; Rec."CI Item_STORE_Status") { ApplicationArea = All; }
                field("DL Create_Royal_Aquatic_PRICE_CHANGE_file"; Rec."DL Create_Royal_Aquatic_PRICE_CHANGE_file") { ApplicationArea = All; }
            }
        }
    }

}
