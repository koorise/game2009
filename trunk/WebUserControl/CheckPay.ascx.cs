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
            BindPage();
        }
    }

    /// <summary>
    /// 初始化页面内容的值
    /// </summary>
    protected void BindPage()
    {
        string pid = Request["PID"];
        Query q = GProduct.Query().WHERE("PID", pid);
        if (q.GetRecordCount() > 0)
        {
            IDataReader dr = q.ExecuteReader();
            GameName1.Text = dr["pTitle"].ToString();
            GameName1.NavigateUrl = ""; //未确认
            GameName1.Target = "_blank";
            GameType1.Text = ">>"+SysSaleType.Query().WHERE("SaleTypeID", dr["SaleTypeID"].ToString()).ExecuteReader()["SaleType"].ToString();
            PayValue1.Text = GOrderInfo.Query().WHERE("PID",pid).ExecuteReader()["cPrice"].ToString();  //convert?

            GameName2.Text = GameName1.Text;
            GameName2.NavigateUrl = GameName1.NavigateUrl;
            GameName2.Target = "_blank";
            GameType2.Text = GameType1.Text;
            PayValue2.Text = PayValue1.Text;
            string uname = Cookies.getCookies("test");  //获得当前用户，未确认
            string uid = GUserInfo.Query().WHERE("UserName",uname).ExecuteReader()["uID"].ToString();
            UserValue1.Text = GAccountRecord.Query().WHERE("UserID",uid).ExecuteReader()["cPrice"].ToString();  //convert?  //最终余额？

            GameName3.Text = GameName1.Text;
            GameName3.NavigateUrl = GameName1.NavigateUrl;
            GameName3.Target = "_blank";
            GameType3.Text = GameType1.Text;
            PayValue3.Text = PayValue1.Text;
            UserValue2.Text = UserValue1.Text;
            dropQuestion.DataSource = SysQuestion.Query().DISTINCT().ExecuteReader();
            dropQuestion.DataTextField = "Question";
            dropQuestion.DataValueField = "qID";

            OrderNumber.Text = GOrderInfo.Query().WHERE("PID", pid).ExecuteReader()["OrderNumber"].ToString();
        }
        else
        {
            //某种原因产品缺失的提示
        }
    }

    protected void CheckPayWizard_ActiveStepChanged(object sender, EventArgs e)
    {
        if (CheckPayWizard.ActiveStepIndex == 1)
        {
            //检查余额是否足够支付
            //否则跳过充值，进入密保校验页面
            if (Convert.ToDouble(UserValue1.Text) > Convert.ToDouble(PayValue1.Text))
                CheckPayWizard.ActiveStepIndex = 2;
        }
    }

    protected void CheckPayWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 2)
        {
            string pid = Request["PID"];
            //检查是否登录
            //
            //if(未登录）
            //Response.Redirect("login.aspx", true);
            //else{
            string uname = Cookies.getCookies("test");  //获得当前用户，未确认
            string uid = GUserInfo.Query().WHERE("UserName", uname).ExecuteReader()["uID"].ToString();
            if (!CheckQuestion(uid))
            {
                txtAlert.Text = "密保或答案输入错误";
                e.Cancel = true;
            }
            else
            {
                txtAlert.Text = PreparePay(pid);
                if (txtAlert.Text != string.Empty)
                    e.Cancel = true;
                else
                {
                    //考虑修改为过程，保证数据操作无误
                    //***************************************************************************

                    // 提交物品的状态变化更新
                    Query q = GProduct.Query().WHERE("PID", pid);
                    q.AddUpdateSetting("StatusID", 1);  //状态改为 支付完毕
                    q.QueryType = QueryType.Update;
                    q.Execute();

                    // 提交买家帐户记录更新
                    // 语句需要检查修改**************************************************************
                    GAccountRecord.Insert(int.Parse(uid), int.Parse(SysPriceType.FetchByParameter("PriceType", "支付")["ID"].ToString()), DateTime.Now, uid, uid, Convert.ToDecimal(GOrderInfo.Query().WHERE("PID", pid).ExecuteReader()["cPrice"]), 0, txtQQ.Text, txtTele.Text);

                    // 提交卖家帐务记录更新
                    // 语句需要检查修改
                    GAccountRecord.Insert(int.Parse(uid), int.Parse(SysPriceType.FetchByParameter("PriceType", "收款")["ID"].ToString()), DateTime.Now, uid, uid, Convert.ToDecimal(GOrderInfo.Query().WHERE("PID", pid).ExecuteReader()["cPrice"]), 0, txtQQ.Text, txtTele.Text);
                }
            }
        }
    }

    /// <summary>
    /// 检查用户密保及答案是否匹配
    /// </summary>
    /// <param name="uid">用户id</param>
    /// <returns>检查结果</returns>
    protected bool CheckQuestion(string uid)
    {
        Query q = GUserInfo.Query().WHERE("UserID", uid);
        IDataReader dr = q.ExecuteReader();
        string utype = dr["QuestionType"].ToString();
        string ukey = dr["MyKey"].ToString();
        if (utype != dropQuestion.SelectedValue)
            return false;
        if (ukey != txtAnswer.Text)
            return false;
        return true;
    }

    /// <summary>
    /// 检查物品及订单状态
    /// </summary>
    /// <param name="pid">物品号</param>
    /// <returns>错误信息（空值表示没有错误）</returns>
    protected string PreparePay(string pid)
    {
        //检查订单状态，对于竞拍和一口价有不同
        Query q = GProduct.Query().WHERE("PID", pid);
        IDataReader dr = q.ExecuteReader();
        //竞拍
        if (dr["pPriceFixed"].ToString() == "0")
        {
            //等待付款 状态
            if (dr["StatusID"].ToString() != "1")
            {
                //错误提示的接口
                return "订单状态已经改变，无法支付，请点击商品标题查看详情";
            }
            else
            {
                //验证是否自己是获胜人
                Query bq = GOrderInfo.Query().WHERE("PID", pid);
                if (bq.ExecuteReader()["OrderType"].ToString() != "1")
                {
                    //错误提示的接口
                    return "您不是竞拍获胜人，无法支付";
                }
            }
        }
        //一口价
        else
        {
            //进行中 状态
            if (dr["StatusID"].ToString() != "2")
            {
                //错误提示的接口
                return "订单状态已经改变，无法支付，请点击商品标题查看详情";
            }
        }
        //余额之前已检查过了

        return string.Empty;
    }

}
