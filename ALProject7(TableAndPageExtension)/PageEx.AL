pageextension 50702 PageExtension5 extends Microsoft.Sales.Customer."Customer Card"
{
    layout
    {
        addafter(City)
        {
            field(Level; Rec.Level)
            {
                ApplicationArea = All;
                Editable = true;
            }
        }

        addafter(Level)
        {
            field(Hometown; Rec.Hometown)
            {
                ApplicationArea = All;
                Editable = true;
            }

            field(Age; Rec.Age)
            {
                ApplicationArea = All;
                Editable = true;
            }

            field("Birth Date"; Rec."Birth Date")
            {
                ApplicationArea = All;
                Editable = true;
            }

            field("Marriged or Not"; Rec."Marriged or Not")
            {
                ApplicationArea = All;
                Editable = true;
            }



        }


    }
}
