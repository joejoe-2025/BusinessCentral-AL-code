page 50620 "Customer BA Logo FactBox"
{
    PageType = CardPart;
    SourceTable = Customer;
    Caption = 'BA Logo';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(BALogo; Rec.BALogo)
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Click here to upload or change the logo.';
                Editable = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(UploadLogo)
            {
                ApplicationArea = All;
                Caption = 'Upload Logo';
                Image = Import;

                trigger OnAction()
                var
                    InStr: InStream;
                    FileName: Text;
                begin
                    UploadIntoStream('Select Image', '', 'All Files (*.*)|*.*', FileName, InStr);
                    Rec.BALogo.ImportStream(InStr, FileName);
                    Rec.Modify(true);
                    CurrPage.UPDATE;
                end;
            }

            action(ClearLogo)
            {
                ApplicationArea = All;
                Caption = 'Clear Logo';
                Image = Delete;

                trigger OnAction()
                begin
                    Clear(Rec.BALogo);
                    Rec.Modify(true);
                    CurrPage.UPDATE;
                end;
            }
        }
    }
}
