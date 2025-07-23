tableextension 50612 Extension extends Item
{
    fields
    {
        field(51001; ItemLogo1; Text[10])
        {
            Caption = 'Item Logo1';
            DataClassification = CustomerContent;
            Editable = true;
        }

        field(52001; ItemLogo2; Media)
        {
            Caption = 'Item Logo2';
            DataClassification = CustomerContent;
            Editable = true;
        }
    }
}