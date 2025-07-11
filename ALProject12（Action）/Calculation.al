page 54476 CalculationPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field("Number 1"; Number1)
                {

                }

                field("Number 2"; Number2)
                {

                }
            }
            group(Output)
            {
                field("Result"; Result)
                {

                }


            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action(Add)
            {
                ApplicationArea = all;
                Caption = 'Add';
                Image = Calculate;
                ToolTip = 'Add';

                trigger OnAction()
                begin
                    Result := Number1 + Number2;
                    Message('The result is %1', Result);
                end;
            }
            action(Subtract)
            {

                ApplicationArea = all;
                Caption = 'Subtract';
                Image = Calculate;
                ToolTip = 'Subtract';


                trigger OnAction()
                begin
                    Result := Number1 - Number2;
                    Message('The result is %1', Result);
                end;
            }
            group("Multiply&Divide")
            {
                Caption = 'MulDiv';
                action(Multiply)
                {

                    ApplicationArea = all;
                    Caption = 'Multiply';
                    Image = Calculate;
                    ToolTip = 'Multiply';


                    trigger OnAction()
                    begin
                        Result := Number1 * Number2;
                        Message('The result is %1', Result);
                    end;
                }
                action(Divide)
                {

                    ApplicationArea = all;
                    Caption = 'Divide';
                    Image = Calculate;
                    ToolTip = 'Divide';


                    trigger OnAction()
                    begin
                        Result := Number1 / Number2;
                        Message('The result is %1', Result);

                    end;


                }




            }


        }

        area(Navigation)
        {
            action(CustomerInformation)
            {
                ApplicationArea = all;
                Caption = 'Customer Details';
                Image = Calculate;
                RunObject = page "Customer Card";
                ToolTip = 'Customer info';

            }
        }

        area(Creation)
        {
            action("New document")
            {
                ApplicationArea = All;
                RunObject = page "Customer card";
                image = Customer;

            }
        }


    }


    var
        Number1: Decimal;
        Number2: Decimal;
        Result: Decimal;
}