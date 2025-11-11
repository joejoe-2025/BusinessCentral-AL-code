tableextension 53120 ItemCostPostingExt extends Item
{
    fields
    {
        // 🟦 采购/净价
        field(53260; "Purch NET PRICE"; Decimal)
        {
            Caption = 'Purch NET PRICE';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }

        // 🟢 Import 成本
        field(53261; "Import FRT%"; Decimal)
        {
            Caption = 'Import FRT%';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;

        }


        field(53262; "Import DUTY%"; Decimal)
        {
            Caption = 'Import DUTY%';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }

        // 🟠 最终成本
        field(53263; "FINAL COST each in Vendor's CURR"; Decimal)
        {
            Caption = 'FINAL COST each in Vendor''s CURR';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }
        field(53264; "Landed COST each CAD"; Decimal)
        {
            Caption = 'Landed COST each CAD';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }

        // 🟣 Promo 成本
        field(53215; "PROMO COST each"; Decimal)
        {
            Caption = 'PROMO COST each';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }
        field(53216; "Calc PROMO Landed Cost each"; Decimal)
        {
            Caption = 'Calc PROMO Landed Cost each';
            DecimalPlaces = 0 : 2;
            DataClassification = ToBeClassified;
        }

        // 🔵 Export 成本
        field(53217; "Export Frt%"; Decimal)
        {
            Caption = 'Export Frt%';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }
        field(53218; "Export Duty%"; Decimal)
        {
            Caption = 'Export Duty%';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }


        // 🟫 税务
        field(53221; "PST?"; Option)
        {
            Caption = 'PST?';
            OptionMembers = " ",Y,N;
            DataClassification = ToBeClassified;
        }

        field(53222; "Import Tariff Code"; Code[20])
        {
            Caption = 'Import Tariff Code';
            TableRelation = "Tariff Number"."No."; // ✅ 正确：表名 + 字段名
            DataClassification = ToBeClassified;
        }
        field(53223; "Export Tariff Code"; Code[20])
        {
            Caption = 'Export Tariff Code';
            TableRelation = "Tariff Number"."No."; // ✅ 正确：表名 + 字段名
            DataClassification = ToBeClassified;
        }
        field(53224; "CurrencyCode"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency.Code;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                UpdateCurrencyRate();
            end;
        }

        field(53225; "CurrencyRate"; Decimal)
        {
            Caption = 'Currency Rate';
            DecimalPlaces = 0 : 5;
            DataClassification = ToBeClassified;
        }




    }
    local procedure UpdateCurrencyRate()
    var
        CurrExchRate: Record "Currency Exchange Rate";
    begin
        if Rec.CurrencyCode = '' then begin
            Rec.CurrencyRate := 0;
            exit;
        end;

        CurrExchRate.SetRange("Currency Code", Rec.CurrencyCode);
        CurrExchRate.SetFilter("Starting Date", '..%1', WorkDate());

        if CurrExchRate.FindLast() then
            Rec.CurrencyRate := CurrExchRate."Relational Exch. Rate Amount"
        else
            Rec.CurrencyRate := 0;
    end;
}
pageextension 53120 ItemCardCostPostingExt extends "Item Card"
{
    layout
    {
        addlast("Costs & Posting")
        {
            group("🟦 Custom Cost & Posting")
            {
                Caption = '🟦 Custom Cost & Posting';


                // 🟢 采购/进口
                group("🟢 Import Costs")
                {
                    Caption = '🟢 Import Costs';
                    field("Import Tariff Code"; Rec."Import Tariff Code") { ApplicationArea = All; }

                    field("Purch NET PRICE"; Rec."Purch NET PRICE") { ApplicationArea = All; }
                    field("Import FRT%"; Rec."Import FRT%") { ApplicationArea = All; }
                    field("Import DUTY%"; Rec."Import DUTY%") { ApplicationArea = All; }
                }

                // 🟠 最终成本
                group("🟠 Final & Landed Costs")
                {
                    Caption = '🟠 Final & Landed Costs';
                    field("FINAL COST each in Vendor's CURR"; Rec."FINAL COST each in Vendor's CURR") { ApplicationArea = All; }
                    field("Landed COST each CAD"; Rec."Landed COST each CAD") { ApplicationArea = All; }
                }

                // 🟣 Promo 成本
                group("🟣 Promo Costs")
                {
                    Caption = '🟣 Promo Costs';
                    field("PROMO COST each"; Rec."PROMO COST each") { ApplicationArea = All; }
                    field("Calc PROMO Landed Cost each"; Rec."Calc PROMO Landed Cost each") { ApplicationArea = All; }
                }

                // 🔵 Export 成本
                group("🔵 Export Costs")
                {
                    Caption = '🔵 Export Costs';
                    field("Export Tariff Code"; Rec."Export Tariff Code") { ApplicationArea = All; }
                    field("Export Frt%"; Rec."Export Frt%") { ApplicationArea = All; }
                    field("Export Duty%"; Rec."Export Duty%") { ApplicationArea = All; }
                }


                // 🟫 税务
                group("🟫 Tax Flags")
                {
                    Caption = '🟫 Tax Flags';
                    field("PST?"; Rec."PST?") { ApplicationArea = All; }
                }

                group("🔵 Currency Rate")
                {
                    Caption = '🔵 Currency Rate';
                    field(CurrencyCode; Rec.CurrencyCode) { ApplicationArea = All; }
                    field(CurrencyRate; Rec.CurrencyRate) { ApplicationArea = All; }
                }
            }
        }
    }

}

