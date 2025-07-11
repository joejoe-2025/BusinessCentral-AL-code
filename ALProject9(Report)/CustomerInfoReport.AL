report 50189 "Cusomer Info"
{
    ApplicationArea = All;
    Caption = 'Cusomer Info Report Word';
    UsageCategory = ReportsAndAnalysis;


    WordLayout = 'Cusomer Info.docx';
    DefaultLayout = Word;
    dataset
    {
        dataitem(CusomerInfo; Customer)
        {
            column(Name; Name)
            {
            }

            column(No_; "No.")
            {
            }
            column(City; City)
            {
            }
            column(Contact; Contact)
            {
            }
        }
    }

}
