tableextension 54150 Location_Ext_Rc extends Location
{
    fields
    {
        field(53100; "Responsibility Center Code"; Code[10])
        {
            Caption = 'Responsibility Center Code';
            TableRelation = "Responsibility Center".Code;

            // 其实有 TableRelation 就够了，下面校验可要可不要
            trigger OnValidate()
            var
                RC: Record "Responsibility Center";
            begin
                if Rec."Responsibility Center Code" <> '' then
                    if not RC.Get(Rec."Responsibility Center Code") then
                        Error('Responsibility Center %1 does not exist.',
                              Rec."Responsibility Center Code");
            end;
        }
    }
}
pageextension 54151 LocationCard_Ext_Rc extends "Location Card"
{
    layout
    {
        // 一般卡片页有一个名为 General 的 FastTab
        addlast(General)
        {
            field("Responsibility Center Code"; Rec."Responsibility Center Code")
            {
                ApplicationArea = All;
                ToolTip = 'Select the Responsibility Center that owns this Location.';
            }
        }
    }
}
