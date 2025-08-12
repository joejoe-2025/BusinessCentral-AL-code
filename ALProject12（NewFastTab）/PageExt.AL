pageextension 50325 page extends "Item Card"
{
    layout
    {

        addafter(Item)
        {
            group("New group")
            {
                Caption = ' 🚚New group';
                field(Field1; Rec.Field1)
                {
                    ApplicationArea = all;
                    Editable = true;
                    ToolTip = 'This is a new group example';
                }

                field(Field2; Rec.Field2)
                {
                    ApplicationArea = all;
                    Editable = true;
                    ToolTip = 'This is a new group example';
                }
                field(Field3; Rec.Field3)
                {
                    ApplicationArea = all;
                    Editable = true;
                    ToolTip = 'This is a new group example';
                }
                field(Field4; Rec.Field4)
                {
                    ApplicationArea = all;
                    Editable = true;
                    ToolTip = 'This is a new group example';
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}