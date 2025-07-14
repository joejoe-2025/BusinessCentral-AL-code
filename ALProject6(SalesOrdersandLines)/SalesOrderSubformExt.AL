pageextension 50622 SalesOrderSubformExt extends "Sales Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field(ReceivedTimestamp; Rec."ReceivedTimestamp")
            {
                ApplicationArea = All;
                Caption = 'Received';
            }
            field(PickedTimestamp; Rec."PickedTimestamp")
            {
                ApplicationArea = All;
                Caption = 'Picked';
            }
            field(ShippedTimestamp; Rec."ShippedTimestamp")
            {
                ApplicationArea = All;
                Caption = 'Shipped';
            }
            field(ItemStatus; Rec."ItemStatus")
            {
                ApplicationArea = All;
                Caption = 'Item Status';
            }
            field(BABarcode; Rec."BABarcode")
            {
                ApplicationArea = All;
                Caption = 'BABarcode';
            }
        }


    }
}
