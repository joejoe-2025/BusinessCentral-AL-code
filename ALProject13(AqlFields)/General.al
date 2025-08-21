tableextension 53100 ItemGeneralExt extends Item
{
    fields
    {
        // 🔵 描述与派生
        field(53190; "Desc Length"; Integer)
        {
            Caption = 'Desc Length';
            DataClassification = ToBeClassified;
        }
        field(53191; "First 30 chars."; Text[30])
        {
            Caption = 'First 30 chars.';
            DataClassification = ToBeClassified;
        }
        field(53192; "Next 10 chars."; Text[10])
        {
            Caption = 'Next 10 chars.';
            DataClassification = ToBeClassified;
        }

        // 🟢 标识 & 编码
        field(53193; "UPC1"; Code[30])
        {
            Caption = 'UPC';
            DataClassification = ToBeClassified;
        }
        field(53194; "CAT"; Code[20])
        {
            Caption = 'CAT';
            DataClassification = ToBeClassified;
        }
        field(53195; "SUB CAT"; Code[20])
        {
            Caption = 'SUB CAT';
            DataClassification = ToBeClassified;
        }
        field(53196; "UNIQUE ID"; Code[50])
        {
            Caption = 'Unique ID';
            DataClassification = ToBeClassified;
        }
        field(53197; "SIZE CODE"; Code[20])
        {
            Caption = 'Size Code';
            DataClassification = ToBeClassified;
        }

        // 🟣 生命周期 & 状态
        field(53198; "DATE ADDED"; Date)
        {
            Caption = 'Date Added';
            DataClassification = ToBeClassified;
        }
        field(53199; "Item Status"; Option)
        {
            Caption = 'Item Status';
            OptionMembers = Active,Inactive,Blocked;
            DataClassification = ToBeClassified;
        }
        field(53200; "Store Order Block"; Boolean)
        {
            Caption = 'Store Order Block';
            DataClassification = ToBeClassified;
        }

        // 🟡 销售/业务标识
        field(53201; "Sell Fractions"; Boolean)
        {
            Caption = 'Sell Fractions';
            DataClassification = ToBeClassified;
        }
        field(53202; "Add to US (4444)"; Boolean)
        {
            Caption = 'Add to US (4444)';
            DataClassification = ToBeClassified;
        }
        field(53203; "Add to PetSave"; Option)
        {
            Caption = 'Add to PetSave';
            OptionMembers = " ",Y,N,H;
            DataClassification = ToBeClassified;
        }
        field(53204; " NEW Item sheet required"; Boolean)
        {
            Caption = ' NEW Item sheet required';

            DataClassification = ToBeClassified;
        }

    }
}


pageextension 53100 ItemCardGeneralExt extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            group("🟦 General Content (Custom)")
            {
                Caption = '🟦 General Content (Custom)';


                // 🔵 描述与派生
                group("🔵 Description & Derived")
                {
                    Caption = '🔵 Description & Derived';
                    field("Desc Length"; Rec."Desc Length") { ApplicationArea = All; }
                    field("First 30 chars."; Rec."First 30 chars.") { ApplicationArea = All; }
                    field("Next 10 chars."; Rec."Next 10 chars.") { ApplicationArea = All; }
                }

                // 🟢 标识 & 编码
                group("🟢 Identifiers & Codes")
                {
                    Caption = '🟢 Identifiers & Codes';
                    field("UPC"; Rec."UPC1") { ApplicationArea = All; }
                    field("CAT"; Rec."CAT") { ApplicationArea = All; }
                    field("SUB CAT"; Rec."SUB CAT") { ApplicationArea = All; }
                    field("UNIQUE ID"; Rec."UNIQUE ID") { ApplicationArea = All; }
                    field("SIZE CODE"; Rec."SIZE CODE") { ApplicationArea = All; }
                }

                // 🟣 生命周期 & 状态
                group("🟣 Lifecycle & Status")
                {
                    Caption = '🟣 Lifecycle & Status';
                    field("DATE ADDED"; Rec."DATE ADDED") { ApplicationArea = All; }
                    field("Item Status"; Rec."Item Status") { ApplicationArea = All; }
                    field("Store Order Block"; Rec."Store Order Block") { ApplicationArea = All; }
                }

                // 🟡 销售/业务标识
                group("🟡 Sales Flags")
                {
                    Caption = '🟡 Sales Flags';
                    field("Sell Fractions"; Rec."Sell Fractions") { ApplicationArea = All; }
                    field("Add to US (4444)"; Rec."Add to US (4444)") { ApplicationArea = All; }
                    field("Add to PetSave"; Rec."Add to PetSave") { ApplicationArea = All; }
                    field(" NEW Item sheet required"; Rec." NEW Item sheet required") { ApplicationArea = All; }
                }
            }
        }
    }
}
