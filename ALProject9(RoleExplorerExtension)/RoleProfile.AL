profile BigAlsStaff
{
    Caption = 'Big Al''s Staff';
    RoleCenter = " My RoleCenter";
    Promoted = true;
    Enabled = true;

}

page 50283 " My RoleCenter"
{
    PageType = RoleCenter;
    actions
    {
        area(Embedding)
        {
            action(BIGALs)
            {
                Caption = 'Big Als Company';
                ApplicationArea = All;
                RunObject = page "Bigal's Company List";


            }
        }
    }

}
