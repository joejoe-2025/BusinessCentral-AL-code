page 50103 CustomerInfoAPI
{
    PageType = API;
    SourceTable = Customer;
    APIPublisher = 'CRONUSCanadaInc';
    APIGroup = 'customers';
    APIVersion = 'v1.0';
    EntityName = 'customerinfo';
    EntitySetName = 'customerNickname';
    Caption = 'Customer Nickname API';
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("CustNo"; Rec."No.") { } // 你的自定义字段
                field(Nickname; Rec.Nickname) { } // 你的自定义字段
            }
        }
    }
}
