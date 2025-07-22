page 50280 "Bigal's Company List"
{
    Caption = 'Bigals Company List';
    PageType = List;
    SourceTable = BigalsCompany;
    ApplicationArea = All;
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company ID"; Rec."Company ID")
                {
                    ApplicationArea = All;
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }

                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
