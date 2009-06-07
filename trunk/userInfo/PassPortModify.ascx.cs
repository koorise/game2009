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
public partial class userInfo_PassPortModify : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LitNumber.Text = Tools.CreateNum().ToString();
            Literal1.Text = Tools.ApplicationTitle(int.Parse(Request["aTitle"]));
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        UserPassportApplication up= new UserPassportApplication();
        up.Nid = Tools.CreateNum();
        up.UserID = int.Parse(Cookies.getCookies("cUID"));
        
        up.RealName = tbRealName.Text;
        up.TelPhone = tbTEL.Text;
        up.TypeID = int.Parse(Request["aTitle"]);
        up.ApplicationType = Literal1.Text;
        up.Qq = tbQQ.Text;
        up.EMail = tbEmail.Text;
        up.Mobile = tbMobile.Text;
        up.QQOld = tbQQOld.Text;
        up.Phone = tbPhone.Text;
        up.BankName = tbBankName.Text;
        up.BankID = tbBankID.Text;
        up.AliPayID = tbAlipayID.Text;
        up.AliPayName = tbAlipayName.Text;
        up.Reason = tbReason.Text;
        up.StatusID = 0;//处理中
        up.Results = 0;//未处理
        up.InTime = DateTime.Now;
        up.OKTime = null;
        up.Save();
    }
}
