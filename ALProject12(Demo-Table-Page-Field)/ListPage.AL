page 50189 "Demo Field Types List"
{
    PageType = List;
    SourceTable = "Demo Field Types";
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Demo Field Types List';
    CardPageId = "Demo Field Types Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID"; Rec."ID") { ApplicationArea = All; }
                field("Text Field"; Rec."Text Field") { ApplicationArea = All; }
                field("Date Field"; Rec."Date Field") { ApplicationArea = All; }
                field("DateTime Field"; Rec."DateTime Field") { ApplicationArea = All; }
                field("Code Field"; Rec."Code Field") { ApplicationArea = All; }
                field("Integer Field"; Rec."Integer Field") { ApplicationArea = All; }
                field("Decimal Field"; Rec."Decimal Field") { ApplicationArea = All; }
                field("Boolean Field"; Rec."Boolean Field") { ApplicationArea = All; }
                field("Option Field"; Rec."Option Field") { ApplicationArea = All; }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewDemo)
            {
                Caption = 'New Demo';
                ApplicationArea = All;
                Image = NewDocument;
                trigger OnAction()
                var
                    RecNew: Record "Demo Field Types";
                begin
                    RecNew.Init();
                    RecNew."ID" := Format(CreateGuid());
                    RecNew.Insert(true);
                    PAGE.Run(PAGE::"Demo Field Types Card", RecNew);
                end;
            }
        }
    }
}
