report 50198 ItemLabelReport
{
    ApplicationArea = All;
    Caption = 'Item Label Report11';
    UsageCategory = ReportsAndAnalysis;

    RDLCLayout = 'Item label Report.rdl';

    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";

            column(No; "No.") { }
            column(Picture; Picture) { }
            column(ItemDiscGroup; "Item Disc. Group") { }
            column(UnitPrice; "Unit Price") { }
            column(Description; Description) { }

            column(BarcodeImage; GetBarcodeImage("No."))
            {
            }
        }
    }


    local procedure GetBarcodeImage(Value: Text): Text
    var
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        TempBlob: Codeunit "Temp Blob";
        InS: InStream;
        OutS: OutStream;
        Base64Convert: Codeunit "Base64 Convert";
        ResultText: Text;
        BarcodeUrl: Text;
    begin
        BarcodeUrl := 'https://barcode.tec-it.com/barcode.ashx?data=' + Value + '&code=Code128&dpi=96';
        if not HttpClient.Get(BarcodeUrl, HttpResponse) then
            exit('');
        if not HttpResponse.IsSuccessStatusCode then
            exit('');

        // 1. Read content as InStream
        HttpResponse.Content().ReadAs(InS);

        // 2. 将 InStream 写入 TempBlob
        TempBlob.CreateOutStream(OutS);
        CopyStream(OutS, InS);

        // 3. 再从 TempBlob 取 InStream
        TempBlob.CreateInStream(InS);

        // 4. 用 Base64 Convert 转码
        ResultText := Base64Convert.ToBase64(InS);

        exit(ResultText);
    end;




}
