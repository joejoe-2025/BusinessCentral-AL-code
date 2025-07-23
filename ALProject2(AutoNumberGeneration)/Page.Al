page 50145 "Customer Order List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Customer Order";
    Caption = 'Customer Order List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Order Number"; Rec."Order Number")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Order Series"; Rec."Order Series")
                {
                    ApplicationArea = All;
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
                var
                    NewOrder: Record "Customer Order";
                begin
                    NewOrder.Init();
                    NewOrder."Order Series" := 'ORDER'; // 替换成你已有的编号系列代码
                    NewOrder.Insert(true); // 触发表的 OnInsert，自动生成编号
                    CurrPage.Update(false); // 刷新页面
                    Message('New Order Created: %1', NewOrder."Order Number");
                end;
            }

            action(GenerateNumber)
            {
                Caption = 'Generate Order Number';
                ApplicationArea = All;
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
            Error('Please select the order series first.');

        if Rec."Order Number" <> '' then
            if not Confirm('An order number already exists. Do you want to generate a new one?', false) then
                exit;

        OrderNo := NoSeriesMgt.GetNextNo(Rec."Order Series", WorkDate(), true);

        Rec."Order Number" := OrderNo;
        Rec.Modify(true);

        CurrPage.Update(false);
        Message('New Order Number Generated: %1', OrderNo);
    end;
}
