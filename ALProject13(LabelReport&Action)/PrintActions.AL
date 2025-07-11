pageextension 50330 ItemCard_LabelDownloadExt extends "Item Card"
{
    actions
    {
        addlast(Processing)
        {
            action(DownloadItemLabel)
            {
                Caption = 'Download Label';
                ApplicationArea = All;
                Image = Export;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutStream: OutStream;
                    InStream: InStream;
                    FileName: Text;
                    RecRef: RecordRef;
                    FieldRef: FieldRef;
                begin
                    FileName := Rec."No." + '-' + DELCHR(Rec.Description, '=', '"/\:*?<>|') + '.docx';

                    TempBlob.CreateOutStream(OutStream);

                    // 打开 RecordRef，并设置过滤器为当前记录
                    RecRef.Open(Database::Item);
                    FieldRef := RecRef.Field(1); // 字段 1 = No.
                    FieldRef.SetFilter('%1', Rec."No.");

                    Report.SaveAs(Report::ItemLabelReport, '', ReportFormat::Word, OutStream, RecRef);

                    TempBlob.CreateInStream(InStream);
                    DownloadFromStream(InStream, '', '', '', FileName);
                end;


            }

            action(SendItemLabelByEmail)
            {
                Caption = 'Send Email';
                ApplicationArea = All;
                Image = Email;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutStream: OutStream;
                    InStream: InStream;
                    FileName: Text;
                    RecRef: RecordRef;
                    FieldRef: FieldRef;
                    EmailMsg: Codeunit "Email Message";
                    Email: Codeunit Email;
                    EmailAddr: Text;
                    Subject: Text;
                    Body: Text;
                begin
                    FileName := Rec."No." + '-' + DELCHR(Rec.Description, '=', '"/\:*?<>|') + '.docx';

                    TempBlob.CreateOutStream(OutStream);

                    // 👇 完全一样的方式，确保和你的Download代码一致
                    RecRef.Open(Database::Item);
                    FieldRef := RecRef.Field(1); // 字段1 = No.
                    FieldRef.SetFilter('%1', Rec."No.");

                    Report.SaveAs(Report::ItemLabelReport, '', ReportFormat::Word, OutStream, RecRef);

                    TempBlob.CreateInStream(InStream);



                    Subject := 'Item Label - ' + Rec."No.";
                    Body := 'Hi,' + FORMAT(13) + FORMAT(10) +
                            'Please find attached the label for item: ' + Rec."No." + '.' + FORMAT(13) + FORMAT(10) +
                            'Regards,';

                    EmailMsg.Create(
                                   'joe@bigals.ca',                             // sender
                                   'joe@bigals.ca',        // recipient
                                   'Item Label Report - ' + Rec."No.", // subject
                                   false                           // isBodyHtml
                               );
                    EmailMsg.SetBody(Body);

                    // Add attachment
                    EmailMsg.AddAttachment(
                        FileName,
                        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                        InStream
                    );

                    Email.Send(EmailMsg);
                end;
            }
            action(PrintAndPreview)
            {
                Caption = 'Print & Preview';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    ItemRec.SetRange("No.", Rec."No."); // ✅ 设置过滤器为当前 Item
                    Report.RunModal(Report::ItemLabelReport, true, false, ItemRec);
                end;
            }


            action(PrintDirectly)
            {
                Caption = 'Print!!!';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    ItemRec.SetRange("No.", Rec."No.");
                    // 直接用false/false参数，Report会尝试走“直接打印”而非“预览”
                    Report.RunModal(Report::ItemLabelReport, false, false, ItemRec);
                end;
            }
        }



    }
}
