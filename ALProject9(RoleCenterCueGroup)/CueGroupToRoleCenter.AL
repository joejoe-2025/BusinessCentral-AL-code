//Extend the Cue Group Page into the role centre page

pageextension 50215 "CardPart" extends "Security Admin Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {
            part(Cuetest; "Big Al's Cue Group Page")
            {
                ApplicationArea = All;
            }
        }
    }
}