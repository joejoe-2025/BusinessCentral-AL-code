codeunit 70000 "SalesOrder Dim Guard"
{
    // 仅在 CRONUS 公司下启用限制
    local procedure IsCronusCompany(): Boolean
    var
        // 也可以直接用 CompanyName 常量；这里做一个“前缀判断”更稳妥
        nameTxt: Text;
    begin
        nameTxt := UpperCase(CompanyName);  // 例如 'CRONUS Canada, Inc.'
        exit(CopyStr(nameTxt, 1, 6) = 'CRONUS');  // 只要以 CRONUS 开头就生效
        // 如果你只想匹配一个精确公司名，请改成：
        // exit(nameTxt = 'CRONUS CANADA, INC.');
    end;

    // 当销售单选择/更改客户时，做维度检查
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer No.', true, true)]
    local procedure SH_OnAfterValidate_SellTo(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; CurrFieldNo: Integer)
    var
        dimVal: Code[20];
    begin
        if not IsCronusCompany() then
            exit;  // 不是 CRONUS 公司，直接放行

        if Rec."Sell-to Customer No." = '' then
            exit;

        dimVal := GetCustomerDefaultDim(Rec."Sell-to Customer No.", 'AREA');

        // 只允许 AREA = '70'（America North），否则禁止下单
        if dimVal <> '70' then
            Error(
              'Customer %1 is not allowed to create Sales Orders in company %2 because AREA dimension is %3 (must be 70).',
              Rec."Sell-to Customer No.", CompanyName, dimVal);
    end;

    //（可选）在插入销售单前再兜底一次；防止某些导入/接口绕过字段验证
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeInsertEvent', '', true, true)]
    local procedure SH_OnBeforeInsert(var Rec: Record "Sales Header"; RunTrigger: Boolean)
    var
        dimVal: Code[20];
    begin
        if not IsCronusCompany() then
            exit;

        if Rec."Sell-to Customer No." = '' then
            exit;

        dimVal := GetCustomerDefaultDim(Rec."Sell-to Customer No.", 'AREA');
        if dimVal <> '70' then
            Error(
              'Customer %1 is not allowed to create Sales Orders in company %2 because AREA dimension is %3 (must be 70).',
              Rec."Sell-to Customer No.", CompanyName, dimVal);
    end;

    // 读取客户的默认维度值（Default Dimension 表）
    local procedure GetCustomerDefaultDim(CustNo: Code[20]; DimCode: Code[20]): Code[20]
    var
        DefDim: Record "Default Dimension";
    begin
        if (CustNo = '') or (DimCode = '') then
            exit('');

        if DefDim.Get(Database::Customer, CustNo, DimCode) then
            exit(DefDim."Dimension Value Code")
        else
            exit('');  // 未设置时返回空
    end;
}
