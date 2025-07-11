pageextension 66666 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        addafter("Credit Limit (LCY)")
        {
            field("Customer Sales Amount"; Rec."Customer Sales Amount")
            {
                ApplicationArea = All;
                Editable = false;
            }



        }
    }
}
