page 50101 "Sales Line Barcode API"
{
    PageType = API;
    SourceTable = "Sales Line";
    APIPublisher = 'bigals';
    APIGroup = 'sales';
    APIVersion = 'v1.0';

    EntityName = 'basaleorderline';         // ✅ Singular
    EntitySetName = 'basaleorderlines';     // ✅ Plural

    DelayedInsert = true;

    SourceTableView = where("Document Type" = const(Order));
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(SystemId; Rec.SystemId) { }
                field(DocumentType; Rec."Document Type") { }
                field(DocumentNo; Rec."Document No.") { }
                field(LineNo; Rec."Line No.") { }
                field(ItemNo; Rec."No.") { }
                field(Quantity; Rec.Quantity) { }
                field("UnitPrice"; Rec."Unit Price") { }
                field(BABarcode; Rec.BABarcode) { }

                field(ReceivedTimestamp; Rec.ReceivedTimestamp) { }
                field(PickedTimestamp; Rec.PickedTimestamp) { }
                field(ShippedTimestamp; Rec.ShippedTimestamp) { }
                field(ItemStatus; Rec.ItemStatus) { }
            }
        }
    }
}
