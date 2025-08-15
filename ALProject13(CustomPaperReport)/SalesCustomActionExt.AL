pageextension 50341 PostedSalesInv_CustomPaperExt extends "Posted Sales Invoice"
{
    actions
    {
        addlast(Processing)
        {
            // 1) 下载自定义Paper（PDF）
            action(DownloadCustomPaper)
            {
                Caption = 'Download Custom Paper';
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
                    // 文件名：发票号-客户名.pdf（去除非法字符）
                    FileName := Rec."No." + '-' + DELCHR(Rec."Bill-to Name", '=', '"/\:*?<>|') + '.pdf';

                    TempBlob.CreateOutStream(OutStream);

                    // 用 RecordRef 指向当前“已过账发票头”，按 No. 过滤到当前记录
                    RecRef.Open(Database::"Sales Invoice Header");
                    FieldRef := RecRef.Field(Rec.FieldNo("No.")); // ✅ 用 FieldNo("No.")，不要写 1
                    FieldRef.SetFilter('%1', Rec."No.");


                    // 导出为 PDF（若你的布局是 Word，可把 ReportFormat::Pdf 换成 ::Word，并把扩展名改成 .docx）
                    Report.SaveAs(Report::"Custom Sales Posted Invoice", '', ReportFormat::Pdf, OutStream, RecRef);

                    TempBlob.CreateInStream(InStream);
                    DownloadFromStream(InStream, '', '', '', FileName);
                end;
            }

            // 2) 邮件发送PDF附件
            action(SendCustomPaperByEmail)
            {
                Caption = 'Send Custom Paper by Email';
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
                    ToAddr: Text;
                    Subject: Text;
                    Body: Text;
                    Cust: Record Customer;
                begin
                    FileName := Rec."No." + '-' + DELCHR(Rec."Bill-to Name", '=', '"/\:*?<>|') + '.pdf';

                    TempBlob.CreateOutStream(OutStream);

                    RecRef.Open(Database::"Sales Invoice Header");
                    FieldRef := RecRef.Field(Rec.FieldNo("No.")); // ✅ 用 FieldNo("No.")，不要写 1
                    FieldRef.SetFilter('%1', Rec."No.");


                    Report.SaveAs(Report::"Custom Sales Posted Invoice", '', ReportFormat::Pdf, OutStream, RecRef);

                    TempBlob.CreateInStream(InStream);

                    // 取收件人：Bill-to 客户邮箱（没有则留空/改为你固定邮箱）
                    if Cust.Get(Rec."Bill-to Customer No.") then
                        ToAddr := Cust."E-Mail";

                    Subject := 'Invoice - ' + Rec."No.";
                    Body := 'Hi,' + FORMAT(13) + FORMAT(10) +
                            'Please find the attached invoice: ' + Rec."No." + '.' + FORMAT(13) + FORMAT(10) +
                            'Regards,';

                    // 参考你示例里的写法（有的环境此 Create 有不同签名，如需可改为不带发件人重载）
                    EmailMsg.Create(
                        'joe@bigals.ca',                // 发件人（按需替换）
                        StrSubstNo('%1,%2', ToAddr, 'joe@bigals.ca'),                  // 收件人
                        Subject,                         // 主题
                        false                            // 正文是否HTML
                    );
                    EmailMsg.SetBody(Body);

                    // 添加附件（PDF）
                    EmailMsg.AddAttachment(
                        FileName,
                        'application/pdf',
                        InStream
                    );

                    // 发送
                    Email.Send(EmailMsg);
                    Message('Email sent to %1 with attachment %2.', ToAddr, FileName);
                end;
            }

            // 3) 预览
            action(PreviewCustomPaper)
            {
                Caption = 'Print Preview (Custom Paper)';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    InvHdr: Record "Sales Invoice Header";
                begin
                    InvHdr.SetRange("No.", Rec."No."); // 当前单据
                    Report.RunModal(Report::"Custom Sales Posted Invoice", true, false, InvHdr);
                end;
            }

            // 4) 直接打印（无预览）
            action(PrintCustomPaperDirectly)
            {
                Caption = 'Print (Custom Paper)';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    InvHdr: Record "Sales Invoice Header";
                begin
                    InvHdr.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"Custom Sales Posted Invoice", false, false, InvHdr);
                end;
            }
        }
    }
}
