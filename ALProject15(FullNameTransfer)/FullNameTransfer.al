tableextension 54110 CustomerExt extends Customer
{
    fields
    {
        field(54101; "First Name"; Text[50])
        {
            Caption = 'First Name';
            DataClassification = CustomerContent;

        }

        field(54102; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
            DataClassification = CustomerContent;

        }
    }
}
pageextension 54110 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {

            field("First Name"; Rec."First Name")
            {
                ApplicationArea = All;
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = All;
            }

        }
    }
}
