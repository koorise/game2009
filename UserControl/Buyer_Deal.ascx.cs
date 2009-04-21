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
using SubSonic;
using GameDB;
public partial class UserControl_Buyer_Deal : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Tools.FillDropDownList(ddlGameID, "sysGame", "0", "请选择游戏");
            Tools.FillDropDownList(ddlDealStatus, "sysOrderType", "0", "不限制");
        }

    }
    protected void lbtnSearchMore_Click(object sender, EventArgs e)
    {
        if (Panel1.Visible)
        {
            Panel1.Visible = false;
            lbtnSearchMore.Text = "高级搜索选项";
        }
        else
        {
            Panel1.Visible = true;
            lbtnSearchMore.Text = "精简搜索选项";
        }

    }
    protected void ddlGameID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlServerID.Items.Clear();
        Tools.FillDropDownList(ddlServerID, "sysServer", "0", "请选择服务器", "GameID", ddlGameID.SelectedValue);
    }
}
