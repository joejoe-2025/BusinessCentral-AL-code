codeunit 57666 MyCodeunit
{
    trigger OnRun()
    begin
        myQuery.SetFilter(Quantity, '>100');
        myQuery.Open();
        while myQuery.Read do begin
            Message(Textbox, myQuery.CustomerName, myQuery.Quantity);
        end;
        myQuery.Close();


    end;

    var
        myQuery: Query QueryCustomerSales;
        Textbox: TextConst ENU = 'Customer name = %1, Quantity = %2.';
}