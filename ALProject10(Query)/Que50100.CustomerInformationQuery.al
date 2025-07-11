query 50140 CustomerInformationQuery
{
    Caption = 'CustomerInformationQuery';
    QueryType = Normal;
    QueryCategory = 'Customer Lists';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {
            }
            column(MobilePhoneNo; "Mobile Phone No.")
            {
            }
            column(Address; Address)
            {
            }
            column(Balance; Balance)
            {
            }
            column(BalanceDueLCY; "Balance Due (LCY)")
            {
            }
            column(FormatRegion; "Format Region")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
