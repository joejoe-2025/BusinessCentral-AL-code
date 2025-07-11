page 50170 WebOrderStagingAPI
{
    PageType = API;
    SourceTable = "Web Order Staging";
    APIPublisher = 'bigals';
    APIGroup = 'web';
    APIVersion = 'v1.0';
    EntityName = 'webOrder';
    EntitySetName = 'webOrders';
    Caption = 'Web Order Staging API';
    DelayedInsert = true;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID) { }
                field("CustomerNo"; Rec."Customer No.") { }
                field("OrderDate"; Rec."Order Date") { }
                field("ItemNo"; Rec."Item No.") { }
                field(Quantity; Rec.Quantity) { }
                field(Status; Rec.Status) { }
            }
        }
    }
}