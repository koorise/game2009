﻿using System;
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
public partial class WebUserControl_Login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["LoginCode"].ToString() == tbCode.Text)
        {
            
            Query q = new Query("gUserInfo");
            q.AddWhere("userName", tbUserName.Text);
            q.AddWhere("passWD", tbPassWD.Text);
            if(q.GetRecordCount()>0)
            {
                IDataReader dr = q.ExecuteReader();
                dr.Read();
                int exp = 0;
                if(chkExp.Checked)
                {
                    exp = 365;
                }
                Cookies.addCookies("cuID", dr["uID"].ToString(), exp);
                Cookies.addCookies("cUserName",dr["username"].ToString(),exp);
                Cookies.addCookies("cisBlock",dr["isblock"].ToString(),exp);
                Cookies.addCookies("cMD5",
                                   Cookies.md5(HttpUtility.UrlEncode(dr["uID"].ToString()) +
                                               HttpUtility.UrlEncode(dr["username"].ToString()) +
                                               HttpUtility.UrlEncode(dr["isblock"].ToString()) +
                                               Request.UserHostAddress +
                                               Cookies.CookiesKey), exp);
                Response.Redirect("~/Mine/Main.aspx");
            }
            else
            {
                tbCode.Text = "";
                lblErr.Text = "用户名或密码错误.";
            }
        }
        else
        {
            tbCode.Text = "";
            lblErr.Text = "验证码错误.";
        }
    }
    protected void lBTNCode_Click(object sender, EventArgs e)
    {
        //Image1.ImageUrl = "~/CheckCode.aspx?t=" + DateTime.Now.Millisecond;
    }
}
