pageextension 54445 MyExtension extends "Sales Order"
{
    actions
    {
        addafter("Plan")
        {
            action(CustomerSalesQuery)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    mycodeunit: Codeunit 57666;
                begin
                    Clear(mycodeunit);
                    mycodeunit.Run();
                end;
            }
        }
    }
}
