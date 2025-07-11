tableextension 50160 CustomerExtensionExample extends Customer
{
    fields
    {
        field(50130; "Referral Person Code"; Code[20])
        {
            Caption = 'Referral By';
            TableRelation = "Salesperson/Purchaser".Code;
        }
    }
}
