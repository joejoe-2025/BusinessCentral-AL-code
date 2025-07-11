page 55051 CustomerListExposed
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Customer;
    UsageCategory = Lists;
    Editable = false;
    Caption = 'Customer Exposed for OData';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Level; Rec.Level) { } // 自定义字段
            }
        }
    }
}
