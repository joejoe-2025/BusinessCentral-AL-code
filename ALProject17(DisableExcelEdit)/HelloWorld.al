codeunit 54112 BlockEditInExcel
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Edit in Excel",
        'OnEditInExcelWithFilters', '', false, false)]
    local procedure OnEditInExcelWithFilters(ServiceName: Text[240];
                                            var EditInExcelFilters: Codeunit "Edit in Excel Filters";
                                            SearchFilter: Text;
                                            var Handled: Boolean)
    begin
        Handled := true; // 不让系统继续执行
        Error('You cannot use Edit in Excel in this environment.');
    end;
}
