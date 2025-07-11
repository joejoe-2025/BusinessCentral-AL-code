query 50115 QueryCustomerSales
{
    Caption = 'Query Customer Sales';
    QueryType = Normal;
    OrderBy = descending(Quantity);
    QueryCategory = 'Customer List';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.") { }
            column(CustomerName; Name) { }

            dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                column(Quantity; Quantity)
                {
                    Method = Sum;


                }

            }


        }
    }
}
