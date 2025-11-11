codeunit 50109 UpdateCustomerSalesAmount
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInsertEvent', '', true, true)]
    local procedure OnSalesLineInserted(var Rec: Record "Sales Line")
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Total: Decimal;
    begin
        // Retrieve the sales header to obtain the customer number.
        if SalesHeader.Get(Rec."Document Type", Rec."Document No.") then begin
            if Customer.Get(SalesHeader."Sell-to Customer No.") then begin
                // Filter all sales lines by customer number.
                SalesLine.SetRange("Sell-to Customer No.", Customer."No.");
                SalesLine.CalcSums("Line Amount");

                // Update Customer Record
                Customer."Customer Sales Amount" := SalesLine."Line Amount";
                Customer.Modify();
            end;
        end;
    end;
}
