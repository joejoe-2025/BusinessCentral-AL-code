codeunit 53130 "Sales Location RC Enforcer"
{
    // ─────────────────────────── 订阅：地点变更时强校验（主入口） ───────────────────────────
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Location Code', true, true)]
    local procedure SL_OnAfterValidate_Location(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    begin
        if Rec.Type = Rec.Type::Item then
            EnforceLocationPermission(Rec);
    end;

    // ─────────────────────────── 订阅：单头地点改动后，重校验已录行 ───────────────────────────
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Location Code', true, true)]
    local procedure SH_OnAfterValidate_Location(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; CurrFieldNo: Integer)
    var
        SL: Record "Sales Line";
    begin
        SL.SetRange("Document Type", Rec."Document Type");
        SL.SetRange("Document No.", Rec."No.");
        if SL.FindSet() then
            repeat
                if SL.Type = SL.Type::Item then
                    EnforceLocationPermission(SL);
            until SL.Next() = 0;
    end;

    // ─────────────────────────── 主校验：只在行上已有 Location 时才校验 ───────────────────────────
    local procedure EnforceLocationPermission(var SalesLine: Record "Sales Line")
    var
        SH: Record "Sales Header";
        L: Code[10];
        EnforceLineEqualsHeader: Boolean;
    begin
        if SalesLine."Location Code" = '' then
            exit;

        L := SalesLine."Location Code";

        // 是否强制“行=头”（需要就设 true）
        EnforceLineEqualsHeader := false;
        if EnforceLineEqualsHeader then
            if SH.Get(SalesLine."Document Type", SalesLine."Document No.") then
                if (SH."Location Code" <> '') and (L <> SH."Location Code") then
                    Error('Line Location (%1) must equal Header Location (%2).', L, SH."Location Code");

        // RC 过滤权限
        EnsureAllowedByRespCenter(L);
    end;


    // （当前未用，但保留）
    local procedure GetEffectiveLocation(var SalesLine: Record "Sales Line"): Code[10]
    var
        SH: Record "Sales Header";
    begin
        if SalesLine."Location Code" <> '' then
            exit(SalesLine."Location Code");
        if SH.Get(SalesLine."Document Type", SalesLine."Document No.") then
            exit(SH."Location Code");
        exit('');
    end;

    // ─────────────────────────── 用 RC 过滤判断用户是否可售该地点 ───────────────────────────
    local procedure EnsureAllowedByRespCenter(L: Code[10])
    var
        US: Record "User Setup";
        Loc: Record Location;
        RC: Record "Responsibility Center";
        RC2: Record "Responsibility Center"; // 用来单独检查 RC 是否存在
        FilterTxt: Text;
        LocRC: Code[10];
        CombinedFilter: Text;
    begin
        // ① 用户与过滤器必须配置
        if not US.Get(UserId()) then
            Error('User %1 has no User Setup.', UserId());

        FilterTxt := US."Sales Resp. Ctr. Filter";
        if FilterTxt = '' then
            Error('User %1 has empty "Sales Resp. Ctr. Filter". Please set it in User Setup.', UserId());

        // ② 必须能取到地点与其 RC
        if not Loc.Get(L) then
            Error('Unknown Location %1.', L);

        // 兼容两种字段名：优先使用 Responsibility Center Code，若该字段不存在或取值为空，再尝试 Responsibility Center
        // --- 如果你的环境里第一行编译报错，注释第一行，启用第二行即可 ---
        LocRC := Loc."Responsibility Center Code";
        if LocRC = '' then
            LocRC := Loc."Responsibility Center Code";

        if LocRC = '' then
            Error('Location %1 has no Responsibility Center. Please set it on the Location card.', L);

        // ③ RC 代码必须在 RC 表中存在（避免因为代码不存在导致组合过滤“看似通过”）
        if not RC2.Get(LocRC) then
            Error('Responsibility Center %1 referenced by Location %2 does not exist in RC table.', LocRC, L);

        // ④ 组合过滤： (用户的过滤器) AND (等于该 RC 值)
        CombinedFilter := StrSubstNo('((%1))&(%2)', FilterTxt, LocRC);

        RC.Reset();
        RC.SetFilter(Code, CombinedFilter);

        if not RC.FindFirst() then
            Error(
              'User %1 is not allowed to sell at Location %2. RC=%3 is not within filter "%4".',
              UserId(), L, LocRC, FilterTxt);
    end;

}
