pageextension 50153 AutoNumberCustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Company Code"; Rec."Company Code")
            {
                ApplicationArea = All;
                ToolTip = 'Select the company this customer belongs to.';
            }

            field("AutoNumber Customer No."; Rec."AutoNumber Customer No.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Auto-generated customer number based on company and year.';
            }
        }
    }
}
