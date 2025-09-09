page 54121 "Customer Ext API"
{
    PageType = API;
    APIPublisher = 'bigals';             // 按公司命名空间改
    APIGroup = 'customerExt';
    APIVersion = 'v1.0';
    EntityName = 'customerName';
    EntitySetName = 'customerexts';
    SourceTable = Customer;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            // 主键字段（必需）
            field(id; Rec.SystemId)
            {
                Caption = 'Id';
                ApplicationArea = All;
            }

            field(number; Rec."No.")
            {
                Caption = 'Customer Number';
                ApplicationArea = All;
            }

            field(name; Rec.Name)
            {
                Caption = 'Name';
                ApplicationArea = All;
            }

            // 新增字段
            field(firstName; Rec."First Name")
            {
                Caption = 'First Name';
                ApplicationArea = All;
            }

            field(lastName; Rec."Last Name")
            {
                Caption = 'Last Name';
                ApplicationArea = All;
            }
        }
    }
}
