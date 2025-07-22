pageextension 50216 "OurHeadLine" extends "Headline RC Security Admin"
{
    layout
    {
        addbefore(Control1)
        {
            field(HeadLineTest; HeadLineText)
            {
                ApplicationArea = All;
                trigger OnDrillDown()
                begin
                    Hyperlink('https://bigals.ca/');
                end;
            }
        }
    }
    trigger OnOpenPage()

    begin
        HeadLineText := 'Click here to <emphasize>BIG AL''S </emphasize> website';
    end;



    var
        HeadLineText: Text;
}
