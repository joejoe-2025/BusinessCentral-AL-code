page 50127 MySalesOrderAPIPage
{
    PageType = API;
    SourceTable = "Sales Header";
    APIPublisher = 'mycompany';
    APIGroup = 'SalesOrderTimeStamp';
    APIVersion = 'v1.0';
    EntityName = 'mySalesOrder';
    EntitySetName = 'mySalesOrders';
    Caption = 'My Sales Order API';
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(no; Rec."No.") { Caption = 'Order No'; }
                field(orderDate; Rec."Order Date") { Caption = 'Order Date'; }
                field(processedDateTime; Rec.ProcessedDateTime) { Caption = 'Processed Date Time'; }
            }
        }
    }
}
