codeunit 50120 SalesPostSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        SalesHeaderMod: Record "Sales Header";
    begin
        if SalesHeader.ProcessedDateTime <> 0DT then
            exit;

        SalesHeaderMod.Get(SalesHeader."Document Type", SalesHeader."No.");
        SalesHeaderMod.Validate(ProcessedDateTime, CurrentDateTime());
        SalesHeaderMod.Modify(true);
    end;
}
