pageextension 50611 ItemListExt extends "Item List"
{
    layout
    {
        addlast(Content)
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
