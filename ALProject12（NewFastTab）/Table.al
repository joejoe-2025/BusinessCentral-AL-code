tableextension 50325 MyExtension extends Item
{
    fields
    {
        field(50201; Field1; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50202; field2; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50203; Field3; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50204; field4; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }



    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}