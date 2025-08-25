pageextension 53430 ItemList_Ext extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("Location Filter"; Rec."Location Filter")
            {
                ApplicationArea = All;
                Caption = 'Location Filter';
            }
        }
    }
}

pageextension 53320 ItemList_LocFilterActions extends "Item List"
{
    actions
    {

        addfirst(Processing) // 或 addlast(Navigation) 按你喜好
        {
            group("Quick Location")
            {
                Caption = 'Quick Location';

                action(SetBALocal)
                {
                    Caption = 'BALocal';
                    Image = Warehouse;
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Rec.SETFILTER("Location Filter", 'BALocal');
                        Rec.SETFILTER(Inventory, '>0'); // 关键：只显示库存 > 0
                        CurrPage.UPDATE(false);
                    end;
                }

                action(SetBARoyal)
                {
                    Caption = 'BARoyal';
                    Image = Warehouse;
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Rec.SETFILTER("Location Filter", 'BARoyal');
                        Rec.SETFILTER(Inventory, '>0'); // 关键：只显示库存 > 0
                        CurrPage.UPDATE(false);
                    end;
                }

                action(ClearLocFilter)
                {
                    Caption = 'All';

                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Rec.SETRANGE("Location Filter");
                        CurrPage.UPDATE(false);
                    end;
                }
            }
        }

    }
}
