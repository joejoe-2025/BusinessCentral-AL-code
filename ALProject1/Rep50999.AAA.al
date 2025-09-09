report 50999 AAA
{
    Caption = 'AAA';
    dataset
    {
        dataitem(Customer; Customer)
        {
            column(BalanceDueLCY; "Balance Due (LCY)")
            {
            }
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(BankCommunication; "Bank Communication")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
