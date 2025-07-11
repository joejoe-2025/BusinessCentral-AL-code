pageextension 50600 CustomerCardEx extends Microsoft.Sales.Customer."Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Nickname"; Rec."Nickname")
            {
                ApplicationArea = All;
                Editable = true;
            }
        }
    }
}
