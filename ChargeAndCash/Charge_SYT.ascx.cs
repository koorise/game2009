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

public partial class ChargeAndCash_Charge_SYT : System.Web.UI.UserControl
{
    protected static decimal runningid;     //内部流水号记录

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //初始化
            //

            if (Request["out_trade_no"] != null)
            {
                //充值提交后返回页面的跳转
                ChargeWizard.ActiveStepIndex = 2;
            }
            else if (Request["step"] == "confirm")
            {
                string uid = Cookies.getCookies("cUID");
                runningid = decimal.Parse(Request["runningnum"]);
                txt_price3.Text = GAccountForOut.Query().SetSelectList("applyprice").WHERE("runningid='" + Request["runningnum"] + "'").WHERE("userid=" + uid).ExecuteScalar().ToString();
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
            txt_price33.Text = txt_price3.Text;
        }
        else if (ChargeWizard.ActiveStepIndex == 2)
        {
            //第三步加载
            //首信易返回接口验证   ** 编辑中
            /*
             * v_url?v_oid=20070720-商户号-000001234&v_pstatus=30&v_pstring=无效卡号
&v_pmode=支付方式(字符串)
&v_md5info=a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4&v_amount=0.01
&v_moneytype=0&v_md5money=56b2c3d345f6a1b2c3d4e766a1b2c323
&v_sign=7e85042c517d4e42f77b0ef967e7a6f20f2ede9ff6558c8309712ec7edddb69dc783a2019a48599cc81ada8397a03b3af0ae42789ac6bc2783a5084419d51b0f54749df0123d51b319cf5f8a3c4a4b886372463dd96f9922a8a1e88a0c663b0065b25f7c9ac29fc98478e665c079d57308c01780d3d8067bbb634c9dd3853c8e
             * 
             *1 v_oid = 商户发送的v_oid定单编号；
2．v_pmode = 支付方式（字符串）； 
3．v_pstatus = 1（已提交，对使用非实时银行卡进行扣款的订单）；
         20（支付成功，对使用实时银行卡进行扣款的订单）；
         30（支付失败，对使用实时银行卡进行扣款的订单）； 		
4．v_pstring 支付结果信息= 已提交（当v_pstatus=1时）；
                       支付完成（当v_pstatus=20时）；
                       失败原因（当v_pstatus=30时,字符串）；		
5．v_md5info =char* hmac_md5(char* text, char* key)
          char* text     拼串结果
          char* key     对称密钥
注：v_md5info校验四个参数，拼接字符串的顺序为：v_oid，v_pstatus，v_pstring和v_pmode
            6．v_amount订单实际支付金额
            7．v_moneytype 订单实际支付币种
            8．v_md5money=char* hmac_md5(char* text, char* key)
char* text     拼串结果
             char* key     对称密钥
v_md5money效验两个参数，拼接字符串的顺序为：v_amount，v_moneytype
9．v_sign：商城数据签名，参与签名的数据（v_oid+v_pstatus+v_amount+v_moneytype）
             * */

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
            // runningid=内部流水号;runningnum外部流水号; pricetypeid = 充值; pricechannelid = 首信易; price=申请金额=txt_price.text; oprateprice=0 （实际操作金额，以后成功了再改，也是判断状态的依据）;  servicecharge =手续费计算结果;
            // accountname=用户支付宝账户名  num=帐号 （提现使用）; serviceid=客服id; starttime=now  超时的判断依据; endtime以后填结束时间;  isstatus=状态="已下单"
            GAccountForOut.Insert(int.Parse(uid), runningid, 0, 3, 2, decimal.Parse(txt_price3.Text), 0, 0, null, null, null, DateTime.Now, null, 4);

            //下单提交完毕
        }
        else if (e.CurrentStepIndex == 1)
        {
            Query q = GAccountForOut.Query().WHERE("runningid='" + runningid + "'");
            q.AddUpdateSetting("isstatus", 1).Execute();    //状态更新 -- 处理中
            //状态更新完毕

            //首信易支付接口
            string v_mid = "";                                                  //商户编号
            string ymd = System.DateTime.Now.ToString("yyyyMMdd");
            string v_oid = ymd + "-" + v_mid + "-" + runningid.ToString();      //订单编号

            string v_rcvname = "赵云";
            string v_rcvaddr = "北京市海淀区海淀南路";
            string v_rcvtel = "01011111111";
            string v_rcvpost = "100080";
            
            string v_amount = txt_price3.Text;                                  //订单金额

            string v_ymd = ymd;
            string v_orderstatus = "1";                                         //配货状态
            string v_ordername = "关羽";
            string v_moneytype = "0";
            string v_url = "~/ChargePrice.aspx";

            ClassHmac2003.ClassHmac cc = new ClassHmac2003.ClassHmac();
            string key_key = v_moneytype + v_ymd + v_amount + v_rcvname + v_oid + v_mid + v_url;
            //Response.Write(key_key);
            string v_md5info = cc.hex_hmac_md5(key_key, "testtest");

            //触发提交
            //document.getElementById("form1").action =" http://pay.beijing.com.cn/customer/gb/pay_bank.jsp";
            string sxy_url = "http://pay.beijing.com.cn/customer/gb/pay_bank.jsp";
            sxy_url += "?v_mid" + v_mid;
            sxy_url += "&v_oid" + v_oid;
            sxy_url += "&v_rcvname" + v_rcvname;
            sxy_url += "&v_rcvaddr" + v_rcvaddr;
            sxy_url += "&v_rcvtel" + v_rcvtel;
            sxy_url += "&v_rcvpost" + v_rcvpost;
            sxy_url += "&v_amount" + v_amount;
            sxy_url += "&v_ymd" + v_ymd;
            sxy_url += "&v_orderstatus" + v_orderstatus;
            sxy_url += "&v_ordername" + v_ordername;
            sxy_url += "&v_moneytype" + v_moneytype;
            sxy_url += "&v_url" + v_url;
            sxy_url += "&v_md5info" + v_md5info;
            Response.Redirect(sxy_url);

            //向首信易提交完毕
        }
    }

}
