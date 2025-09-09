pageextension 55103 ItemListExt extends "Item List"
{
    actions
    {
        addafter(History)   // 把按钮放在 Navigation 菜单组的最后
        {
            action(OpenCompanyItems)
            {
                Caption = 'View All Companies Items';
                ApplicationArea = All;
                Image = List;  // 也可以用其他图标
                ToolTip = 'Go and see all companies items here';

                trigger OnAction()
                var
                    CompanyItemPage: Page "Company Item Buffer List";
                begin
                    PAGE.Run(PAGE::"Company Item Buffer List");
                end;
            }
        }
    }
}
