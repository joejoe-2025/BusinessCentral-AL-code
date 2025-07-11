tableextension 50151 AutoNumberCustomerExt extends Customer
{
    fields
    {
        field(55558; "Company Code"; Code[10])
        {
            Caption = 'AutoNumber - Company Code';
            DataClassification = CustomerContent;
        }

        field(66689; "AutoNumber Customer No."; Code[30])
        {
            Caption = 'AutoNumber - Customer No.';
            DataClassification = CustomerContent;
        }
    }
}
