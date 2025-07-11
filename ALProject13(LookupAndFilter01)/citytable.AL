table 50171 "Customer City"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "City"; Text[30]) { DataClassification = ToBeClassified; }
    }
    keys
    {
        key(PK; "City") { Clustered = true; }
    }
}
