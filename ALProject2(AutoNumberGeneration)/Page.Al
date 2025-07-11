page 50145 "Customer Order Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Customer Order";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Order Number"; Rec."Order Number")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Order Series"; Rec."Order Series")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewOrder)
            {
                Caption = 'New Order';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.Init();
                    Rec.Insert(true);
                    CurrPage.Update(false);
                end;
            }

            action(GenerateNumber)
            {
                ApplicationArea = All;
                Caption = 'Generate Order Number';
                Image = NumberSetup;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    GenerateOrderNumber();
                end;
            }
        }
    }

    local procedure GenerateOrderNumber()
    var
        NoSeriesMgt: Codeunit "No. Series";
        OrderNo: Code[20];
    begin
        if Rec."Order Series" = '' then
            Error('Please Select the order series First');

        if Rec."Order Number" <> '' then
            if not Confirm('An order number already exists. Do you want to generate a new one?', false) then
                exit;

        OrderNo := NoSeriesMgt.GetNextNo(Rec."Order Series", WorkDate(), true);
        if Rec.Get(rec."Order Number") then begin
            Rec."Order Number" := OrderNo;
            Rec.Modify(true);

        end else begin
            rec.Init();
            Rec."Order Number" := OrderNo;
            Rec.Insert(true);
        end;


        Message('New Order Number Generated : %1', Rec."Order Number");
        CurrPage.Update(false);
    end;
}
