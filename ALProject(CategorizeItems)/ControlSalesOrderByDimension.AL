tableextension 53162 "SalesLine_CompanyDimExt" extends "Sales Line"
{
    fields
    {
        // 物料的默认公司维度（来自 Default Dimension, Table 352）
        field(53160; "Item Company Dim (FLOW)"; Code[20])
        {
            Caption = 'Item Company Dim';
            FieldClass = FlowField;
            CalcFormula = lookup("Default Dimension"."Dimension Value Code"
                where("Table ID" = const(Database::Item),   // 27
                      "No." = field("No."),
                      "Dimension Code" = const('COMPANIES')));    // ← 换成你的维度代码
            Editable = true;
        }

        // 行上实际使用的公司维度（来自 Dimension Set Entry, Table 480）
        field(53161; "Line Company Dim (FLOW)"; Code[20])
        {
            Caption = 'Line Company Dim';
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code"
                where("Dimension Set ID" = field("Dimension Set ID"),
                      "Dimension Code" = const('COMPANIES')));  // ← 换成你的维度代码
            Editable = true;
        }
    }
}
pageextension 53162 "SalesLine_CompanyDimPE" extends "Sales Order Subform"
{
    layout
    {
        // 把两个只读 FlowField 加在物料号后面
        addafter("No.")
        {
            field("Item Company Dim (FLOW)"; Rec."Item Company Dim (FLOW)")
            {
                ApplicationArea = All;
                ToolTip = 'Default company dimension from the item.';
            }
            field("Line Company Dim (FLOW)"; Rec."Line Company Dim (FLOW)")
            {
                ApplicationArea = All;
                ToolTip = 'Actual company dimension on this line.';
            }
        }
    }
}

codeunit 53131 "Sales CompanyDim Guard"
{
    // ======= 可配置区 =======
    var
        CompanyDimCode: Label 'COMPANIES', Locked = true;   // 你的公司维度代码
        // 只允许的“维度值 Code”（例：1001= BALOCAL）
        AllowedValueCodesTxt: Label '1001', Locked = true;   // 可写成 '1001|1002' 表示允许多值
        EnforceLineDim: Boolean;                     // true = 行维度也必须为允许值
    // ========================

    // Type 变化
    [EventSubscriber(ObjectType::Table, Database::"Sales Line",
        'OnAfterValidateEvent', 'Type', true, true)]
    local procedure SL_AfterValidate_Type(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        if Rec.Type = Rec.Type::Item then
            EnforceCompanyDim(Rec);
    end;

    // No. 变化
    [EventSubscriber(ObjectType::Table, Database::"Sales Line",
        'OnAfterValidateEvent', 'No.', true, true)]
    local procedure SL_AfterValidate_No(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        if Rec.Type = Rec.Type::Item then
            EnforceCompanyDim(Rec);
    end;

    // 维度被改动
    [EventSubscriber(ObjectType::Table, Database::"Sales Line",
        'OnAfterValidateEvent', 'Dimension Set ID', true, true)]
    local procedure SL_AfterValidate_DimSetID(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        if Rec.Type = Rec.Type::Item then
            EnforceCompanyDim(Rec);
    end;


    // ============ 规则核心 ============
    local procedure EnforceCompanyDim(var SalesLine: Record "Sales Line")
    var
        ItemDimCode: Code[20];
        LineDimCode: Code[20];
    begin
        if SalesLine."No." = '' then
            exit;

        // 1) 物料默认维度：COMPANIES 必须是允许的 Code（如 1001）
        ItemDimCode := GetItemCompanyDimCode(SalesLine."No.");
        if not IsAllowed(ItemDimCode) then
            Error(
              'Only items with %1 in (%2) can be sold. Item %3 has %1 = %4 (or blank).',
              CompanyDimCode, AllowedValueCodesTxt, SalesLine."No.", ItemDimCode);

        // 2)（可选）销售行上的维度也必须在允许集合中
        if EnforceLineDim then begin
            LineDimCode := GetLineCompanyDimCode(SalesLine);
            if not IsAllowed(LineDimCode) then
                Error(
                  'The sales line must have %1 in (%2). Current value is %3.',
                  CompanyDimCode, AllowedValueCodesTxt, LineDimCode);
        end;
    end;

    // 读取 Item 的默认维度值 Code（Default Dimension）
    local procedure GetItemCompanyDimCode(ItemNo: Code[20]): Code[20]
    var
        DD: Record "Default Dimension";
    begin
        DD.SetRange("Table ID", Database::Item);
        DD.SetRange("No.", ItemNo);
        DD.SetRange("Dimension Code", CompanyDimCode);
        if DD.FindFirst() then
            exit(DD."Dimension Value Code"); // ← 就是 1001/1002/1003 这种 Code
        exit('');
    end;

    // 读取销售行维度集合中的公司维度 Code
    local procedure GetLineCompanyDimCode(SL: Record "Sales Line"): Code[20]
    var
        DSE: Record "Dimension Set Entry";
    begin
        if SL."Dimension Set ID" = 0 then
            exit('');
        DSE.SetRange("Dimension Set ID", SL."Dimension Set ID");
        DSE.SetRange("Dimension Code", CompanyDimCode);
        if DSE.FindFirst() then
            exit(DSE."Dimension Value Code");
        exit('');
    end;

    // 允许的 Code 校验（支持多值，用竖线 | 分隔）
    local procedure IsAllowed(ValueCode: Code[20]): Boolean
    var
        Rest: Text;
        One: Text;
        Sep: Text[1];
    begin
        if ValueCode = '' then
            exit(false);

        Sep := '|';
        Rest := AllowedValueCodesTxt;  // 如 '1001' 或 '1001|1002'

        // 快速等值（单值最常见）
        if Rest = ValueCode then
            exit(true);

        // 多值：拆分对比
        while StrLen(Rest) > 0 do begin
            One := SelectStr(1, Rest); // AL 没有内置；如报错可用下面手工拆分
            // 简易拆分
            if StrPos(Rest, Sep) > 0 then begin
                One := CopyStr(Rest, 1, StrPos(Rest, Sep) - 1);
                Rest := CopyStr(Rest, StrPos(Rest, Sep) + 1);
            end else begin
                One := Rest;
                Rest := '';
            end;

            if One = ValueCode then
                exit(true);
        end;

        exit(false);
    end;
}
