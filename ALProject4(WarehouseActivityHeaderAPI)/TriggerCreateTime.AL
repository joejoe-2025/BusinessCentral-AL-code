codeunit 50100 "WhseActHeaderSubscriber"
{
    [EventSubscriber(ObjectType::Table, Database::"Warehouse Activity Header", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeInsert(var Rec: Record "Warehouse Activity Header"; RunTrigger: Boolean)
    begin
        Rec."Created Timestamp" := CurrentDateTime;
    end;
}
