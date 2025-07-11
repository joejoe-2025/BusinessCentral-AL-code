pageextension 50200 MyCustomerListExt extends "Customer List"
{
    layout
    {
        addfirst(Control1)
        {
            field(City; Rec.City) { ApplicationArea = All; }
        }
    }
}
