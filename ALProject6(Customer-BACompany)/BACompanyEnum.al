enum 50601 BACompanyEnum
{
    Extensible = false;
    Caption = 'BA Company Options';

    value(0; Blank) { Caption = ''; } // ✅ Default empty value

    value(1; PetSaveDirect) { Caption = 'PetSaveDirect'; }
    value(2; RoyalAquatic) { Caption = 'Royal Aquatic'; }
    value(3; DirectBuy) { Caption = 'Direct Buy'; }
    value(4; CorporateStores) { Caption = 'Corporate Stores'; }
    value(5; RetailStores) { Caption = 'Retail Stores'; }
    value(6; WorldWidePets) { Caption = 'WorldWide Pets'; }
}
