permissionset 50333 "READ-PACKAGE"
{
    Assignable = true;

    Permissions =
        tabledata "Config. Package Table" = R,
        tabledata "Config. Package Record" = R,
        tabledata "Config. Package Data" = R,
        tabledata "Config. Package Field" = R,
        tabledata "Config. Package Error" = R,
        tabledata "Config. Package" = R,
        tabledata "Config. Package Filter" = R,
        codeunit "Config. XML Exchange" = X,
        page "Config. Package Card" = X,
        page "Config. Template List" = X,
        page "Config. Package Table FactBox" = X,
        page "Config. Package Fields" = X;



    ExcludedPermissionSets =
        "D365 BUS PREMIUM",
        "SUPER",
        "SECURITY";
}
