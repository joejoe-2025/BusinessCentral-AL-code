pageextension 56663 MyExtension extends "Sales Invoice"
{
    actions
    {
        addafter("Post") // Specify a valid action to add after
        {
            action(OpenReport)
            {
                ApplicationArea = All;
                Caption = 'Sale Invoice Report';
                Image = Report;

                trigger OnAction()
                begin
                    myReport1.Run();
                end;
            }

            action(OpenReport1)
            {
                ApplicationArea = All;
                Caption = 'Cusomer Info Report';
                Image = Report;

                trigger OnAction()
                begin
                    myReport2.Run();
                end;
            }
        }
    }

    var
        myReport1: Report "Sales Invoice Report";
        myReport2: Report "Cusomer Info";

}
