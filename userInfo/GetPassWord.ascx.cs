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

public partial class userInfo_GetPassWord : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string username = TextBox1.Text;
        string email = TextBox2.Text;
        string code = TextBox3.Text;
        if(code==Session["pwCode"].ToString())
        {
            Query q = new Query(GUserInfo.Schema);
            q.AddWhere(GUserInfo.UserNameColumn.ToString(), username);
            q.AddWhere(GUserInfo.UMailColumn.ToString(), email);
            if(q.GetRecordCount()>0)
            {
                IDataReader dr = q.ExecuteReader();
                if(dr.Read())
                {
                    Tools.SendMail(email, "", ""+dr["passwd"]);
                    Response.Redirect("~/getpasswddone.aspx?m="+email);
                }
            }
        }
    }
}
