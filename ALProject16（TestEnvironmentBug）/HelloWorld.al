table 80200 "X FieldType Test"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code Field"; Code[20]) { DataClassification = ToBeClassified; }
        field(2; "Decimal Field"; Decimal) { DataClassification = ToBeClassified; }
        field(3; "Boolean Field"; Boolean) { DataClassification = ToBeClassified; }
    }

    keys
    {
        key(PK; "Code Field") { Clustered = true; }
    }
}

page 80201 "X FieldType Card"
{
    PageType = Card;
    SourceTable = "X FieldType Test";
    ApplicationArea = All;
    UsageCategory = Administration; // ✅ 关键点

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Code Field"; Rec."Code Field") { ApplicationArea = All; }
                field("Decimal Field"; Rec."Decimal Field") { ApplicationArea = All; }
                field("Boolean Field"; Rec."Boolean Field") { ApplicationArea = All; }
            }
        }
    }
}
page 80202 "X FieldType List"
{
    PageType = List;
    SourceTable = "X FieldType Test";
    ApplicationArea = All;

    UsageCategory = Lists;      // ✅ 重点 1
    Caption = 'X FieldType Test'; // ✅ 重点 2
    CardPageId = "X FieldType Card"; // ✅ 让你可以打开 Card 页面

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Field"; Rec."Code Field") { ApplicationArea = All; }
                field("Decimal Field"; Rec."Decimal Field") { ApplicationArea = All; }
                field("Boolean Field"; Rec."Boolean Field") { ApplicationArea = All; }
            }
        }
    }
}
