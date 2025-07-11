page 50400 "Customer City List"
{
    PageType = List;
    SourceTable = "Customer City";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("City"; Rec."City") { }
            }
        }
    }
}
