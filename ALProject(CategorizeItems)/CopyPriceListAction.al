pageextension 53191 ItemList_PL_Actions extends "Item List"
{
    actions
    {
        addlast(Processing)
        {
            action(CopyPriceListLines)
            {
                Caption = 'Copy to Price List';
                ApplicationArea = All;
                // Image = Price; // 如有无效图标告警，可先注释掉

                trigger OnAction()
                var
                    Cdu: Codeunit "Copy PriceList Lines";
                    Sel: Record Item;
                    SrcPL, TgtPL : Code[20];
                    Copied: Integer;
                    ViewTxt: Text;          // << 关键：保存多选/过滤的视图字符串
                begin
                    // 1) 先把页面多选/当前筛选“刷到 Rec”，并立即把视图保存下来
                    CurrPage.SetSelectionFilter(Rec);      // 把用户在页面上的多选刷到 Rec
                    ViewTxt := Rec.GetView();              // 保存完整视图（包含多选管道值、所有列过滤）

                    // 2) 再弹出目标/源价目表选择（这一步会清掉页面多选，但我们已有 ViewTxt）
                    if not PickPriceListByFilter(TgtPL, 'TARGET', 'TARGET Price List') then
                        exit;
                    if not PickPriceListByFilter(SrcPL, 'SOURCE', 'SOURCE Price List') then
                        exit;

                    // 3) 用保存的视图重建一个“选择快照”Sel，传给 codeunit
                    Sel.SetView(ViewTxt);
                    if Sel.IsEmpty() then begin
                        // 兜底：如果用户根本没多选，那就至少处理当前行
                        Sel.Reset();
                        Sel.SetRange("No.", Rec."No.");
                    end;

                    // 4) 执行复制
                    Copied := Cdu.RunWithFilter(Sel, SrcPL, TgtPL);

                    if Copied > 0 then begin
                        Message('%1 line(s) copied from %2 to %3.', Copied, SrcPL, TgtPL);
                        Cdu.OpenTargetPriceList(TgtPL); // 需要就保留；若没有该页可注释
                    end else
                        Message('No lines copied. Check if selected items have lines in %1, or they already exist in %2.',
                                SrcPL, TgtPL);
                end;

            }
        }
    }

    /// 价目表选择：FilterPageBuilder（同一个 KeyName 串起 AddTable/AddField/GetView）
    /// 注意：你这版需要 FieldRef 重载的 AddField。
    local procedure PickPriceListByFilter(var OutCode: Code[20]; KeyName: Text; Title: Text): Boolean
    var
        FPB: FilterPageBuilder;
        RR: RecordRef;
        FR: FieldRef;
        H: Record "Price List Header";
        ViewTxt: Text;
    begin
        // 打开表以获取 FieldRef
        RR.Open(Database::"Price List Header");

        // 1) 表：KeyName + TableNo（Integer 重载）
        FPB.AddTable(KeyName, Database::"Price List Header");

        // 2) 字段：KeyName + FieldRef（你的环境需要这个重载）
        FR := RR.Field(H.FieldNo(Code));
        FPB.AddField(KeyName, FR);

        // 3) 弹出过滤页
        if not FPB.RunModal() then begin
            RR.Close();
            exit(false);
        end;

        // 4) 取视图：用同一个 KeyName
        ViewTxt := FPB.GetView(KeyName);
        RR.Close();

        // 5) 应用视图并取记录
        H.SetView(ViewTxt);
        if not H.FindFirst() then
            Error('No Price List matched your filter.');

        OutCode := H.Code;
        exit(true);
    end;
}

pageextension 53161 SkuList_CopyActions extends "Stockkeeping Unit List"
{
    actions
    {
        addlast(Processing)
        {
            group("Copy/Sync")
            {
                action(CopySkuToLocation)
                {
                    Caption = 'Copy SKU to Another Location';
                    ApplicationArea = All;
                    Image = Copy;

                    trigger OnAction()
                    var
                        Cdu: Codeunit "Create SKUs For Location";
                        Loc: Record Location;
                        P: Page "Location List";
                        TargetLoc: Code[10];
                    begin
                        // 选择目标 Location
                        P.SetTableView(Loc);
                        P.LookupMode(true);
                        if P.RunModal() in [Action::LookupOK, Action::OK] then begin
                            P.GetRecord(Loc);
                            TargetLoc := Loc.Code;
                        end else
                            exit;

                        CurrPage.SetSelectionFilter(Rec);
                        Cdu.RunFromSKU(Rec, TargetLoc);

                        Message('Selected SKUs copied to location %1.', TargetLoc);
                    end;
                }
            }
        }
    }
}
