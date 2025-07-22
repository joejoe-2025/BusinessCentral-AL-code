pageextension 50223 "List Extension" extends 9024
{
    layout
    {
        addafter(ApprovalsActivities)
        {
            part(Customers; "My Customers")
            {
                ApplicationArea = Basic, Suite;
            }
        }

    }


    actions
    {
        addfirst("Business Events")
        {

            action(NewItem)
            {
                RunObject = Page "Item Card";
                ApplicationArea = All;
                Image = Item;

            }
        }
    }






}

