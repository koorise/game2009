using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using AjaxControlToolkit;

public partial class BianJieTuiGuang_List : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        foreach (ReorderListItem ri in ReorderList1.Items)
        {
            CheckBox ck = (CheckBox) ri.FindControl("CheckBox3");
            ck.Checked = true;
        }
    }
    protected void ReorderList1_ItemReorder(object sender, ReorderListItemReorderEventArgs e)
    {

    }
}
