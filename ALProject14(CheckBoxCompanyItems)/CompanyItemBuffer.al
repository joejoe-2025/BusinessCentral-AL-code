table 55100 "Company Item Buffer"
{
    fields
    {
        field(1; "Company Name"; Code[50]) { }
        field(2; "Item No."; Code[20]) { }
        field(3; Description; Text[100]) { }
        field(4; Inventory; Decimal) { }
        field(5; "Base Unit of Measure"; Code[10]) { }
        field(6; "Item Category Code"; Code[20]) { }
        field(7; "Unit Price"; Decimal) { }
        field(8; "Unit Cost"; Decimal) { }
    }

    keys
    {
        key(PK; "Company Name", "Item No.") { Clustered = true; }
    }
}
codeunit 55102 "Multi Company Loader"
{
    procedure LoadItems(var Buf: Record "Company Item Buffer" temporary; ShowCronus: Boolean; ShowMyNew: Boolean; ShowTest: Boolean)
    begin
        if ShowCronus then
            LoadFromCompany(Buf, 'CRONUS Canada, Inc.');

        if ShowMyNew then
            LoadFromCompany(Buf, 'My new Company');

        if ShowTest then
            LoadFromCompany(Buf, 'Test Company');
    end;

    local procedure LoadFromCompany(var Buf: Record "Company Item Buffer" temporary; CompanyName: Text)
    var
        Item: Record Item;
    begin
        Item.ChangeCompany(CompanyName);
        if Item.FindSet() then
            repeat
                Item.CalcFields(Inventory);

                Buf.Init();
                Buf."Company Name" := CompanyName;
                Buf."Item No." := Item."No.";
                Buf.Description := Item.Description;
                Buf.Inventory := Item.Inventory;
                Buf."Base Unit of Measure" := Item."Base Unit of Measure";
                Buf."Item Category Code" := Item."Item Category Code";
                Buf."Unit Price" := Item."Unit Price";
                Buf."Unit Cost" := Item."Unit Cost";
                Buf.Insert();
            until Item.Next() = 0;
    end;
}

page 55101 "Company Item Buffer List"
{
    PageType = List;
    SourceTable = "Company Item Buffer";
    SourceTableTemporary = true;   // ✅ 用临时表
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(Control)
            {
                field(ShowCronus; ShowCronus)
                {
                    ApplicationArea = All;
                    Editable = true;
                    trigger OnValidate()
                    begin
                        LoadData();
                    end;
                }
                field(ShowMyNew; ShowMyNew)
                {
                    ApplicationArea = All;
                    Editable = true;
                    trigger OnValidate()
                    begin
                        LoadData();
                    end;
                }
                field(ShowTest; ShowTest)
                {
                    ApplicationArea = All;
                    Editable = true;
                    trigger OnValidate()
                    begin
                        LoadData();
                    end;
                }
            }

            repeater(Group)
            {
                field("Company Name"; Rec."Company Name") { ApplicationArea = All; }
                field("Item No."; Rec."Item No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Inventory; Rec.Inventory) { ApplicationArea = All; }
                field("Base Unit of Measure"; Rec."Base Unit of Measure") { ApplicationArea = All; }
                field("Item Category Code"; Rec."Item Category Code") { ApplicationArea = All; }
                field("Unit Price"; Rec."Unit Price") { ApplicationArea = All; }
                field("Unit Cost"; Rec."Unit Cost") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Reload)
            {
                Caption = 'Reload Items';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    LoadData();
                end;
            }
        }
    }

    var
        ShowCronus: Boolean;
        ShowMyNew: Boolean;
        ShowTest: Boolean;

    local procedure LoadData()
    var
        Loader: Codeunit "Multi Company Loader";
    begin
        Rec.Reset();
        Rec.DeleteAll();

        Loader.LoadItems(Rec, ShowCronus, ShowMyNew, ShowTest);

        CurrPage.Update(false);  // ✅ 用 false 避免 UI 冲突
    end;
}
