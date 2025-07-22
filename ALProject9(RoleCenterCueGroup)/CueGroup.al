page 50213 "Big Al's Cue Group Page"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            cuegroup(CuegroupTest)
            {
                Caption = 'Big Als Cue Group Test Page';
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    StyleExpr = 'Unfavorable';

                }
                field(Number; Number)
                {
                    Caption = 'Number';
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        Message('Welcome to BIG Als');
                    end;
                }

                field("Balance Due"; Rec."Balance Due")
                {
                    ApplicationArea = All;
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                    ApplicationArea = All;
                }

            }

            cuegroup(AtionGroup)
            {
                Caption = 'More Actions';
                actions
                {
                    action(WelcomeToBigAls)
                    {
                        Caption = 'Welcome to Big Als';
                        ApplicationArea = all;
                        Image = TileBrickCustomer;
                        trigger OnAction()
                        begin
                            Message('Welcome to Big Als');
                        end;
                    }
                    action(WelcomeToBigAls1)
                    {
                        Caption = '***Welcome to Big Als***';
                        ApplicationArea = all;
                        Image = TileBrickCustomer;
                        trigger OnAction()
                        begin
                            Message('***Welcome to Big Als***');
                        end;
                    }




                }

            }

        }



    }

    var
        Number: Integer;
}