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


///the following code cause error to stop the post of order
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
    end;///


