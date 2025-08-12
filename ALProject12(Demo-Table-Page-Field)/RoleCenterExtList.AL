pageextension 50182 DemoAddToRC extends "Business Manager Role Center"
{
    actions
    {
        addlast(Embedding)
        {
            action(DemoFields)
            {
                Caption = 'Demo Field Types';
                ApplicationArea = All;
                RunObject = Page "Demo Field Types List";
            }
        }
    }
}
