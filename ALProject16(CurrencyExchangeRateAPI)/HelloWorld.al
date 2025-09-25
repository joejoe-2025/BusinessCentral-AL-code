page 50150 "Currency Exch Rates API"
{
    PageType = API;
    ApiPublisher = 'joe';
    ApiGroup = 'currencyExchange';
    ApiVersion = 'v2.0';
    EntityName = 'currencyExchangeRate';
    EntitySetName = 'currencyExchangeRates';

    SourceTable = "Currency Exchange Rate";
    ODataKeyFields = SystemId;     // ← 改成单键
    DelayedInsert = true;
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                // 单键（只读展示）
                field(id; Rec.SystemId) { Caption = 'Id'; Editable = false; }

                // 业务字段（现在是“普通列”，Create/Update 都能填）
                field(currencyCode; Rec."Currency Code") { Caption = 'Currency Code'; }
                field(startingDate; Rec."Starting Date") { Caption = 'Starting Date'; }

                field(exchangeRateAmount; Rec."Exchange Rate Amount") { Caption = 'Exchange Rate Amount'; }
                field(relationalExchRateAmount; Rec."Relational Exch. Rate Amount") { Caption = 'Relational Exch. Rate Amount'; }
                field(adjustmentExchangeRateAmount; Rec."Adjustment Exch. Rate Amount") { Caption = 'Adjustment Exch. Rate Amount'; }
                field(relationalAdjmtExchRateAmt; Rec."Relational Adjmt Exch Rate Amt") { Caption = 'Relational Adjmt Exch Rate Amt'; }
                field(fixExchangeRateAmount; Rec."Fix Exchange Rate Amount") { Caption = 'Fix Exchange Rate Amount'; }
            }
        }
    }
}
