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

public partial class WebUserControl_CheckPay : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnApply.Attributes.Add("onclick", "javascript:return btnAccept();");
            btnCancel.Attributes.Add("onclick", "javascript:btnRefuse();");
            BindPage();
        }
    }

    protected void BindPage()
    {
        string pid = Request["PID"];
        Query q = new Query("gProducts").WHERE("PID", pid);
        if (q.GetRecordCount() > 0)
        {
            IDataReader dr = q.ExecuteReader();
            GameName1.Text = q.ExecuteReader()["pTitle"].ToString();
            GameName1.NavigateUrl = ""; //未确认
            GameName1.Target = "_blank";
            GameType1.Text = SysSaleType.Query().WHERE("SaleTypeID", dr["SaleTypeID"].ToString()).ExecuteReader()["SaleType"].ToString();
            PayValue1.Text = q.ExecuteReader()["pPriceStep"].ToString();

            GameName2.Text = q.ExecuteReader()["pTitle"].ToString();
            GameName2.NavigateUrl = ""; //未确认
            GameName2.Target = "_blank";
            GameType2.Text = SysSaleType.Query().WHERE("SaleTypeID", dr["SaleTypeID"].ToString()).ExecuteReader()["SaleType"].ToString();
            PayValue2.Text = q.ExecuteReader()["pPriceStep"].ToString();
            UserValue.Text = GUserInfo.Query().WHERE("UserID", dr["GameID"].ToString()).ExecuteReader()["AccountPrice"].ToString();
            dropQuestion.DataSource = SysQuestion.Query().DISTINCT().ExecuteReader();
            dropQuestion.DataTextField = "Question";
            dropQuestion.DataValueField = "qID";
        }
        else
        {
            //某种原因产品缺失的提示
        }
    }

    protected void CheckPayWizard_ActiveStepChanged(object sender, EventArgs e)
    {
        if (CheckPayWizard.ActiveStepIndex == 0)
        {
            string a = "";
        }
        else if (CheckPayWizard.ActiveStepIndex == 1)
        {
            string a = "";
        }
        else
        {
            string a = "";
        }
    }
    protected void CheckPayWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 0)
        {
            string a = "";
        }
        else if (e.CurrentStepIndex == 1)
        {
            string a = txtQQ.Text;
        }
        else
        {
            string a = "";
        }
    }
}
