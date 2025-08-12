tableextension 51108 ItemPriceSalesExt extends Item
{
    fields
    {
        // 💱 Currency Info
        field(50505; "C CURR_CODE"; Code[10]) { Caption = 'Invoice Currency Code'; }

        // 🛍️ US Retail Pricing
        field(50506; "Z DESIRED_US Retail_MARGIN"; Decimal) { Caption = 'Desired US Retail Margin'; }
        field(50507; "AA SUGGESTED_US Retail_PRICE"; Decimal) { Caption = 'Suggested US Retail Price'; }
        field(50508; "AB MARGIN on SUGGESTED US Retail PRICE"; Decimal) { Caption = 'Margin on Suggested US Retail Price'; }
        field(50509; "AC FINAL_US Retail_PRICE"; Decimal) { Caption = 'Final US Retail Price'; }
        field(50510; "AD MARGIN on FINAL US Retail PRICE"; Decimal) { Caption = 'Margin on Final US Retail Price'; }

        // 📦 Magstar Wholesale Pricing & Margins
        field(50491; "AJ Magstar_CURRENT_Wholesale_Price"; Decimal) { Caption = 'Magstar CURRENT Wholesale Price'; }
        field(50492; "AK Margin on Magstar CURRENT Wholesale and Last LC"; Decimal) { Caption = 'Margin on Magstar Wholesale & Last LC'; }
        field(50493; "AL Margin on Magstar CURRENT Wholesale and Calc LC"; Decimal) { Caption = 'Margin on Magstar Wholesale & Calc LC'; }
        field(50494; "AM Magstar_CURRENT_PROMO_Wholesale_Price"; Code[10]) { Caption = 'Magstar PROMO Wholesale Price'; }
        field(50495; "AN Markdown on Current Wholesale for Magstar CUR"; Text[100]) { Caption = 'Markdown on Wholesale for CUR'; }
        field(50496; "AO Margin on PROMO Wholesale and Last LC"; Decimal) { Caption = 'Margin on PROMO & Last LC'; }
        field(50497; "AP Margin on PROMO Wholesale and Calc LC"; Decimal) { Caption = 'Margin on PROMO & Calc LC'; }

        // 📈 Suggested & Final Wholesale Price
        field(50498; "AQ DESIRED_Wholesale_MARGIN"; Decimal) { Caption = 'Desired Wholesale Margin'; }
        field(50499; "AR SUGGESTED_Wholesale_PRICE"; Decimal) { Caption = 'Suggested Wholesale Price'; }
        field(50500; "AS MARGIN on Suggested Wholesale and Calc LC"; Decimal) { Caption = 'Margin on Suggested Wholesale & Calc LC'; }
        field(50501; "AT FINAL_Wholesale_PRICE"; Decimal) { Caption = 'Final Wholesale Price'; }
        field(50502; "AU MARGIN on FINAL Wholesale and Calc LC"; Decimal) { Caption = 'Margin on Final Wholesale & Calc LC'; }

        // 👑 Royal Pricing
        field(50503; "AV ROYAL_Wholesale_PRICE"; Decimal) { Caption = 'ROYAL Wholesale Price'; }
        field(50504; "AW ROYAL_PROMO_PRICE"; Decimal) { Caption = 'ROYAL Promo Price'; }
        field(50511; "AZ ROYAL_Wholesale_PRICE_at EXCH_RATE"; Decimal) { Caption = 'ROYAL Wholesale Price at EXCH RATE'; }
        field(50512; "BA MARGIN_on ROYAL_Wholesale_PRICE"; Decimal) { Caption = 'Margin on ROYAL Wholesale Price'; }

        // 🏬 Retail Pricing (Current & Promo)
        field(50513; "BB CURRENT_Retail_Price"; Decimal) { Caption = 'Current Retail Price'; }
        field(50514; "BC Margin_on CURRENT Retail and Wholesale"; Decimal) { Caption = 'Margin on CURRENT Retail and Wholesale'; }
        field(50515; "BD CURRENT_PROMO_Retail_Price"; Code[20]) { Caption = 'Current Promo Retail Price'; }
        field(50516; "BE Margin_on CURRENT PROMO and Wholesale"; Decimal) { Caption = 'Margin on CURRENT PROMO and Wholesale'; }

        // 🎯 Suggested & Final Retail Price
        field(50517; "BF DESIRED_Retail_MARGIN"; Decimal) { Caption = 'Desired Retail Margin'; }
        field(50518; "BG SUGGESTED_Retail_PRICE"; Decimal) { Caption = 'Suggested Retail Price'; }
        field(50519; "BH MARGIN on SUGGESTED Retail and FINAL Wholesale"; Decimal) { Caption = 'Margin on Suggested Retail & Final Wholesale'; }
        field(50520; "BI FINAL_Retail_PRICE"; Decimal) { Caption = 'Final Retail Price'; }
        field(50521; "BJ MARGIN on FINAL Retail and Wholesale"; Decimal) { Caption = 'Margin on FINAL Retail and Wholesale'; }

        // ⚙️ Other Sales Settings
        field(50522; "CD Open_Price_Item_Y/N"; Boolean) { Caption = 'Open Price Item'; }
        field(50523; "CE Coupon_Item_Y/N"; Boolean) { Caption = 'Coupon Item'; }
        field(50524; "CF Points_Needed_to Use_Coupon"; Integer) { Caption = 'Points Needed for Coupon'; }
        field(50525; "CC Sell-Fractions_Y/N"; Boolean) { Caption = 'Sell-Fractions'; }
        field(50526; "CH Date Listed"; Date) { Caption = 'Date Listed'; }
        field(50527; "CI Item_STORE_Status"; Code[10]) { Caption = 'Item Store Status'; }
        field(50528; "DL Create_Royal_Aquatic_PRICE_CHANGE_file"; Boolean) { Caption = 'Create Royal Aquatic Price Change File'; }
    }
}