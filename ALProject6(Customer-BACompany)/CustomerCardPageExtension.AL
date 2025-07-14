pageextension 50602 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(BACompany; Rec.BACompany)
            {
                ApplicationArea = All;
            }
            field(BAVIP; Rec.BAVIP)
            {
                ApplicationArea = All;
            }
            field(BATel; Rec.BATel)
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                    IsValid: Boolean;
                begin
                    IsValid := ValidateTelephone(Rec.BATel);
                    if not IsValid then
                        Error('Invalid telephone format.');
                end;
            }
            field(BAEmail; Rec.BAEmail)
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                    IsValid: Boolean;
                begin
                    IsValid := ValidateEmail(Rec.BAEmail);
                    if not IsValid then
                        Error('Invalid email format.');
                end;
            }


            field(BAJoined; Rec.BAJoined)
            {
                ApplicationArea = All;
            }


        }

        addlast(FactBoxes)
        {
            part(BALogoPart; "Customer BA Logo FactBox")
            {
                SubPageLink = "No." = FIELD("No.");
                ApplicationArea = All;
            }
        }
    }



    local procedure ValidateTelephone(Tel: Text): Boolean
    var
        i: Integer;
        ch: Char;
        AllowedChars: Text[20];
    begin
        if Tel = '' then
            exit(true);

        AllowedChars := '0123456789 +-()';

        for i := 1 to StrLen(Tel) do begin
            ch := Tel[i];
            if AllowedChars.IndexOf(ch) = 0 then
                exit(false);
        end;

        exit(true);
    end;

    local procedure ValidateEmail(Email: Text): Boolean
    var
        AtPos: Integer;
        DotPos: Integer;
    begin
        if Email = '' then
            exit(true);

        AtPos := Email.IndexOf('@');
        DotPos := Email.LastIndexOf('.');

        if (AtPos <= 0) or (DotPos <= AtPos + 1) or (DotPos = StrLen(Email)) then
            exit(false);

        exit(true);
    end;
}