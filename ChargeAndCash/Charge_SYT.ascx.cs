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

public partial class ChargeAndCash_Charge_SYT : System.Web.UI.UserControl
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
        //
    }

    protected void ChargeWizard_ActiveStepChanged(object sender, EventArgs e)
    {
        if (ChargeWizard.ActiveStepIndex == 0)
        {
            if (Request["step"] == "fin")
            {
                ChargeWizard.ActiveStepIndex = 2;
            }
            else if (Request["step"] == "confirm")
            {
                ChargeWizard.ActiveStepIndex = 1;
            }
        }
        else if (ChargeWizard.ActiveStepIndex == 1)
        {
            txt_price2.Text = txt_price.Text;
        }
        else if (ChargeWizard.ActiveStepIndex == 2)
        {
            //
        }
    }

    protected void ChargeWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 0)
        {
            string uid = Cookies.getCookies("cUID");
            //
            //  计算手续费
            //  留接口
            //
            // 向gAccountForOut存储数据的代码 
            // runningid=内部流水号; pricetypeid = 充值; pricechannelid = 支付宝; price=申请金额=txt_price.text; oprateprice=0 （实际操作金额，以后成功了再改，也是判断状态的依据）;  servicecharge =手续费计算结果;
            // accountname=用户支付宝账户名  num=帐号 （提现使用）; serviceid=客服id; starttime=now  超时的判断依据; endtime以后填结束时间;  isstatus=状态="已下单"
        }
        else if (e.CurrentStepIndex == 1)
        {
            //首信易支付接口未处理  样码如下
            //************************************************************************************************************

            string v_mid = ""; //商户编号
            string ymd = System.DateTime.Now.ToString("yyyyMMdd");
            string hms = System.DateTime.Now.ToString("hhmmss");
            string v_oid = ymd + "-" + v_mid + "-" + hms;//订单编号

            string v_rcvname = "赵云";

            string v_rcvaddr = "北京市海淀区海淀南路";

            string v_rcvtel = "01011111111";

            string v_rcvpost = "100080";
            string v_amount = "0.01"; //订单金额

            string v_ymd = ymd;
            string v_orderstatus = "0";
            string v_ordername = "关羽";

            string v_moneytype = "0";
            string v_url = "http://www.sina.com.cn";


            ClassHmac2003.ClassHmac cc = new ClassHmac2003.ClassHmac();

            string key_key = v_moneytype + v_ymd + v_amount + v_rcvname + v_oid + v_mid + v_url;
            //Response.Write(key_key);
            string v_md5info = cc.hex_hmac_md5(key_key, "testtest");

            //触发提交
            //document.getElementById("form1").action =" http://pay.beijing.com.cn/customer/gb/pay_bank.jsp";
        }
    }

}
