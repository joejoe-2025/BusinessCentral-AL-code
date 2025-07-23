table 50145 "Customer Order"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order Number"; Code[20])
        {
            Caption = 'Order Number';
        }

        field(2; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }

        field(3; "Order Series"; Code[20])
        {
            Caption = 'Order Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Order Number")
        {
            Clustered = true;
        }
    }

    procedure AssistEdit(): Boolean
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "Order Number" = '' then begin
            TestField("Order Series");
            "Order Number" := NoSeriesMgt.GetNextNo("Order Series", WorkDate(), true);
            exit(true);
        end;
        exit(false);
    end;

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "Order Number" = '' then begin
            TestField("Order Series");
            "Order Number" := NoSeriesMgt.GetNextNo("Order Series", WorkDate(), true);
        end;
    end;
}
