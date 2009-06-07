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

public partial class userInfo_QAModify : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Tools.FillDropDownList(ddlQuestion0,"sysQuestion","","请选择密码问题");
            Tools.FillDropDownList(ddlQuestion1, "sysQuestion", "", "请选择密码问题");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Query q = new Query(GUserInfo.Schema);
        q.AddWhere("questiontype", ddlQuestion0.SelectedValue);
        q.AddWhere("uid", Cookies.getCookies("cUID"));
        q.AddWhere("myKey", tbAnswer0.Text);
        if(q.GetRecordCount()>0)
        {
            if(tbAnswer1.Text==tbAnswer2.Text)
            {
                GUserInfo g= new GUserInfo("uId",Cookies.getCookies("cUID"));
                g.QuestionType = int.Parse(ddlQuestion1.SelectedValue);
                g.MyKey = tbAnswer1.Text;
            }
        }
    }
}
