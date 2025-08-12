//except Id
tableextension 51101 ItemExt extends Item
{
    fields
    {


        field(51101; "F Desc_Length"; Integer)
        {
            Caption = 'Description Length';
        }

        field(51102; "G First 30 chars"; Text[30])
        {
            Caption = 'First 30 Characters';
        }

        field(51103; "H Next 10 chars"; Text[10])
        {
            Caption = 'Next 10 Characters';
        }

        field(51104; "I UPC"; Code[50])
        {
            Caption = 'UPC Code';
        }

        field(51105; "J ASWO#"; Code[50])
        {
            Caption = 'ASWO#';
        }

        field(51106; "K Item_Status"; Option)
        {
            Caption = 'Item Status';
            OptionMembers = Unspecified,Active,Inactive;
        }

        field(51107; "L Sell_UoM"; Code[10])
        {
            Caption = 'Sell Unit of Measure';
            TableRelation = "Unit of Measure";
        }

        field(51108; "M Xfer_UoM"; Code[10])
        {
            Caption = 'Transfer UoM';
            TableRelation = "Unit of Measure";
        }

        field(51109; "N Xfer_UNITS"; Integer)
        {
            Caption = 'Transfer Units';
        }

        field(51110; "BW Web_Item"; Code[2])
        {
            Caption = 'Web Item Flag';
        }

        field(51111; "BX Item#"; Code[50])
        {
            Caption = 'Alternate Item Number';
        }

        field(51112; "CV FINAL Prod ID"; Code[50])
        {
            Caption = 'Final Product ID';
        }

        field(51113; "DF Current PetSave Web flag"; Code[2])
        {
            Caption = 'Current PetSave Web Flag';
        }

        field(51114; "DG PetSave Website Y/N"; Text[20])
        {
            Caption = 'Buyer: Show on PetSave Web';
        }

        field(51115; "DH Set PetSave Web Flag"; Text[20])
        {
            Caption = 'IS: Set PetSave Web Flag';
        }

        field(51116; "DK Admin Cells Chgd"; Code[1])
        {
            Caption = 'Admin Cells Changed';
        }


    }
}
