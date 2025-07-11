pageextension 50390 ItemCard_Printing extends "Item Card"
{
    actions
    {
        addfirst(Processing)
        {
            action(PrintNow)
            {
                Caption = 'Print>>>>>';
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process; // 显示在“处理”区域
                PromotedOnly = true;        // 只显示在 Action Bar，不出现在菜单中

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
