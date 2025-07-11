tableextension 50197 CustomerTableExt extends Customer
{
    fields
    {
        field(50100; "BA Company New"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }
}
