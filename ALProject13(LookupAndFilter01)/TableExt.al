tableextension 50130 MySalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50161; "City Filter"; Text[30])
        {
            Caption = 'City Filter';
            TableRelation = "Customer City".City;
        }
        field(50162; "Referral Customer"; Code[20])
        {
            Caption = 'Referral Customer';

            TableRelation = Customer."No." WHERE(City = FIELD("City Filter"));
        }
    }
}
