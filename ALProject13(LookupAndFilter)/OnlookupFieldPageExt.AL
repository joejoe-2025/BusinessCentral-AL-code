// Page Extension for OnLookup field
pageextension 60130 SalesOrderCustomerOn_LookupExt extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("Selected Customer"; Rec.Customer_Onlookup)
            {
                ApplicationArea = All;
                Caption = 'Select Customer';

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
    }
}
