pageextension 50121 CueExtension extends "Security Admin Role Center"
{
    layout
    {
        addafter(ApprovalsActivities)
        {
            part(ItemSummaryPart; ItemListPart)
            {
                ApplicationArea = All;
            }
        }
    }
}
