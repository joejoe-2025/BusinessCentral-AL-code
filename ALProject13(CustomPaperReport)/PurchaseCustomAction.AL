pageextension 50351 PostedPurchInv_CustomPaperExt extends "Posted Purchase Invoice"
{
    actions
    {
        addlast(Processing)
        {
            // 1) 下载PDF
            action(DownloadCustomPI)
            {
                Caption = 'Download Custom PI';
                ApplicationArea = All;
                Image = Export;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutStream: OutStream;
                    InStream: InStream;
                    FileName: Text;
                    RecRef: RecordRef;
                    FR: FieldRef;
                begin
                    FileName := Rec."No." + '-' + DELCHR(Rec."Buy-from Vendor Name", '=', '"/\:*?<>|') + '.pdf';

                    TempBlob.CreateOutStream(OutStream);

                    RecRef.Open(Database::"Purch. Inv. Header");
                    FR := RecRef.Field(Rec.FieldNo("No."));
                    FR.SetFilter('%1', Rec."No.");

                    Report.SaveAs(Report::"Custom Posted Purchase Invoice", '', ReportFormat::Pdf, OutStream, RecRef);

                    TempBlob.CreateInStream(InStream);
                    DownloadFromStream(InStream, '', '', '', FileName);
                end;
            }

            // 2) 邮件发送PDF附件（收件人=供应商邮箱，附加 joe@bigals.ca）
            action(EmailCustomPI)
            {
                Caption = 'Send Custom PI by Email';
                ApplicationArea = All;
                Image = Email;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutStream: OutStream;
                    InStream: InStream;
                    FileName: Text;
                    RecRef: RecordRef;
                    FR: FieldRef;
                    V: Record Vendor;
                    ToAddr: Text;
                    Subject: Text;
                    Body: Text;
                    EmailMsg: Codeunit "Email Message";
                    Email: Codeunit Email;
                begin
                    FileName := Rec."No." + '-' + DELCHR(Rec."Buy-from Vendor Name", '=', '"/\:*?<>|') + '.pdf';

                    TempBlob.CreateOutStream(OutStream);

                    RecRef.Open(Database::"Purch. Inv. Header");
                    FR := RecRef.Field(Rec.FieldNo("No."));
                    FR.SetFilter('%1', Rec."No.");

                    Report.SaveAs(Report::"Custom Posted Purchase Invoice", '', ReportFormat::Pdf, OutStream, RecRef);
                    TempBlob.CreateInStream(InStream);

                    if V.Get(Rec."Buy-from Vendor No.") then
                        ToAddr := V."E-Mail";

                    Subject := StrSubstNo('Purchase Invoice %1', Rec."No.");
                    Body :=
                      'Hi,' + Format(13) + Format(10) +
                      StrSubstNo('Please find attached Purchase Invoice %1.', Rec."No.") + Format(13) + Format(10) +
                      'Regards,';

                    // 收件人=供应商邮箱 + 固定抄送 joe@bigals.ca
                    EmailMsg.Create(StrSubstNo('%1,%2', ToAddr, 'joe@bigals.ca'), Subject, Body, false);
                    EmailMsg.AddAttachment(FileName, 'application/pdf', InStream);

                    Email.Send(EmailMsg);
                    Message('Email sent to %1 (cc: joe@bigals.ca) with attachment %2.', ToAddr, FileName);
                end;
            }

            // 3) 预览
            action(PreviewCustomPI)
            {
                Caption = 'Print Preview (Custom PI)';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    H: Record "Purch. Inv. Header";
                begin
                    H.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"Custom Posted Purchase Invoice", true, false, H);
                end;
            }

            // 4) 直接打印
            action(PrintCustomPIDirect)
            {
                Caption = 'Print (Custom PI)';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    H: Record "Purch. Inv. Header";
                begin
                    H.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"Custom Posted Purchase Invoice", false, false, H);
                end;
            }
        }
    }
}
