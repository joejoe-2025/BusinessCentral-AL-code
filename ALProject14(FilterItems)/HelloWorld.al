
table 55210 "Item Filter Buffer"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "CategoryFilter"; Code[20]) { }
        field(2; "UOMFilter"; Code[10]) { }
    }

    keys
    {
        key(PK; "CategoryFilter") { Clustered = true; }
    }
}


page 55200 "Item Filters FactBox"
{
    PageType = CardPart;
    SourceTable = "Item Filter Buffer";   // 临时表
    SourceTableTemporary = true;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group("Filter Options")
            {
                field("CategoryFilter"; Rec."CategoryFilter")
                {
                    Caption = 'Item Category';
                    TableRelation = "Item Category".Code;
                    Editable = true;
                    Lookup = true;

                    trigger OnValidate()
                    begin
                        OnApplyFilters(Rec."CategoryFilter", Rec."UOMFilter");
                    end;
                }

                field("UOMFilter"; Rec."UOMFilter")
                {
                    Caption = 'Base UOM';
                    TableRelation = "Unit of Measure".Code;
                    Editable = true;
                    Lookup = true;

                    trigger OnValidate()
                    begin
                        OnApplyFilters(Rec."CategoryFilter", Rec."UOMFilter");
                    end;
                }
            }
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnApplyFilters(CategoryFilter: Code[20]; UOMFilter: Code[10])
    begin
    end;
}
pageextension 55201 ItemListWithFilters extends "Item List"
{
    layout
    {
        addlast(FactBoxes)
        {
            part(ItemFilters; "Item Filters FactBox")
            {
                ApplicationArea = All;
                Caption = 'Filters';
            }
        }
    }
}
codeunit 55220 "Item Filter Subscriber"
{
    [EventSubscriber(ObjectType::Page, Page::"Item Filters FactBox", 'OnApplyFilters', '', false, false)]
    local procedure HandleApplyFilters(CategoryFilter: Code[20]; UOMFilter: Code[10])
    var
        Item: Record Item;
        ItemList: Page "Item List";
    begin
        // 关键点：订阅时操作 Rec，而不是 FactBox 里的变量
        if CategoryFilter <> '' then
            Item.SetFilter("Item Category Code", CategoryFilter);

        if UOMFilter <> '' then
            Item.SetFilter("Base Unit of Measure", UOMFilter);

        // 打开 Item List 并显示过滤结果
        PAGE.Run(PAGE::"Item List", Item);
    end;
}
