page 50622 "Item Logo FactBox"
{
    PageType = CardPart;
    SourceTable = Item;
    Caption = 'Item Logo 2';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(ItemLogo2; Rec.ItemLogo2)
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Click here to upload or change the second item logo.';
                Editable = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(UploadLogo2)
            {
                ApplicationArea = All;
                Caption = 'Upload Logo 2';
                Image = Import;

                trigger OnAction()
                var
                    InStr: InStream;
                    FileName: Text;
                begin
                    UploadIntoStream('Select Image', '', 'All Files (*.*)|*.*', FileName, InStr);
                    Rec.ItemLogo2.ImportStream(InStr, FileName);
                    Rec.Modify(true);
                    CurrPage.UPDATE;
                end;
            }

            action(ClearLogo2)
            {
                ApplicationArea = All;
                Caption = 'Clear Logo 2';
                Image = Delete;

                trigger OnAction()
                begin
                    Clear(Rec.ItemLogo2);
                    Rec.Modify(true);
                    CurrPage.UPDATE;
                end;
            }
        }
    }
}
