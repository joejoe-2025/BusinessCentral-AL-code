tableextension 55130 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50100; "Web Order No."; Code[30])
        {
            Caption = 'Web Order No.';
            DataClassification = CustomerContent;
        }
    }
}
