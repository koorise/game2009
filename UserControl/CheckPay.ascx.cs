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

public partial class UserControl_CheckPay : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPage();
        }
    }

    /// <summary>
    /// 初始化页面内容的值
    /// </summary>
    protected void BindPage()
    {
        string uid = Cookies.getCookies("cUID");
        string ordernumber = Request["ordernum"];
        Query oq = GOrderInfo.Query().WHERE("OrderNumber", ordernumber).WHERE("uID",uid);
        Query pq = GProduct.Query().WHERE("pnkid", oq.SetSelectList("pnkid").ExecuteScalar());
        if (pq.GetRecordCount() > 0)
        {
            GameName1.Text = pq.SetSelectList("pTitle").ExecuteScalar().ToString();
            GameName1.NavigateUrl = "~/ProductDetails.aspx?pnkid=" + oq.SetSelectList("pnkid").ExecuteScalar().ToString();
            GameName1.Target = "_blank";
            GameType1.Text = ">>帐号交易";
            PayValue1.Text = string.Format("{0:C}",oq.GetMax("PriceNow"));
        }
        else
        {
            //某种原因产品缺失的提示
            Tools.Error("数据有误，操作已取消，请返回列表检查或联系客服人员解决");
        }
    }

    protected void CheckPayWizard_ActiveStepChanged(object sender, EventArgs e)
    {
        if (CheckPayWizard.ActiveStepIndex == 1)
        {
            //检查余额是否足够支付
            //否则跳过充值，进入密保校验页面
            GameName2.Text = GameName1.Text;
            GameName2.NavigateUrl = GameName1.NavigateUrl;
            GameName2.Target = "_blank";
            GameType2.Text = GameType1.Text;
            PayValue2.Text = PayValue1.Text;
            //如何获得当前的余额
            string uid = Cookies.getCookies("cUID");
            object idx = GAccountRecord.Query().WHERE("UserID", uid).GetMax("id");
            UserValue1.Text = string.Format("{0:C}", GAccountRecord.Query().SetSelectList("cPrice").WHERE("id", idx).ExecuteScalar());

            if (Convert.ToDouble(UserValue1.Text) > Convert.ToDouble(PayValue1.Text))
                CheckPayWizard.ActiveStepIndex = 2;
        }
        else if (CheckPayWizard.ActiveStepIndex == 2)
        {
            GameName3.Text = GameName1.Text;
            GameName3.NavigateUrl = GameName1.NavigateUrl;
            GameName3.Target = "_blank";
            GameType3.Text = GameType1.Text;
            PayValue3.Text = PayValue1.Text;
            UserValue2.Text = UserValue1.Text;
            Tools.FillDropDownList(dropQuestion, "SysQuestion", "0", "请选择问题...");
            link_forget.NavigateUrl = "#";
            link_mail.NavigateUrl = "#";
        }
        else if (CheckPayWizard.ActiveStepIndex == 3)
        {
            OrderNumber.Text = Request["ordernum"];
        }
    }

    protected void CheckPayWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 2)
        {
            //检查是否登录
            if (!Tools.ChkStatus())
                Tools.jsRedirect("~/Login.aspx");
            string uid = Cookies.getCookies("cUID"); ;
            if (!Tools.CheckQuestion(uid,dropQuestion.SelectedValue,txtAnswer.Text))
            {
                txtAlert.Text = "密保或答案输入错误";
                e.Cancel = true;
            }
            else
            {
                txtAlert.Text = PreparePay();
                if (txtAlert.Text != string.Empty)
                {
                    //Tools.Error(txtAlert.Text);
                    e.Cancel = true;
                }
                else
                {
                    //考虑修改为过程，保证数据操作无误
                    //***************************************************************************

                    // 如何提醒卖家发货？
                    // 还要修改哪些表？
                    //

                    decimal runningid = 1;  //流水号格式?
                    object pnkid = GOrderInfo.Query().WHERE("OrderNumber", Request["ordernum"]).SetSelectList("pnkid").ExecuteScalar();
                    string usersellsid = GProduct.Query().WHERE("pnkid", pnkid).SetSelectList("UserID").ExecuteScalar().ToString();
                    object moneytype = SysMoneyType.Query().WHERE("Type", "可用余额").SetSelectList("ID").ExecuteScalar();
                    object pricenow = GOrderInfo.Query().WHERE("OrderNumber", Request["ordernum"]).GetMax("PriceNow");
                    object buyprice = GAccountRecord.Query().WHERE("id", GAccountRecord.Query().WHERE("UserID", uid).GetMax("id")).SetSelectList("cPrice").ExecuteScalar();
                    object sellprice = GAccountRecord.Query().WHERE("id", GAccountRecord.Query().WHERE("UserID", usersellsid).GetMax("id")).SetSelectList("cPrice").ExecuteScalar();
                    // 提交买家帐户记录更新
                    GAccountRecord.Insert(runningid, int.Parse(uid), decimal.Parse(Request["ordernum"]), decimal.Parse(pnkid.ToString()), int.Parse(moneytype.ToString()), int.Parse(SysPriceType.FetchByParameter("PriceType", "支付")["ID"].ToString()), DateTime.Now, -Convert.ToDecimal(pricenow), Convert.ToDecimal(buyprice) - Convert.ToDecimal(pricenow),"买", 1,DateTime.Now);
                    // 提交卖家帐务记录更新
                    GAccountRecord.Insert(runningid, int.Parse(usersellsid), decimal.Parse(Request["ordernum"]), decimal.Parse(pnkid.ToString()), int.Parse(moneytype.ToString()), int.Parse(SysPriceType.FetchByParameter("PriceType", "售得")["ID"].ToString()), DateTime.Now, Convert.ToDecimal(pricenow), Convert.ToDecimal(buyprice) + Convert.ToDecimal(pricenow), "卖",  1, DateTime.Now);

                    // 提交订单的状态变化更新
                    Query q = GOrderInfo.Query().WHERE("OrderNumber", Request["ordernum"]);
                    q.AddUpdateSetting("OrderType", SysOrderType.Query().WHERE("OrderType=等待发货").SetSelectList("OrderTypeID").ExecuteScalar());  //状态改为 支付完毕
                    q.QueryType = QueryType.Update;
                    q.Execute();
                }
            }
        }
    }

    /// <summary>
    /// 检查物品及订单状态
    /// </summary>
    /// <returns>错误信息（空值表示没有错误）</returns>
    protected string PreparePay()
    {
        //检查订单状态，对于竞拍和一口价没有不同
        string uid = Cookies.getCookies("cUID");
        //状态标识
        object ordertypeid = SysOrderType.Query().WHERE("OrderType","等待付款").SetSelectList("OrderTypeID").ExecuteScalar();
        Query q = GOrderInfo.Query().WHERE("OrderNumber", Request["ordernum"]).WHERE("OrderType",ordertypeid);
        if (q.GetRecordCount() > 0)
        { 
            q = q.WHERE("uID",uid);
            if(q.GetRecordCount()> 0)
            {
                object priceneed = q.GetMax("PriceNow");
                object idx = GAccountRecord.Query().WHERE("UserID", uid).GetMax("id");
                object myprice = GAccountRecord.Query().SetSelectList("cPrice").WHERE("id", idx).ExecuteScalar();
                if (Convert.ToDouble(myprice) < Convert.ToDouble(priceneed))
                {
                    //错误提示的接口
                    return "您的帐户余额不足，无法支付";
                }
            }
            else
            {
                //错误提示的接口
                return "您不是竞拍获胜人，无法支付，请尝试重新登录";
            }
        }
        else
        {
            //错误提示的接口
            return "订单状态不匹配，无法支付，请查看商品最新信息";
        }

        return string.Empty;
    }

}
