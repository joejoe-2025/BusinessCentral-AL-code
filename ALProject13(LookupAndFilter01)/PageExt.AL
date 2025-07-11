pageextension 50190 MySalesOrderExt extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("City Filter"; Rec."City Filter")
            {
                ApplicationArea = all;
                Editable = true;
            }
            field("Referral Customer"; Rec."Referral Customer")
            {
                ApplicationArea = all;
                Editable = true;
            }
        }
    }
    actions
    {
        addfirst(Processing)
        {
            action(SyncCityList)
            {
                ApplicationArea = all;
                Caption = 'SyncCityList';
                trigger OnAction()
                var
                    SyncCodeunit: Codeunit "CustomerCityManualSync";
                begin
                    SyncCodeunit.SyncCustomerCity();
                end;
            }
        }
    }

}
