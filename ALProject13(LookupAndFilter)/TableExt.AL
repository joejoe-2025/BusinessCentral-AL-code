// Table Extension for Lookup field

tableextension 50170 SalesHeaderExt extends "Sales Header"
{
    fields
    {

        field(60100; Customer_Onlookup; Text[100])
        {
            Caption = 'CustomerName_Onlookup';
        }

    }
}

