page 57142 "Customer BA Company API"
{
    PageType = API;
    SourceTable = Customer;
    APIPublisher = 'bigals';
    APIGroup = 'integration';
    APIVersion = 'v1.0';
    EntityName = 'baCustomer';
    EntitySetName = 'baCustomers';
    DelayedInsert = true; // ✅ 必须加上这个
    // 或者你设置 InsertAllowed = false 或 Editable = false 也可以，但常用 DelayedInsert = true

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec."No.") { }
                field(name; Rec.Name) { }
                field("BACompany1"; Rec."BA Company1") { }
            }
        }
    }
}
