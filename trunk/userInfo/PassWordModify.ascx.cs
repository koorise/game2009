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
public partial class userInfo_PassWordModify : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Query q = new Query(GUserInfo.Schema);
        q.AddWhere("uID", Cookies.getCookies("cUid"));
        q.AddWhere("passWD", tbPassWord0.Text);
        if(q.GetRecordCount()>0)
        {
            GUserInfo g=new GUserInfo("uID",Cookies.getCookies("cUID"));
            g.PassWD = tbPassWord1.Text;
            g.Save();
        }
    }
}
