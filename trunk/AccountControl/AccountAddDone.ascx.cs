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
using GameDB;
using SubSonic;

public partial class AccountControl_AccountAddDone : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Tools.ChkStatus())
        {
           Response.Redirect("~/Login.aspx"); 
        }
        if(!IsPostBack)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
        }
        HyperLink1.Text = Request["PNKID"];
    }
    protected void btnSub1_Click(object sender, EventArgs e)
    {
        Query q =new Query(GProduct.Schema);
        q.AddUpdateSetting("qq",tbQQ.Text)
            .AddUpdateSetting("Phone",tbPhone.Text)
            .AddWhere("PNKID",Request["PNKID"])
            .AddWhere("UserID",Cookies.getCookies("cUID"))
            .Execute();
        Panel1.Visible = false;
        Panel2.Visible = true;
        Panel3.Visible = false;
    }
}
