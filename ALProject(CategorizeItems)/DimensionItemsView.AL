tableextension 53141 ItemDimExt extends Item
{
    fields
    {
        field(53140; "Company Dim (FLOW)"; Code[20])
        {
            Caption = 'Company Dimension';
            FieldClass = FlowField;
            CalcFormula = lookup("Default Dimension"."Dimension Value Code"
                where("Table ID" = const(27),    // 27 = Item
                      "No." = field("No."),
                      "Dimension Code" = const('COMPANIES')));
            Editable = false;
        }
    }
}

pageextension 53561 ItemList_DimFilter extends "Item List"
{
    actions
    {
        addafter(PeriodicActivities)
        {
            group(CompanyFilter)
            {
                Caption = 'Company Filter';

                action(ViewBALOCAL)
                {
                    Caption = 'BALOCAL';
                    ApplicationArea = All;
                    Image = Filter;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        ToggleExclusive('1001');  // 用你的维度值
                    end;
                }

                action(ViewBAROYAL)
                {
                    Caption = 'BAROYAL';
                    ApplicationArea = All;
                    Image = Filter;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        ToggleExclusive('1002');
                    end;
                }

                action(ViewBAUS)
                {
                    Caption = 'BAUS';
                    ApplicationArea = All;
                    Image = Filter;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        ToggleExclusive('1003');
                    end;
                }

                action(ClearCompanyFilter)
                {
                    Caption = 'Clear Company Filter';
                    ApplicationArea = All;
                    Image = ClearFilter;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        SetCompanyFilter('');   // 清空
                    end;
                }


            }
        }
    }

    // === helpers ===================================================

    local procedure ToggleCompanyFilter(CodeVal: Code[20])
    var
        f: Text;
    begin
        f := GetCompanyFilter(); // 从“组2”读取当前过滤
        if InOrList(f, CodeVal) then
            f := RemoveFromOrList(f, CodeVal)    // 已存在 => 取消
        else
            f := AddToOrList(f, CodeVal);        // 不存在 => 加入
        SetCompanyFilter(f);                     // 写回“组2”
    end;

    local procedure GetCompanyFilter(): Text
    var
        saved: Integer;
        txt: Text;
    begin
        saved := Rec.FilterGroup();
        Rec.FilterGroup(2);
        txt := Rec.GetFilter("Company Dim (FLOW)");
        Rec.FilterGroup(saved);
        exit(txt);
    end;

    local procedure SetCompanyFilter(FilterTxt: Text)
    var
        saved: Integer;
    begin
        saved := Rec.FilterGroup();
        Rec.FilterGroup(2);
        if FilterTxt = '' then
            Rec.SetRange("Company Dim (FLOW)")
        else
            Rec.SetFilter("Company Dim (FLOW)", FilterTxt);
        Rec.FilterGroup(saved);

        CurrPage.Update(false);
    end;

    // —— OR 列表工具（值用 | 连接）——

    local procedure InOrList(List: Text; Val: Code[20]): Boolean
    begin
        // 用哨兵竖线包裹，防止 100 与 1001 误匹配
        exit(StrPos('|' + List + '|', '|' + Format(Val) + '|') > 0);
    end;

    local procedure AddToOrList(List: Text; Val: Code[20]): Text
    begin
        if List = '' then
            exit(Format(Val))
        else
            exit(StrSubstNo('%1|%2', List, Val));
    end;

    local procedure ToggleExclusive(CodeVal: Code[20])
    var
        curr: Text;
    begin
        curr := GetCompanyFilter();            // 当前过滤（可能为空或一个值）
        if curr = Format(CodeVal) then
            SetCompanyFilter('')               // 再次点击同一项 => 清空
        else
            SetCompanyFilter(Format(CodeVal)); // 只保留这一项（互斥）
    end;


    local procedure RemoveFromOrList(List: Text; Val: Code[20]): Text
    var
        S: Text;
        Needle: Text;
        Pos, Len : Integer;
    begin
        // 用竖线包裹，保证只删完整 token
        S := '|' + List + '|';
        Needle := '|' + Format(Val) + '|';
        Len := StrLen(Needle);

        Pos := StrPos(S, Needle);
        if Pos > 0 then
            S := DelStr(S, Pos, Len);  // ✅ 直接删除，不再使用 CopyStr

        // 去掉首尾多余的竖线
        if (S <> '') and (CopyStr(S, 1, 1) = '|') then
            S := CopyStr(S, 2, StrLen(S) - 1);
        if (S <> '') and (CopyStr(S, StrLen(S), 1) = '|') then
            S := CopyStr(S, 1, StrLen(S) - 1);

        exit(S);
    end;


}
