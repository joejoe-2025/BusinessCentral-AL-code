pageextension 70335 "DisableEdit_ConfigSubform" extends "Config. Package Subform"
{
    Editable = false;
}
pageextension 70336 "DisableEdit_ConfigFields" extends "Config. Package Fields"
{
    Editable = false;
}


codeunit 70340 "Block ConfigPkg Delete"
{
    [EventSubscriber(ObjectType::Table, Database::"Config. Package", 'OnBeforeDeleteEvent', '', false, false)]
    local procedure OnBeforeDeleteConfigPackage(var Rec: Record "Config. Package"; RunTrigger: Boolean)
    begin
        Message('Not Allow');
        Error('Deletion of configuration packages is not allowed for any user.');
    end;
}

