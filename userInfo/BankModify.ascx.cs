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

public partial class userInfo_BankModify : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //if(Cookies.getCookies("cuid")!="0")
            //{
            //    int userID = int.Parse(Cookies.getCookies("cUID"));
            //    Query q = new Query(UserScrtInfo.Schema);
            //    q.AddWhere("userid", userID);
            //    q.AddWhere("isused", 1);
            //    IDataReader dr = q.ExecuteReader();
            //    if(q.GetRecordCount()>1)
            //    {
            //        dr.Read();
            //    }
            //}
            Tools.FillDropDownList(ddlQuestion,"sysQuestion","","请选择密保问题");
            Panel1.Visible = true;
            Panel2.Visible = false;
            
        }
    }
    protected void ddlProvice_SelectedIndexChanged(object sender, EventArgs e)
    {
        Tools.FillDropDownList(ddlCity, "sysCity", "", "请选择城市", "proviceID", ddlProvice.SelectedValue);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Query q = new Query(UserScrtInfo.Schema);
        if((tbAlipayID1.Text !="")&&( tbAlipayID1.Text==tbAlipayID2.Text))
        {
            q.AddUpdateSetting("alipayID", tbAlipayID1.Text);
        }
        if(tbAlipayName.Text !="")
        {
            q.AddUpdateSetting("alipayname", tbAlipayName.Text);
        }
        if((ddlProvice.SelectedValue!="0")&&(ddlCity.SelectedValue!="0"))
        {
            q.AddUpdateSetting("proviceID", ddlProvice.SelectedValue);
            q.AddUpdateSetting("cityID", ddlCity.SelectedValue);
        }
        if(tbBankManName.Text !="")
        {
            q.AddUpdateSetting("bankmanname", tbBankManName.Text);
        }
        if((ddlBankName.SelectedValue!="0")&&(tbBankCardID1.Text!="")&&(tbBankCardID1.Text==tbBankCardID2.Text))
        {
            q.AddUpdateSetting("bankName", ddlBankName.SelectedValue);
            q.AddUpdateSetting("bankcardid", tbBankCardID1.Text);
        }
        if(tbQQ.Text!="")
        {
            q.AddUpdateSetting("QQ", tbQQ.Text);
        }
        if(tbPhone.Text !="")
        {
            q.AddUpdateSetting("Phone", tbPhone.Text);
        }
        if(tbMobile.Text!="")
        {
            q.AddUpdateSetting("mobile", tbMobile.Text);
        }
        q.AddUpdateSetting("updatetime", DateTime.Now);
        q.AddWhere("userid", Cookies.getCookies("cUid"));
        q.Execute();

        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Query q=new Query(GUserInfo.Schema);
        q.AddWhere("questiontype", ddlQuestion.SelectedValue);
        q.AddWhere("myKey", tbAnswer.Text);
        q.AddWhere("uID", Cookies.getCookies("cUID"));
        if(q.GetRecordCount()>1)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;

            Tools.FillDropDownList(ddlProvice, "sysProvice", "", "请选择省份");
            Tools.FillDropDownList(ddlCity, "sysCity", "", "请选择城市", "proviceID", ddlProvice.SelectedValue);
            foreach (string s in Dictionary.BankName)
            {
                ListItem li = new ListItem(s);
                ddlBankName.Items.Add(li);
            }
  
        }

    }
}
