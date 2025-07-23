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
