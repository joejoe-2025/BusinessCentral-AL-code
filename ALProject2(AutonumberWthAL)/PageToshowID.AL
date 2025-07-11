page 55555 "AutoNumber Customer Tracking"
{
    PageType = List;
    SourceTable = Customer;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                }

                field("AutoNumber Customer No."; Rec."AutoNumber Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Company Code"; Rec."Company Code")
                {
                    ApplicationArea = All;
                }


                field("Phone No."; rec."Phone No.")
                {
                    ApplicationArea = All;
                }

                field("E-Mail"; rec."E-Mail")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
