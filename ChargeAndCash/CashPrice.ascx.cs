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

public partial class ChargeAndCash_CashPrice : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //初始化
            //检查是否登录
            if (!Tools.ChkStatus())
                Tools.jsRedirect("~/Login.aspx");
            string uid = Cookies.getCookies("cUID");
            //检查个人信息是否完善
            
            Query uq = UserScrtInfo.Query().WHERE("userid=" + uid);
            string alipayname = uq.SetSelectList("alipayname").ExecuteScalar().ToString();
            string alipayid = uq.SetSelectList("alipayid").ExecuteScalar().ToString();
            string bankmanname = uq.SetSelectList("bankmanname").ExecuteScalar().ToString();
            string bankcardid = uq.SetSelectList("bankcardid").ExecuteScalar().ToString();
            if (alipayname == string.Empty || alipayid == string.Empty || bankmanname == string.Empty || bankcardid == string.Empty)
            {
                Tools.Error("您尚未完善您的网银信息，请完善网银信息后再试！");
                Tools.jsRedirect("~/BankModify.aspx");
            }
            //检查用户状态是否正常
            uq = GUserInfo.Query().WHERE("uid=" + uid);
            if (uq.SetSelectList("isblock").ExecuteScalar().ToString() == "1")
            {
                Tools.Error("您的账号被暂封，请先申请解封后再试");
                Tools.jsRedirect("~/Login.aspx");
            }

            Tools.FillDropDownList(dropQuestion, "SysQuestion", "0", "请选择问题...");
        }
    }

    protected void CashWizard_ActiveStepChanged(object sender, EventArgs e)
    {
        if (CashWizard.ActiveStepIndex == 0)
        {
            //第一步加载
            //
        }
        else if (CashWizard.ActiveStepIndex == 1)
        {
            //第二步加载
            string uid = Cookies.getCookies("cUID");
            object idx = GAccountRecord.Query().WHERE("UserID", uid).GetMax("id");
            txt_leftprice2.Text = string.Format("{0:C}", GAccountRecord.Query().SetSelectList("cPrice").WHERE("id", idx).ExecuteScalar());
            txt_enableprice2.Text = "5000"; //不明 当日限额？
        }
        else if (CashWizard.ActiveStepIndex == 2)
        {
            //第三步加载
            string uid = Cookies.getCookies("cUID");
            Query uq = UserScrtInfo.Query().WHERE("userid=" + uid);
            if (sel_channel.SelectedValue == "icbc")
            {
                txt_channel31.Text = "中国工商银行";
                txt_channel41.Text = "中国工商银行";
                txt_channel51.Text = "中国工商银行";

                txt_accountname31.Text = uq.SetSelectList("bankmanname").ExecuteScalar().ToString();
                txt_accountname41.Text = txt_accountname31.Text;
                txt_accountnum31.Text = uq.SetSelectList("bankcardid").ExecuteScalar().ToString();
                txt_accountnum41.Text = txt_accountnum31.Text;
                txt_accountnum51.Text = txt_accountnum31.Text;

                txt_leftprice31.Text = txt_leftprice2.Text;
                txt_enableprice31.Text = txt_enableprice2.Text;
                txt_leftprice41.Text = txt_leftprice2.Text;
                txt_enableprice41.Text = txt_enableprice2.Text;

                Tools.FillDropDownList(dropQuestion31, "SysQuestion", "0", "请选择问题...");
            }
            else if(sel_channel.SelectedValue == "alipay")
            {
                txt_channel42.Text = "支付宝";
                txt_channel52.Text = "支付宝";

                txt_accountname32.Text = uq.SetSelectList("alipayname").ExecuteScalar().ToString();
                txt_accountname42.Text = txt_accountname31.Text;
                txt_accountnum32.Text = uq.SetSelectList("alipayid").ExecuteScalar().ToString();
                txt_accountnum42.Text = txt_accountnum31.Text;
                txt_accountnum52.Text = txt_accountnum31.Text;

                txt_leftprice32.Text = txt_leftprice2.Text;
                txt_enableprice32.Text = txt_enableprice2.Text;
                txt_leftprice42.Text = txt_leftprice2.Text;
                txt_enableprice42.Text = txt_enableprice2.Text;

                Tools.FillDropDownList(dropQuestion32, "SysQuestion", "0", "请选择问题...");
            }
        }
        else if (CashWizard.ActiveStepIndex == 3)
        {
            //第四步加载
            if (sel_channel.SelectedValue == "icbc")
            {
                double aprice = Convert.ToDouble(txt_price31.Text);
                double charge = aprice * 0.009;
                charge = Math.Min(charge, 45);
                charge = Math.Max(charge, 0.9);
                double oprice = aprice - charge; 

                txt_price41.Text = txt_price31.Text;
                txt_price51.Text = txt_price31.Text;
                txt_oprice41.Text = oprice.ToString("0.00");
                txt_oprice51.Text = txt_oprice41.Text;
                txt_sprice41.Text = charge.ToString("0.00");
            }
            else if (sel_channel.SelectedValue == "alipay")
            {
                double aprice = Convert.ToDouble(txt_price32.Text);
                double charge = aprice * 0.008;
                double oprice = aprice - charge;

                txt_price42.Text = txt_price32.Text;
                txt_price52.Text = txt_price32.Text;
                txt_oprice42.Text = oprice.ToString("0.00");
                txt_oprice52.Text = txt_oprice42.Text;
                txt_sprice42.Text = charge.ToString("0.00");
            }
        }
        else if (CashWizard.ActiveStepIndex == 4)
        {
            //第五步加载
            if (sel_channel.SelectedValue == "icbc")
            {
                txt_servicename1.Text = "用户资料客服/充值/提现";
                txt_servicenum1.Text = "22050616";
            }
            else if (sel_channel.SelectedValue == "alipay")
            {
                txt_servicename2.Text = "用户资料客服/充值/提现";
                txt_servicenum2.Text = "22050616";
            }
        }
    }

    protected void CashWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 0)
        {
            if (!Tools.ChkStatus())
                Tools.jsRedirect("~/Login.aspx");
            string uid = Cookies.getCookies("cUID");
            if (!Tools.CheckQuestion(uid, dropQuestion.SelectedValue, txtAnswer.Text))
            {
                txtAlert.Text = "密保或答案输入错误";
                e.Cancel = true;
            }
        }
        else if (e.CurrentStepIndex == 1)
        {
            if (sel_channel.SelectedValue == "icbc")
            {
                MultiView1.ActiveViewIndex = 0;
                MultiView2.ActiveViewIndex = 0;
                MultiView3.ActiveViewIndex = 0;
            }
            else if (sel_channel.SelectedValue == "alipay")
            {
                MultiView1.ActiveViewIndex = 1;
                MultiView2.ActiveViewIndex = 1;
                MultiView3.ActiveViewIndex = 1;
            }
        }
        else if (e.CurrentStepIndex == 2)
        {
            if (!Tools.ChkStatus())
                Tools.jsRedirect("~/Login.aspx");
            string uid = Cookies.getCookies("cUID");
            object idx = GAccountRecord.Query().WHERE("UserID", uid).GetMax("id");
            object cprice = GAccountRecord.Query().SetSelectList("cPrice").WHERE("id", idx).ExecuteScalar();
            if (sel_channel.SelectedValue == "icbc")
            {
                if (!Tools.CheckQuestion(uid, dropQuestion31.SelectedValue, txtAnswer31.Text))
                {
                    txtAlert31.Text = "密保或答案输入错误";
                    e.Cancel = true;
                }
                if (Convert.ToDouble(txt_price31.Text) > Convert.ToDouble(cprice))
                {
                    Tools.Error("可用余额不足，请检查您的提现金额重新提交");
                    e.Cancel = true;
                }
            }
            else if (sel_channel.SelectedValue == "alipay")
            {
                if (!Tools.CheckQuestion(uid, dropQuestion32.SelectedValue, txtAnswer32.Text))
                {
                    txtAlert32.Text = "密保或答案输入错误";
                    e.Cancel = true;
                }
                if (Convert.ToDouble(txt_price32.Text) > Convert.ToDouble(cprice))
                {
                    Tools.Error("可用余额不足，请检查您的提现金额重新提交");
                    e.Cancel = true;
                }
            }
        }
        else if (e.CurrentStepIndex == 3)
        {
            if (!Tools.ChkStatus())
                Tools.jsRedirect("~/Login.aspx");
            string uid = Cookies.getCookies("cUID");
            Query uq = UserScrtInfo.Query().WHERE("userid=" + uid);
            object idx = GAccountRecord.Query().WHERE("UserID", uid).GetMax("id");
            object cprice = GAccountRecord.Query().SetSelectList("cPrice").WHERE("id", idx).ExecuteScalar();
            if (sel_channel.SelectedValue == "icbc")
            {
                if (Convert.ToDouble(txt_price31.Text) > Convert.ToDouble(cprice))
                {
                    Tools.Error("可用余额不足，请检查您的提现金额重新提交");
                    e.Cancel = true;
                }

                string bankmanname = uq.SetSelectList("bankmanname").ExecuteScalar().ToString();
                string bankcardid = uq.SetSelectList("bankcardid").ExecuteScalar().ToString();
                // 向gAccountForOut存储数据的代码 
                // runningid=内部流水号;runningnum外部流水号; pricetypeid = 提现; pricechannelid = 工行; price=申请金额=txt_price.text; oprateprice=0 （实际操作金额，以后成功了再改，也是判断状态的依据）;  servicecharge =手续费计算结果;
                // accountname=用户账户名  num=帐号 （提现使用）; serviceid=客服id; starttime=now  超时的判断依据; endtime以后填结束时间;  isstatus=状态="已下单"
                GAccountForOut.Insert(int.Parse(uid), Tools.CreateNum(), 0, 4, 3, decimal.Parse(txt_price31.Text), decimal.Parse(txt_oprice51.Text), decimal.Parse(txt_sprice41.Text), bankmanname, bankcardid, null, DateTime.Now, null, 1);
            }
            else if (sel_channel.SelectedValue == "alipay")
            {
                if (Convert.ToDouble(txt_price32.Text) > Convert.ToDouble(cprice))
                {
                    Tools.Error("可用余额不足，请检查您的提现金额重新提交");
                    e.Cancel = true;
                }

                string alipayname = uq.SetSelectList("alipayname").ExecuteScalar().ToString();
                string alipayid = uq.SetSelectList("alipayid").ExecuteScalar().ToString();
                // 向gAccountForOut存储数据的代码 
                // runningid=内部流水号;runningnum外部流水号; pricetypeid = 提现; pricechannelid = 支付宝; price=申请金额=txt_price.text; oprateprice=0 （实际操作金额，以后成功了再改，也是判断状态的依据）;  servicecharge =手续费计算结果;
                // accountname=用户支付宝账户名  num=帐号 （提现使用）; serviceid=客服id; starttime=now  超时的判断依据; endtime以后填结束时间;  isstatus=状态="已下单"
                GAccountForOut.Insert(int.Parse(uid), Tools.CreateNum(), 0, 4, 1, decimal.Parse(txt_price32.Text), decimal.Parse(txt_oprice52.Text), decimal.Parse(txt_sprice42.Text), alipayname, alipayid, null, DateTime.Now, null, 1);
            }

            //提醒客服的代码
            //

            //对用户余额操作，如失败怎以后由客服还款
            //提现完毕
        }
    }

}
