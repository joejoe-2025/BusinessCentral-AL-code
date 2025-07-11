permissionset 50142 WebOrderPermissions
{
    Assignable = true;
    Caption = 'Permissions for Web Order Staging Table';

    Permissions =
        tabledata "Web Order Staging" = RIMD; // Read, Insert, Modify, Delete
}
