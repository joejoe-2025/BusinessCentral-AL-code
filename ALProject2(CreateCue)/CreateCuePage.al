page 67775 "New Cue Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            cuegroup("New Cue Group")
            {
                field(Balance; Rec.Balance)
                {
                    Caption = 'BalanceInfo';
                    ApplicationArea = all;
                    Style = Attention;

                }

                field("Balance Due"; Rec."Balance Due")
                {
                    caption = 'BalanceDue info';
                    ApplicationArea = all;
                    Style = Attention;



                }

                field(Number; Number)
                {
                    Caption = 'Number';
                    ApplicationArea = all;
                    StyleExpr = 'Red';
                    trigger OnDrillDown()
                    begin
                        Message('Hello, this is a new cue page');
                    end;



                }
            }


        }
    }


    var
        Number: Integer;
}