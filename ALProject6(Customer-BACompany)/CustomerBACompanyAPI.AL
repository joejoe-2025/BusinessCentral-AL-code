page 50650 "Customer BACompany API"
{
    PageType = API;
    SourceTable = Customer;

    APIPublisher = 'bigals';
    APIGroup = 'customers';
    APIVersion = 'v1.0';

    DelayedInsert = true;

    EntityName = 'customerbacompany';
    EntitySetName = 'customerbacompanies';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No"; Rec."No.")
                {
                    Caption = 'Customer No.';
                    // Remove DataClassification here
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    // Remove DataClassification here
                }
                field(BACompany; Rec.BACompany)
                {
                    Caption = 'BA Company';
                    // Remove DataClassification here
                }
            }
        }
    }
}

