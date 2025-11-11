tableextension 50103 CustomerExtension1 extends Customer
{
    fields
    {
        field(50106; "Nickname"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Nickname';
        }
        field(50107; "Testfield"; Decimal)
        {
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 2;
        }
    }
}
