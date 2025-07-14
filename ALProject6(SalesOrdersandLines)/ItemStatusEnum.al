enum 50625 ItemStatusEnum
{
    Extensible = true;
    Caption = 'Item Status';

    value(0; NotSpecified) { Caption = '[Blank]'; }   // ← Shows visually blank option
    value(1; Pending) { Caption = 'Pending'; }
    value(2; Received) { Caption = 'Received'; }
    value(3; Picked) { Caption = 'Picked'; }
    value(4; Shipped) { Caption = 'Shipped'; }
    value(5; Cancelled) { Caption = 'Cancelled'; }
}
