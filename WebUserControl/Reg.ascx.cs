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

public partial class WebUserControl_Reg : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lBTNCode_Click(object sender, EventArgs e)
    {

    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        if(Session["regCode"].ToString()==tbCode.Text)
        {
            Query q = new Query("gUserInfo");
            q.AddWhere("username", tbUserName.Text).OR("uMail",tbEmail1.Text);
            if(q.GetRecordCount()==0)
            {
                GUserInfo g = new GUserInfo();
                g.UserName = tbUserName.Text;
                g.PassWD = tbPassWD1.Text;
                g.QuestionType = int.Parse(ddlQuestion.SelectedValue);
                g.MyKey = tbAnswer1.Text;
                g.UMail = tbEmail1.Text;
                g.InIP = Request.UserHostAddress;
                g.IsBuyerScores = 0;
                g.IsBuyerPer = 1;
                g.IsSalerScores = 0;
                g.IsSalerPer = 1;
                g.IsBlock = 0;
                g.Save();
                Panel1.Visible = false;
                Panel2.Visible = true;
                lbUsername.Text = tbUserName.Text;
            }
            else
            {
                Literal1.Text = "<script language=javascript>alert('该用户名或E-mail地址已注册！');</script>";
            }
            

        }
        else
        {
            Literal1.Text = "<script language=javascript>alert('验证码错误！');</script>";
        }
    }
    protected void imgBTNChkUserName_Click(object sender, ImageClickEventArgs e)
    {
        Query q = new Query("gUserInfo");
        q.AddWhere("userName", tbUserName.Text);
        if(q.GetRecordCount()==0)
        {
            tbUserName.BackColor = System.Drawing.Color.GreenYellow;
        }
        else
        {
            tbUserName.BackColor = System.Drawing.Color.Maroon;
        }
    }
}
