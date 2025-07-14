tableextension 50602 CustomerExtension extends Customer
{
    fields
    {
        field(50611; BACompany; Enum BACompanyEnum)
        {
            Caption = 'BA Company';
            DataClassification = CustomerContent;
        }

        field(50612; BAVIP; Boolean)
        {
            Caption = 'BA VIP';
            DataClassification = CustomerContent;
        }

        field(50613; BATel; Text[50])
        {
            Caption = 'BA Telephone';
            DataClassification = CustomerContent;
        }

        field(50614; BAEmail; Text[100])
        {
            Caption = 'BA Email';
            DataClassification = CustomerContent;
        }
        field(50615; BAJoined; DateTime)
        {
            Caption = 'BA Joined DateTime';
            DataClassification = CustomerContent;
        }

        field(50616; BALogo; Media)
        {
            Caption = 'BA Logo';
            DataClassification = CustomerContent;
            Editable = true;
        }
    }
}