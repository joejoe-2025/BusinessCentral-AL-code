pageextension 50550 ItemCardExt extends "Item Card"
{
    layout
    {
        addafter(Inventory)
        {
            group("Inventory Monitor")
            {
                field("Inventory Threshold"; Rec."Inventory Threshold")
                {
                    ApplicationArea = All;
                }

                field("Low Inventory"; Rec."Low Inventory")
                {
                    ApplicationArea = All;
                    StyleExpr = Rec."Low Inventory Style";
                }
                field("RestockQuantity"; Rec."RestockQuantity")
                {
                    ApplicationArea = All;
                    StyleExpr = Rec."RestockQuantity";
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateLowInventory();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateLowInventory();
    end;

    local procedure UpdateLowInventory()
    begin
        if Rec."Inventory Threshold" > 0 then begin
            if Rec.Inventory < Rec."Inventory Threshold" then begin
                Rec."Low Inventory" := Rec."Low Inventory"::Yes;
                Rec."Low Inventory Style" := 'Unfavorable'; // 红色
            end else begin
                Rec."Low Inventory" := Rec."Low Inventory"::No;
                Rec."Low Inventory Style" := 'Favorable'; // 蓝色
            end;
        end else begin
            Rec."Low Inventory" := Rec."Low Inventory"::No;
            Rec."Low Inventory Style" := '';
        end;
    end;
}
