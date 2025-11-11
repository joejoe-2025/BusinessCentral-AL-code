permissionset 80200 "X FieldType Perm"
{
    Assignable = true;
    Caption = 'X FieldType Test Permission';
    Permissions =
        tabledata "X FieldType Test" = RIMD,  // Read, Insert, Modify, Delete
        page "X FieldType Card" = X,
        page "X FieldType List" = X;
}
