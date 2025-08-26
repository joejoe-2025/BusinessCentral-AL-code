pageextension 53141 ItemList_CopyActions extends "Item List"
{
    actions
    {
        addlast(Processing)
        {
            group("Copy / Sync")
            {
                action(CreateSKUsHere)
                {
                    ApplicationArea = All;
                    Caption = 'Create SKUs for Location';
                    Image = Create;

                    trigger OnAction()
                    var
                        PLoc: Page "Location list";           // ← 带引号
                        Loc: Record Location;
                        Items: Record Item;
                        Tool: Codeunit "Item Copy Tools"; // 你的 codeunit 53140
                    begin
                        Loc.Reset();
                        PLoc.SetTableView(Loc);           // ← 用页面变量实例调用
                        PLoc.LookupMode(true);
                        if PLoc.RunModal() in [Action::LookupOK, Action::OK] then begin
                            PLoc.GetRecord(Loc);
                            CurrPage.SetSelectionFilter(Items);
                            Tool.CreateSKUsForLocation(Items, Loc.Code);
                            Message('SKUs created/ensured for Location %1.', Loc.Code);
                        end;
                    end;
                }

                action(CopyItemsToCompany)
                {
                    ApplicationArea = All;
                    Caption = 'Copy Items to Company';
                    Image = Copy;

                    trigger OnAction()
                    var
                        Sel: Record Item;
                        Comp: Record Company;
                        P: Page "Companies";
                        TargetCompany: Text[30];
                        Resp: Action;
                        Tool: Codeunit "Item Copy Tools";
                    begin
                        // 1) 选择公司（用 Companies 页面做 Lookup）
                        Comp.Reset();
                        // 可选：只列出名字包含当前公司名的公司
                        // Comp.SetFilter(Name, '@%1', CompanyName);

                        P.SetTableView(Comp);
                        P.LookupMode(true);

                        Resp := P.RunModal();          // ← 先接收返回值
                        if (Resp <> Action::LookupOK)  // ← 再判断
                           and (Resp <> Action::OK) then
                            exit;

                        P.GetRecord(Comp);
                        TargetCompany := Comp.Name;

                        // 2) 把当前列表的选择集带入
                        CurrPage.SetSelectionFilter(Sel);

                        // 3) 调用复制逻辑（第三个参数：是否覆盖已存在）
                        Tool.CopyItemsToCompany(Sel, TargetCompany, true);
                    end;
                }
            }
        }
    }
}
