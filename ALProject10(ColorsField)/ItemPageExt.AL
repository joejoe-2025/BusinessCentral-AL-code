pageextension 50445 ColorExtension extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field(Color; Rec.Color)
            {
                ApplicationArea = All;
            }
        }

    }


}