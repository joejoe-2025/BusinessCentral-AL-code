codeunit 50120 SalesPostSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
        if SalesHeader.ProcessedDateTime = 0DT then begin
            SalesHeader.Validate(ProcessedDateTime, CurrentDateTime());
            SalesHeader.Modify(true);
        end;
    end;

}
