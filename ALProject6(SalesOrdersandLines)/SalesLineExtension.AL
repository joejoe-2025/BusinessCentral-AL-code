tableextension 50620 SalesLineExtension extends "Sales Line"
{
    fields
    {
        field(50631; ReceivedTimestamp; DateTime)
        {
            Caption = 'Received Timestamp';
            DataClassification = SystemMetadata;
        }

        field(50632; PickedTimestamp; DateTime)
        {
            Caption = 'Picked Timestamp';
            DataClassification = SystemMetadata;
        }

        field(50633; ShippedTimestamp; DateTime)
        {
            Caption = 'Shipped Timestamp';
            DataClassification = SystemMetadata;
        }
        field(50634; ItemStatus; Enum ItemStatusEnum)
        {
            Caption = 'Item Status';
            DataClassification = CustomerContent;
        }

                field(50635; BABarcode; Code[20])
        {
            Caption = 'BABarcode';
            DataClassification = CustomerContent;
        }

        


    }
}


 
