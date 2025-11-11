page 50162 "Tariff Duty Setup API"
{
    PageType = API;
    SourceTable = "Tariff Duty Setup";

    // ★ 必填 API 元数据：按需替换
    APIPublisher = 'yourPublisher';   // 例如 'contoso'
    APIGroup = 'tariff';           // 例如 'trade'
    APIVersion = 'v1.0';

    // ★ 实体命名（URL 路由的一部分）
    EntityName = 'tariffDuty';      // 单数
    EntitySetName = 'tariffDuties';    // 复数

    // ★ OData 主键字段（对应表主键）
    ODataKeyFields = "Tariff Code";

    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(tariffCode; Rec."Tariff Code")
                {
                    Caption = 'Tariff Code';
                }
                field(dutyPct2; Rec."Duty%2")
                {
                    Caption = 'DUTY%2(Export)';
                }
                field(dutyPct1; Rec."Duty%1")
                {
                    Caption = 'DUTY%1(Import)';
                }
            }
        }
    }
}
