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


codeunit 50199 CustomerSalesAmount
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInsertEvent', '', true, true)]
    local procedure OnSalesLineInserted(var Rec: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Demo: Record "Demo Field Types";
        Total: Decimal;
    begin
        // 获取 Sales Header 来判断 Customer
        if SalesHeader.Get(Rec."Document Type", Rec."Document No.") then begin
            // 如果 Demo.ID 是客户号
            if Demo.Get(SalesHeader."Sell-to Customer No.") then begin
                // 汇总该销售单的行金额
                SalesLine.SetRange("Document Type", Rec."Document Type");
                SalesLine.SetRange("Document No.", Rec."Document No.");
                SalesLine.CalcSums("Line Amount");

                // 写入 Demo 表
                Demo."Customer Sales Amount" := SalesLine."Line Amount";
                Demo.Modify();
            end;
        end;
    end;
}
