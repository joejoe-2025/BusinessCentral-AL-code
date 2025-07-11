tableextension 55050 MyExtension extends Customer
{
    fields
    {
        field(50222; "Level"; Option) 
        {
            OptionMembers = Low, High, Medium, Sky;
            DataClassification = CustomerContent;
            Caption = 'Level';
            InitValue = Medium; 
        
        } 

        field(59999;"Hometown";Option)
        {
            OptionMembers= Hongkon, Beijin, Toronto;
            DataClassification = CustomerContent;
            Caption = 'Hometown';
            InitValue = Toronto; 

        }    

        field(60001;"Age";Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Age';
        }  

        field(60002;"Birth Date";Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Birth Date';
        }  

        field(60003;"Marriged or Not";Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Marriged or Not';
        }  

    }

}

    
    
