table 50280 BigalsCompany
{
    Caption = 'Bigal''s Company';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Company ID"; Code[20])
        {
            Caption = 'Company ID';
            DataClassification = CustomerContent;
        }

        field(2; "Name"; Text[100])
        {
            Caption = 'Company Name';
            DataClassification = CustomerContent;
        }

        field(3; "Location"; Text[100])
        {
            Caption = 'Location';
            DataClassification = CustomerContent;
        }

        field(4; "Active"; Boolean)
        {
            Caption = 'Active';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Company ID")
        {
            Clustered = true;
        }
    }
}
