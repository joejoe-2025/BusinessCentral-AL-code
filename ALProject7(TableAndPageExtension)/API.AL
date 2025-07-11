page 55052 CustomerLevelAPI
{
    PageType = API;
    SourceTable = Customer;
    APIPublisher = 'CRONUSCanadaInc';
    APIGroup = 'customers';
    APIVersion = 'v1.0';
    EntityName = 'customerlevel';
    EntitySetName = 'customerlevels';
    Caption = 'Customer Level API';
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(level; Rec.Level) { } // 你的自定义字段
            }
        }
    }
}
