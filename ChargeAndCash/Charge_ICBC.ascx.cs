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

public partial class ChargeAndCash_Charge_ICBC : System.Web.UI.UserControl
{
    protected static decimal runningid;     //内部流水号记录

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //初始化
            //
            if (Request["step"] == "confirm")
            {
                string uid = Cookies.getCookies("cUID");
                runningid = decimal.Parse(Request["runningnum"]);
                txt_price2.Text = GAccountForOut.Query().SetSelectList("applyprice").WHERE("runningid='" + Request["runningnum"] + "'").WHERE("userid=" + uid).ExecuteScalar().ToString();
                //对于已经填写的订单跳转
                ChargeWizard.ActiveStepIndex = 1;
            }
        }
    }

    protected void ChargeWizard_ActiveStepChanged(object sender, EventArgs e)
    {
        if (ChargeWizard.ActiveStepIndex == 0)
        {
            //第一步加载
            //
        }
        else if (ChargeWizard.ActiveStepIndex == 1)
        {
            //第二步加载
            txt_price22.Text = txt_price2.Text;
            //添加的尾数，以备转账检查
            decimal temp = decimal.Parse(txt_price2.Text);
            Random ra = new Random();
            temp += ra.Next(99)/1000;
            txt_price222.Text = temp.ToString("0.000");
            txt_icbcnum.Text = "4270208100091879";
            txt_icbcname.Text = "齐治嘉";
        }
        else if (ChargeWizard.ActiveStepIndex == 2)
        {
            //第三步加载
            
            //客服如何确定?
            txt_servicename.Text = "用户资料客服/充值/提现";
            txt_servicenum.Text = "22050616";
            //充值过程完毕
        }
    }

    protected void ChargeWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 0)
        {
            string uid = Cookies.getCookies("cUID");
            runningid = Tools.CreateNum();
            // 向gAccountForOut存储数据的代码 
            // runningid=内部流水号;runningnum外部流水号; pricetypeid = 充值; pricechannelid = 网银; price=申请金额=txt_price.text; oprateprice=0 （实际操作金额，以后成功了再改，也是判断状态的依据）;  servicecharge =手续费计算结果;
            // accountname=用户支付宝账户名  num=帐号 （提现使用）; serviceid=客服id; starttime=now  超时的判断依据; endtime以后填结束时间;  isstatus=状态="已下单"
            GAccountForOut.Insert(int.Parse(uid), runningid, 0, 3, 3, decimal.Parse(txt_price2.Text), 0, 0, null, null, null, DateTime.Now, null, 4);

            //下单提交完毕
        }
        else if (e.CurrentStepIndex == 1)
        {
            Query q = GAccountForOut.Query().WHERE("runningid='" + runningid + "'");
            //q.AddUpdateSetting("serviceid", "")                                           //状态更新 -- 客服
            q.AddUpdateSetting("operateprice", txt_price222.Text);                          //实际充值（含尾数）
            q.AddUpdateSetting("isstatus", 1).Execute();                                    //状态更新 -- 处理中
            //状态更新完毕

            //向银行提交记录完毕
        }
    }

}

