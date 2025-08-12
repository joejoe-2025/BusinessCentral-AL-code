tableextension 51103 ItemCostPostingExt extends Item
{
    fields
    {
        field(50300; "Q Purch_UoM_PRICE"; Decimal)
        {
            Caption = 'Purchase Unit Price';
        }

        field(50301; "R Purch_UoM_DISC%"; Decimal)
        {
            Caption = 'Purchase Discount %';
        }

        field(50302; "S Purch_NET_PRICE_each"; Decimal)
        {
            Caption = 'Purch_NET_PRICE_each';
        }

        field(50303; "U FRT%"; Decimal)
        {
            Caption = 'Freight %';
            ToolTip = 'FRT%';
        }

        field(50304; "V Frt_Amt"; Decimal)
        {
            Caption = 'Freight Amount';
        }

        field(50305; "W DUTY%"; Decimal)
        {
            Caption = 'Duty %';
        }

        field(50306; "X Duty_Amt"; Decimal)
        {
            Caption = 'Duty Amount';
        }

        field(50307; "Y FINAL_COST_each"; Decimal)
        {
            Caption = 'Final Cost Each';
        }

        field(50308; "AE Magstar_LAST_Landed_Cost"; Decimal)
        {
            Caption = 'Magstar Last Landed Cost';
        }

        field(50309; "AF Magstar_Ref_Landed_Cost"; Decimal)
        {
            Caption = ' Magstar Ref Landed Cost';
        }

        field(50310; "Exchange price"; Decimal)
        {
            Caption = 'Exchange Price';
        }

        field(50311; "AG Calc_Landed_Cost_each"; Decimal)
        {
            Caption = 'Calc Landed Cost Each';
        }

        field(50312; "AH WAC"; Decimal)
        {
            Caption = 'WAC';
            ToolTip = 'Weighted Average Cost';
        }

        field(50313; "AI WAC_is"; Text[20])
        {
            Caption = 'WAC_is';
            ToolTip = 'WAC Compare Result';
        }

        // field(50314; "AX Duty%1"; Decimal)
        //{
        //     Caption = 'DUTY%1(Import)';
        // }

        // field(50315; "AY Duty_Amt1"; Decimal)
        // {
        //     Caption = 'Duty Amount1(Based on AV)';
        // }

        // field(50316; "BZ Tariff Code"; Code[50])
        // {
        //    Caption = 'Tariff Code';
        //}

        field(50317; "DB FRT%1"; Decimal)
        {
            Caption = 'Freight % 1';
        }

        //field(50318; "DC DUTY%2"; Decimal)
        //{
        //    Caption = 'DUTY%2(Export)';
        //}
    }
}
