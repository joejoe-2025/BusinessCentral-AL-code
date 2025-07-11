tableextension 60008 MyExtension extends Customer
{
    fields
    {
        field(56666; "Customer Sales Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Sales Amount';
        }

        field(76866; "Customer Orders Count"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Orders Count';
        }
        field(76869; "Cutomer hobby"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer hobby';
        }


    }


}
