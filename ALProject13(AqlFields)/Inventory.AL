tableextension 53230 ItemInventoryExt extends Item
{
    fields
    {
        field(53330; "in 998"; Boolean)
        {
            Caption = 'in 998';
            DataClassification = ToBeClassified;

        }
    }
}
pageextension 53230 ItemInventoryExt extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            group("🟦 In 998")
            {
                Caption = '🟦  In 998';



                field("in 998"; Rec."in 998") { ApplicationArea = All; }

            }
        }
    }
}
