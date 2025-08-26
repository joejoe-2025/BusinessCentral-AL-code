table 53150 "Allowed Company"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "User ID"; Code[50]) { DataClassification = CustomerContent; }
        field(2; "Company Name"; Text[30]) { DataClassification = CustomerContent; }
        field(3; "Allowed"; Boolean) { DataClassification = CustomerContent; }
    }

    keys
    {
        key(PK; "User ID", "Company Name") { Clustered = true; }
    }
}
page 53150 "Allowed Companies"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Allowed Company";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company Name"; Rec."Company Name") { ApplicationArea = All; }
                field(Allowed; Rec.Allowed) { ApplicationArea = All; }
            }
        }
    }
}

page 53151 "Multi-Company Items"
{
    PageType = List;
    ApplicationArea = All;
    SourceTableTemporary = true; // 临时表承载跨公司数据
    SourceTable = Item;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company Name"; Rec."Global Dimension 1 Code") // 用临时字段存公司名
                {
                    ApplicationArea = All;
                    Caption = 'Company';
                }
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Base Unit of Measure"; Rec."Base Unit of Measure") { ApplicationArea = All; }
            }
        }
    }

    trigger OnOpenPage()
    var
        Comp: Record Company;
        Allow: Record "Allowed Company";
        TempItem: Record Item temporary;
    begin
        // 遍历所有公司
        if Comp.FindSet() then
            repeat
                // 检查是否允许
                if Allow.Get(UserId(), Comp.Name) and Allow.Allowed then begin
                    Rec.ChangeCompany(Comp.Name);
                    if Rec.FindSet() then
                        repeat
                            TempItem := Rec;
                            TempItem."Global Dimension 1 Code" := Comp.Name; // 用来显示公司名
                            TempItem.Insert();
                        until Rec.Next() = 0;
                end;
            until Comp.Next() = 0;

        Rec.Copy(TempItem);
    end;
}
