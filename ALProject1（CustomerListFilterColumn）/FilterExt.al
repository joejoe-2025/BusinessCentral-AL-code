pageextension 50210 MyCustomerListExt extends "Customer List"
{
    layout
    {
        addfirst(Control1)
        {
            field(SelectCity; Rec.City) { ApplicationArea = All; }
        }
    }
}
