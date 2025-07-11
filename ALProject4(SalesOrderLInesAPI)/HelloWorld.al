page 50161 "MySalesOrderLineAPI"
{
    PageType = API;
    SourceTable = "Sales Line";
    DelayedInsert = true;

    APIPublisher = 'my';
    APIGroup = 'sales';
    APIVersion = 'v1.0';
    EntityName = 'salesOrderLine';
    EntitySetName = 'salesOrderLines';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("SystemId"; Rec.SystemId)
                {
                    Caption = 'System Id';
                    ApplicationArea = All;
                }
                field("DocumentType"; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ApplicationArea = all;
                }
                field("DocumentNo"; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ApplicationArea = all;
                }
                field("LineNo"; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ApplicationArea = all;
                }
                field("Type"; Rec."Type")
                {
                    Caption = 'Type';
                    ApplicationArea = all;
                }
                field("ItemNo"; Rec."No.")
                {
                    Caption = 'Item No.';
                    ApplicationArea = all;
                }
                field("Quantity"; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ApplicationArea = all;
                }
                field("UnitPrice"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ApplicationArea = all;
                }
            }
        }
    }
}
