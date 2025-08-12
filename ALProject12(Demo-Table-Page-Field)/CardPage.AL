page 50188 "Demo Field Types Card"
{
    PageType = Card;
    SourceTable = "Demo Field Types";
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Demo Field Types Card';


    layout
    {
        area(content)
        {
            group(General)
            {
                field("ID"; Rec."ID") { ApplicationArea = All; }
                field("Text Field"; Rec."Text Field") { ApplicationArea = All; }
                field("Date Field"; Rec."Date Field") { ApplicationArea = All; }
                field("DateTime Field"; Rec."DateTime Field") { ApplicationArea = All; }
                field("Code Field"; Rec."Code Field") { ApplicationArea = All; }
                field("Integer Field"; Rec."Integer Field") { ApplicationArea = All; StyleExpr = 'Favorable'; }
                field("Decimal Field"; Rec."Decimal Field") { ApplicationArea = All; StyleExpr = 'Unfavorable'; }
                field("Boolean Field"; Rec."Boolean Field") { ApplicationArea = All; }
                field("Option Field"; Rec."Option Field") { ApplicationArea = All; }
                field(Color; Rec.Color) { ApplicationArea = All; ToolTip = 'Select a color emoji'; }


            }

            group(Autonumber)
            {
                Caption = 'Autonumber🚚 🚛 🚜 🛒 📦 🏷';
                field("Company Code"; Rec."Company Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select the company this customer belongs to.';
                }

                field("AutoNumber Customer No."; Rec."AutoNumber Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Auto-generated customer number based on company and year.';
                }
            }

            group("LookUp & OnLookup")
            {
                Caption = 'LookUp / OnLookup';
                field("Referral Person Code"; Rec."Referral Person Code")
                {
                    ApplicationArea = All;
                    LookupPageId = 14;
                }

                field("Selected Customer"; Rec.Customer_Onlookup)
                {
                    ApplicationArea = All;
                    Caption = 'Select Customer🚚 ';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        CustomerRec: Record Customer;
                    begin
                        if Page.RunModal(Page::"Customer List", CustomerRec) = Action::LookupOK then begin
                            Text := CustomerRec.Name;
                            Rec.Customer_Onlookup := CustomerRec.Name;
                            exit(true);
                        end;
                        exit(false);
                    end;
                }
            }

            group(Calculate)
            {
                Caption = 'Calculation: Result = Number1 * Number2 - Number3';

                field("Number 1"; Rec."Number 1")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        UpdateResult();
                    end;
                }

                field("Number 2"; Rec."Number 2")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        UpdateResult();
                    end;
                }

                field("Number 3"; Rec."Number 3")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        UpdateResult();
                    end;
                }

                field("Result"; Result)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Calculated: Number 1 * Number 2 - Number 3';
                }
            }

            group(RollupField)
            {
                Caption = 'RollupField';
                field("Customer Sales Amount"; Rec."Customer Sales Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This is a rollup field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GenerateID)
            {
                Caption = 'Generate ID';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec."ID" := Format(CreateGuid());
                    CurrPage.Update();
                end;
            }
        }
    }

    var
        Result: Decimal;

    trigger OnAfterGetRecord()
    begin
        UpdateResult(false); // 仅更新页面显示，不写入数据库
    end;

    local procedure UpdateResult(WriteToTable: Boolean)
    begin
        Result := Rec."Number 1" * Rec."Number 2" - Rec."Number 3";

        if WriteToTable and (Rec."Result" <> Result) then begin
            Rec."Result" := Result;
            CurrPage.SaveRecord();
        end;

        CurrPage.Update();
    end;

    local procedure UpdateResult()
    begin
        UpdateResult(true); // 供 OnValidate 使用，需写入字段
    end;
}
