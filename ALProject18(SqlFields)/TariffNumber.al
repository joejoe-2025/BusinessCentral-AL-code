page 53230 "Tariff Number API"
{
    PageType = API;
    Caption = 'Tariff Number API';
    APIPublisher = 'joe';
    APIGroup = 'ItemFieldsFromSQL';
    APIVersion = 'v1.0';
    EntityName = 'tariffNumber';
    EntitySetName = 'tariffNumbers';
    SourceTable = "Tariff Number";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            field(id; Rec.SystemId)
            {
                Caption = 'SystemId';
                Editable = false;
            }

            field(No; Rec."No.")
            {
                Caption = 'Tariff Code';
            }
            field(Description; Rec.Description)
            {
                Caption = 'Description';
            }
            field("SupplementaryUnits"; Rec."Supplementary Units")
            {
                Caption = 'Supplementary Units';
            }

        }
    }


}
