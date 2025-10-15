pageextension 54100 ConfigPackageTableExt extends "Config. Package Subform"
{
    layout
    {
        modify("Delete Recs Before Processing")
        {
            // 方法一：完全隐藏
            Visible = false;

            // 方法二：仅管理员可见，可改为 Visible = UserIsSuper();
        }
    }
}
