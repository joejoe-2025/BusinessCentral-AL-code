page 50100 "Customer API Posting Group"
{
    PageType = API;
    SourceTable = Customer;

    APIPublisher = 'bigals';
    APIGroup = 'customers';
    APIVersion = 'v1.0';

    EntityName = 'customerposting';
    EntitySetName = 'customerpostings';
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No"; Rec."No.") { }
                field(Name; Rec.Name) { }
                field(CustomerPostingGroup; Rec."Customer Posting Group") { }
                field(GenBusPostingGroup; Rec."Gen. Bus. Posting Group") { }
                field(VATBusPostingGroup; Rec."VAT Bus. Posting Group") { }
            }
        }
    }
}