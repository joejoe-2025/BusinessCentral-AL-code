pageextension 50610 ItemCardExt extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(UPC; Rec.UPC)
            {
                ApplicationArea = All;
                Caption = 'UPC';
            }
            field(ASWO; Rec.ASWO)
            {
                ApplicationArea = All;
                Caption = 'ASWO';
            }
            field(Barcode; Rec.Barcode)
            {
                ApplicationArea = All;
                Caption = 'Barcode';
            }
        }
    }
}
