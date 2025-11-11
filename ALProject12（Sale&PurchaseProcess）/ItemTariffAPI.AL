page 51144 "Item Tariff API"
{
    PageType = API;
    SourceTable = Item;

    APIPublisher = 'yourPublisher';    // 替换为你的 Publisher，比如 'contoso'
    APIGroup = 'itemTariff';              // 可以自定义分组
    APIVersion = 'v1.0';

    EntityName = 'itemTariff';       // 单数
    EntitySetName = 'itemTariffs';      // 复数

    ODataKeyFields = "No.";            // 主键，Item 的编号

    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'Item No.';
                }

                field(bzTariffCode; Rec."BZ Tariff Code")
                {
                    Caption = 'Tariff Code';
                }

                field(axDuty1; Rec."AX Duty%1")
                {
                    Caption = 'Duty1 (Import)';
                }

                field(dcDuty2; Rec."DC DUTY%2")
                {
                    Caption = 'Duty2 (Export)';
                }
            }
        }
    }
}
