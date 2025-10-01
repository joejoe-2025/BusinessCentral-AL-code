tableextension 50610 ItemExtension extends Item
{
    fields
    {
        field(50630; UPC; Code[50])
        {
            Caption = 'UPC';
            DataClassification = ToBeClassified;
        }

        field(50631; ASWO; Text[50])
        {
            Caption = 'ASWO';
            DataClassification = ToBeClassified;
        }

        field(50632; Barcode; Code[50])
        {
            Caption = 'Barcode';
            DataClassification = ToBeClassified;
        }
    }
}
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
