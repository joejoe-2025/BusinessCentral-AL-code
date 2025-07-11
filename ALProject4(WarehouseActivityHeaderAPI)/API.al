page 50151 "WhseActivityHeaderAPI"
{
    PageType = API;
    SourceTable = "Warehouse Activity Header";
    APIPublisher = 'yourcompany';
    APIGroup = 'warehouse';
    APIVersion = 'v1.0';
    EntityName = 'whseactivityheader';
    EntitySetName = 'whseactivityheaders';
    ApplicationArea = All;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            field(No; Rec."No.") { }
            field(CreatedBy; Rec."Created Timestamp") { }

            field(ActivityType; Rec."Type")
            {

            }



        }
    }
}
