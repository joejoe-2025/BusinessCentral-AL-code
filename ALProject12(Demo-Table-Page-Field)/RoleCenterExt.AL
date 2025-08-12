pageextension 50188 AddToRoleCenter extends "Security Admin Role Center"
{
    actions
    {
        addlast(Navigation)
        {
            action(DemoFieldCard)
            {
                Caption = 'Demo Fields';
                RunObject = Page "Demo Field Types Card";
                ApplicationArea = All;
            }
        }
    }
}
