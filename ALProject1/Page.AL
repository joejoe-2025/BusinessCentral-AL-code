page 50227 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = MyNewTable11;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ApplicationArea = All;
                    Editable = true;
                    StyleExpr = 'Unfavorable';

                }
                field(lastName; Rec.lastName)
                {
                    Caption = 'Last Name';
                    ApplicationArea = All;
                    Editable = true;
                    StyleExpr = 'Unfavorable';

                }
            }

            group(Inportant)
            {
                field(Balance; Rec.Balance)
                {
                    Caption = 'Balance';
                    ApplicationArea = All;
                    Editable = false;
                    StyleExpr = 'Favorable';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}