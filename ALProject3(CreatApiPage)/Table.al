table 50170 "Web Order Staging"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "ID"; Code[50]) { DataClassification = SystemMetadata; }
        field(2; "Customer No."; Code[20]) { DataClassification = CustomerContent; }
        field(3; "Order Date"; Date) { DataClassification = CustomerContent; }
        field(4; "Item No."; Code[20]) { DataClassification = ToBeClassified; }
        field(5; "Quantity"; Decimal) { DataClassification = ToBeClassified; }
        field(6; "Status"; Option)
        {
            OptionMembers = Pending,Processed,Error;
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "ID") { Clustered = true; }
    }
}