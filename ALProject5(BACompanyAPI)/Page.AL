pageextension 50670 CustomerCardEx extends Microsoft.Sales.Customer."Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("BA Company"; Rec."BA Company New")
            {
                ApplicationArea = All;
            }
        }
    }
}
