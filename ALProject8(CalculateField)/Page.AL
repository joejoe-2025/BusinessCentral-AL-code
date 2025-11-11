pageextension 50664 MyItemCardExt extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            field("Inventory Value"; InventoryValue)
            {
                ApplicationArea = All;
                Caption = 'Inventory Value (Calculated)';
                Editable = false;
            }

            field("Number 1"; Rec."Number 1")
            {
                ApplicationArea = All;
            }

            field("Number 2"; Rec."Number 2")
            {
                ApplicationArea = All;
            }

            field("Number 3"; Rec."Number 3")
            {
                ApplicationArea = All;
            }

            field(Result; Rec.Result)
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Calculated: Number 1 * Number 2 - Number 3';
            }
        }
    }

    actions
    {
        addlast(Processing)
        {
            action(ManualCheckResult)
            {
                ApplicationArea = All;
                Caption = 'Check/Update Result';
                Image = Calculate;
                trigger OnAction()
                begin
                    CheckAndUpdateResult();
                end;
            }
        }
    }

    var
        InventoryValue: Decimal;
        DidRunAutoCheck: Boolean;

    trigger OnAfterGetRecord()
    begin
        InventoryValue := CalcInventoryValue(Rec);
        if not DidRunAutoCheck then begin
            DidRunAutoCheck := true;
            CheckAndUpdateResult();
        end;
    end;

    local procedure CalcInventoryValue(Item: Record Item): Decimal
    begin
        case Item."Stockout Warning" of
            Item."Stockout Warning"::Yes:
                exit(Item.Inventory * Item."Unit Price");
            Item."Stockout Warning"::No:
                exit(Item.Inventory * Item."Unit Price" + Item."Unit Price" * 0.1);
            else
                exit(Item.Inventory * Item."Unit Price" + Item."Unit Price" * 0.1 + Item."Unit Cost");
        end;
    end;

    local procedure CheckAndUpdateResult()
    var
        CalculatedResult: Decimal;
    begin
        CalculatedResult := Rec."Number 1" * Rec."Number 2" - Rec."Number 3";

        if Rec.Result <> CalculatedResult then begin
            Message('⚠️ Result was %1, but correct value is %2. Updating now.', Rec.Result, CalculatedResult);
            Rec.Result := CalculatedResult;
            CurrPage.SaveRecord(); // 写入数据库
        end else
            Message('✅ Result matches calculated value: %1', CalculatedResult);

        CurrPage.Update();
    end;
}
