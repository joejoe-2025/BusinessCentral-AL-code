codeunit 50173 CustomerCityManualSync
{
    procedure SyncCustomerCity()
    var
        CustomerRec: Record Customer;
        CityRec: Record "Customer City";
    begin
        if CustomerRec.FindSet() then
            repeat
                if (CustomerRec.City <> '') and not CityRec.Get(CustomerRec.City) then begin
                    CityRec.Init();
                    CityRec.City := CustomerRec.City;
                    CityRec.Insert();
                end;
            until CustomerRec.Next() = 0;
        Message('City synchronization completed.');
    end;
}
