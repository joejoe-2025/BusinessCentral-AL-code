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

            field("Customer Orders Count"; Rec."Customer Orders Count")
            {
                ApplicationArea = All;
                Editable = false;
            }




        }
    }

    actions
    {
        addlast(Processing)
        {
            action(GreetCustomer)
            {
                ApplicationArea = All;
                Caption = 'Greet Customer';
                Image = Smile;
                trigger OnAction()
                begin
                    Greet();
                end;
            }

            action(WelcomeToBigALs)
            {
                ApplicationArea = All;
                Caption = 'WelcomeToBigALs';
                Image = Picture;
                trigger OnAction()
                begin
                    Message('Welcome to Big AL');
                end;
            }
        }
    }

    local procedure Greet()
    begin
        Message('Hello, %1!', Rec.Name);
    end;


}


