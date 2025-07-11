codeunit 50101 UpdateCustomerOrderCount
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', true, true)]
    local procedure OnSalesHeaderInserted(var Rec: Record "Sales Header")
    var
        Customer: Record Customer;
        OrderHeader: Record "Sales Header";
        OrderCount: Integer;
    begin
        // Ensure it's a sales order
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit;

        // Get the customer based on Sell-to Customer No.
        if Customer.Get(Rec."Sell-to Customer No.") then begin
            // Count all sales orders for this customer
            OrderHeader.Reset();
            OrderHeader.SetRange("Document Type", OrderHeader."Document Type"::Order);
            OrderHeader.SetRange("Sell-to Customer No.", Customer."No.");
            OrderCount := OrderHeader.Count;

            // Update the customer field and commit the change
            Customer."Customer Orders Count" := OrderCount;
            Customer.Modify(true); // Use true to trigger OnModify if needed
        end;
    end;
}
