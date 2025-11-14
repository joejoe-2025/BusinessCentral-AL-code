page 53120 "ItemFieldsFromSQLAPI"
{
    PageType = API;
    Caption = 'Item Vendor API';
    APIPublisher = 'joe';
    APIGroup = 'ItemFieldsFromSQL';
    APIVersion = 'v1.0';
    EntityName = 'ItemFieldsFromSQL';
    EntitySetName = 'ItemFieldsFromSQL';
    SourceTable = Item;
    DelayedInsert = true;

    layout
    {
        area(content)
        {

            field(Description; Rec.Description)
            {
                Caption = 'Description';
            }
            field("VendorNo"; Rec."Vendor No.")
            {
                Caption = 'Vendor No.';
            }
            field("VendorItemNo"; Rec."Vendor Item No.")
            {
                Caption = 'Vendor Item No.';
            }

            field(Inventory; Rec.Inventory)
            {
                Caption = 'Inventory';
            }

            //Cost & Posting 部分新增字段

            field(no; Rec."No.")
            {
                Caption = 'No.';
                // Name = 'no';
            }

            // --- 你在 53120 中新增的字段（统一提供友好的 API 字段名）---

            // 🟦 采购/净价
            field(purchNetPrice; Rec."Purch NET PRICE")
            {
                Caption = 'Purch NET PRICE';
            }

            // 🟢 Import 成本
            field(importFrtPct; Rec."Import FRT%")
            {
                Caption = 'Import FRT%';
            }
            field(importDutyPct; Rec."Import DUTY%")
            {
                Caption = 'Import DUTY%';
            }

            // 🟠 最终成本
            field(finalCostEachVendorCurr; Rec."FINAL COST each in Vendor's CURR")
            {
                Caption = 'FINAL COST each in Vendor''s CURR';
            }
            field(landedCostEachCAD; Rec."Landed COST each CAD")
            {
                Caption = 'Landed COST each CAD';
            }

            // 🟣 Promo 成本
            field(promoCostEach; Rec."PROMO COST each")
            {
                Caption = 'PROMO COST each';
            }
            field(calcPromoLandedCostEach; Rec."Calc PROMO Landed Cost each")
            {
                Caption = 'Calc PROMO Landed Cost each';
            }

            // 🔵 Export 成本
            field(exportFrtPct; Rec."Export Frt%")
            {
                Caption = 'Export Frt%';
            }
            field(exportDutyPct; Rec."Export Duty%")
            {
                Caption = 'Export Duty%';
            }

            // 🟫 税务
            field(pstFlag; Rec."PST")
            {
                Caption = 'PST?';
            }

            field(importTariffCode; Rec."Import Tariff Code")
            {
                Caption = 'Import Tariff Code';
            }
            field(exportTariffCode; Rec."Export Tariff Code")
            {
                Caption = 'Export Tariff Code';
            }
            field(currencyCode; Rec."CurrencyCode")
            {
                Caption = 'Currency Code';
            }

            //PetSave 部分新增字段
            field(petSaveXferUoM; Rec."PetSaveXferUoM")
            {
                Caption = 'PetSave Xfer UoM';
                // 注意：必须是已存在的 "Unit of Measure".Code，否则会校验失败
            }
            field(petSaveXferUnits; Rec."PetSaveXferUnits")
            {
                Caption = 'PetSave Xfer Units';
            }
            field(petSaveDistPrice; Rec."PetSave Dist Price")
            {
                Caption = 'PetSave Dist Price';
            }
            field(discOffPetSaveDistPrice; Rec."Disc% off PetSave Dist Price")
            {
                Caption = 'Disc% off PetSave Dist Price';
            }
            field(petSavePromoDistPrice; Rec."PetSave PROMO Dist Price")
            {
                Caption = 'PetSave PROMO Dist Price';
            }
            field(petSave5AbovePromoWP; Rec."PetSave 5% above PROMO WP")
            {
                Caption = 'PetSave 5% above PROMO WP';
            }
            field(promoDiscStartDate; Rec."PetSave Promo Disc% Start Date")
            {
                Caption = 'PetSave Promo Disc% Start Date';
            }
            field(promoDiscEndDate; Rec."PetSave Promo Disc% End Date")
            {
                Caption = 'PetSave Promo Disc% End Date';
            }

            //—— 定价 部分新增字段 ——

            field(finalPromoDiscPct; Rec."FINAL PROMO DISC%") { Caption = 'FINAL PROMO DISC%'; }
            field(promoNetPriceEach; Rec."PROMO NET PRICE each") { Caption = 'PROMO NET PRICE each'; }
            field(packingCharge; Rec."Packing Charge") { Caption = 'Packing Charge'; }


            // —— US Retail ——
            field(desiredUsRetailMargin; Rec."DESIRED US Retail MARGIN") { Caption = 'DESIRED US Retail MARGIN'; }
            field(suggestedUsRetailPrice; Rec."SUGGESTED US Retail PRICE") { Caption = 'SUGGESTED US Retail PRICE'; }
            field(marginOnSuggestedUsRetailPrice; Rec."MARGIN on SUGGESTED US Retail PRICE") { Caption = 'MARGIN on SUGGESTED US Retail PRICE'; }
            field(finalUsRetailPrice; Rec."FINAL US Retail PRICE") { Caption = 'FINAL US Retail PRICE'; }
            field(marginOnFinalUsRetailPrice; Rec."MARGIN on FINAL US Retail PRICE") { Caption = 'MARGIN on FINAL US Retail PRICE'; }

            // —— Wholesale ——
            field(desiredWholesaleMargin; Rec."DESIRED Wholesale MARGIN") { Caption = 'DESIRED Wholesale MARGIN'; }
            field(suggestedWholesalePrice; Rec."SUGGESTED Wholesale PRICE") { Caption = 'SUGGESTED Wholesale PRICE'; }
            field(marginOnSuggestedWholesalePrice; Rec."MARGIN on SUGGESTED Wholesale PRICE") { Caption = 'MARGIN on SUGGESTED Wholesale PRICE'; }
            field(finalWholesalePrice; Rec."FINAL Wholesale PRICE") { Caption = 'FINAL Wholesale PRICE'; }
            field(marginOnFinalWholesalePrice; Rec."MARGIN on FINAL Wholesale PRICE") { Caption = 'MARGIN on FINAL Wholesale PRICE'; }

            // —— Competitor Wholesale ——
            field(competitorWholesalePrice; Rec."Competitor Wholesale PRICE") { Caption = 'Competitor Wholesale PRICE'; }
            field(competitorWholesalePriceAtExchRate; Rec."Competitor Wholesale PRICE at EXCH RATE") { Caption = 'Competitor Wholesale PRICE at EXCHRATE'; }
            field(marginOnCompetitorWholesalePrice; Rec."MARGIN on Competitor Wholesale PRICE") { Caption = 'MARGIN on Competitor Wholesale PRICE'; }

            // —— Promo Wholesale ——
            field(desiredPromoWholesaleMargin; Rec."DESIRED PROMO Wholesale MARGIN") { Caption = 'DESIRED PROMO Wholesale MARGIN'; }
            field(suggestedPromoWholesalePrice; Rec."SUGGESTED PROMO Wholesale PRICE") { Caption = 'SUGGESTED PROMO Wholesale PRICE'; }
            field(marginOnSuggestedPromoWholesalePriceAndCalcLanded; Rec."MARGIN on SUGGESTED PROMO Wholesale PRICE and Calc PROMO L.C.") { Caption = 'MARGIN on SUGGESTED PROMO Wholesale PRICE and Calc PROMO L.C.'; }
            field(promoWholesalePrice; Rec."PROMO Wholesale PRICE") { Caption = 'PROMO Wholesale PRICE'; }
            field(marginOnPromoWholesalePriceAndCalcLanded; Rec."MARGIN on PROMO Wholesale PRICE and Calc PROMO L.C.") { Caption = 'MARGIN on PROMO Wholesale PRICE and Calc PROMO L.C.'; }

            // —— Retail ——
            field(desiredRetailMargin; Rec."DESIRED Retail MARGIN") { Caption = 'DESIRED Retail MARGIN'; }
            field(suggestedRetailPrice; Rec."SUGGESTED Retail PRICE") { Caption = 'SUGGESTED Retail PRICE'; }
            field(marginOnSuggestedRetailPrice; Rec."MARGIN on SUGGESTED Retail PRICE") { Caption = 'MARGIN on SUGGESTED Retail PRICE'; }
            field(finalRetailPrice; Rec."FINAL Retail PRICE") { Caption = 'FINAL Retail PRICE'; }
            field(marginOnFinalRetailPrice; Rec."MARGIN on FINAL Retail PRICE") { Caption = 'MARGIN on FINAL Retail PRICE'; }

            // —— Promo Retail ——
            field(desiredPromoRetailMargin; Rec."DESIRED PROMO Retail MARGIN") { Caption = 'DESIRED PROMO Retail MARGIN'; }
            field(suggestedPromoRetailPrice; Rec."SUGGESTED PROMO Retail PRICE") { Caption = 'SUGGESTED PROMO Retail PRICE'; }
            field(marginOnSuggestedPromoRetailPriceAndPromoWholesale; Rec."MARGIN on SUGGESTED PROMO Retail PRICE and PROMO Wholesale PRICE") { Caption = 'MARGIN on SUGGESTED PROMO Retail PRICE and PROMO Wholesale PRICE'; }
            field(promoRetailPrice; Rec."PROMO Retail PRICE") { Caption = 'PROMO Retail PRICE'; }
            field(marginOnPromoRetailPriceAndPromoWholesale; Rec."MARGIN on PROMO Retail PRICE and PROMO Wholesale PRICE") { Caption = 'MARGIN on PROMO Retail PRICE and PROMO Wholesale PRICE'; }

            // —— MAP 价 ——
            field(cdnMapPrice; Rec."CDN MAP Price") { Caption = 'CDN MAP Price'; }
            field(usMapPrice; Rec."US MAP Price") { Caption = 'US MAP Price'; }

            // —— Flags & Points ——
            field(openPriceItem; Rec."Open Price Item Y/N") { Caption = 'Open Price Item'; }
            field(couponItem; Rec."Coupon Item Y/N") { Caption = 'Coupon Item'; }
            field(pointsNeededToUseCoupon; Rec."Points Needed to Use Coupon") { Caption = 'Points Needed to Use Coupon'; }
            field(returnableItem; Rec."Returnable Item Y/N") { Caption = 'Returnable Item'; }

            field("SalesUnitOfMeasure"; Rec."Sales Unit of Measure")
            {
                Caption = 'Sales Unit of Measure';
            }
            // General 部分新增字段
            field(descLength; Rec."Desc Length") { Caption = 'Desc Length'; }
            field(first30; Rec."First 30 chars.") { Caption = 'First 30 chars.'; }
            field(next10; Rec."Next 10 chars.") { Caption = 'Next 10 chars.'; }

            // 🟢 标识 & 编码
            field(upc; Rec."UPC1") { Caption = 'UPC'; }
            field(productId; Rec."Product ID") { Caption = 'Product ID'; }
            field(aswo; Rec."ASWO") { Caption = 'ASWO#'; }
            field(cat; Rec."CAT") { Caption = 'CAT'; }
            field(subCat; Rec."SUB CAT") { Caption = 'SUB CAT'; }
            field(uniqueId; Rec."UNIQUE ID") { Caption = 'Unique ID'; }
            field(sizeCode; Rec."SIZE CODE") { Caption = 'Size Code'; }
            field(colorCode; Rec."Color Code") { Caption = 'Color Code'; }
            field(mfgCodeForCountryOfOrigin; Rec."Mfg Code for Country of Origin") { Caption = 'Mfg Code for Country of Origin'; }
            field(in998YN; Rec."in 998 Y/N") { Caption = 'in 998 Y/N'; }

            // 🟣 生命周期 & 状态
            field(dateAdded; Rec."DATE ADDED") { Caption = 'Date Added'; }
            field(itemStatus; Rec."Item Status") { Caption = 'Item Status'; }
            field(storeOrderBlock; Rec."Store Order Block") { Caption = 'Store Order Block'; }

            // 🟡 销售/业务标识
            field(sellFractions; Rec."Sell Fractions") { Caption = 'Sell Fractions'; }
            field(addToUS4444; Rec."Add to US (4444)") { Caption = 'Add to US (4444)'; }
            field(addToPetSave; Rec."Add to PetSave") { Caption = 'Add to PetSave'; }
            field(newItemSheetRequired; Rec."NEW Item sheet required") { Caption = 'NEW Item sheet required'; }
            field(webItem; Rec."WebItem") { Caption = 'WebItem?'; }
            field(fdaItem; Rec."FDA Item") { Caption = 'FDA Item?'; }

            // 🟠 财务与分类信息
            field(commissionPct; Rec."Commission%") { Caption = 'Commission%'; }
            field(commissionAmt; Rec."CommissionAmt") { Caption = 'Commission Amount'; }
            field(importFrtAmt; Rec."Import FrtAmt") { Caption = 'Import Freight Amount'; }
            field(dept; Rec."DEPT") { Caption = 'Department'; }
            field(subDept; Rec."SUBDEPT") { Caption = 'Sub Department'; }
        }



    }

}
