//Add action, action group into the role explorer
pageextension 50181 "Role1" extends "Security Admin Role Center"
{

    actions
    {
        addfirst(embedding)
        {
            action(BigAlsCompany)
            {
                Caption = 'Big Al''s Company';
                ApplicationArea = All;
                RunObject = page "Bigal's Company List";

            }
        }

        addfirst("Business Events")
        {
            action(BigAlsCompany1)
            {
                Caption = 'Big Al''s Company1';
                ApplicationArea = All;
                RunObject = page "Bigal's Company List";

            }
        }

        addfirst(sections)
        {
            group(BigAlsCompany2Group)
            {
                Caption = 'Big Al''s Company Group';

                action(BigAlsCompany2)
                {
                    Caption = 'Big Al''s Company2';
                    ApplicationArea = All;
                    RunObject = page "Bigal's Company List";

                }
            }
        }
    }
}