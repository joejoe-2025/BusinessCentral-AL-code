table 50227 MyNewTable11
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(2; lastName; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Address; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(4; Balance; Decimal)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }





}