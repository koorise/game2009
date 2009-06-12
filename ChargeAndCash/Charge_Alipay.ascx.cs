using System;
using System.Collections;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Data.OleDb;
using SubSonic;
using GameDB;
using Gateway;

public partial class ChargeAndCash_Charge_Alipay : System.Web.UI.UserControl
{
    protected static decimal runningid;     //内部流水号记录

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //初始化
            txt_id1.Text = "2088002578114462"; // 合作id

            if (Request["out_trade_no"] != null)
            {
                //充值提交后返回页面的跳转
                ChargeWizard.ActiveStepIndex = 2;
            }
            else if (Request["step"] == "confirm")
            {
                string uid = Cookies.getCookies("cUID");
                runningid = decimal.Parse(Request["runningnum"]);
                txt_price1.Text = GAccountForOut.Query().SetSelectList("applyprice").WHERE("runningid='" + Request["runningnum"] + "'").WHERE("userid=" + uid).ExecuteScalar().ToString();
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
            txt_price11.Text = txt_price1.Text;
        }
        else if (ChargeWizard.ActiveStepIndex == 2)
        {
            //第三步加载
            //

            //客户端返回代码，response.write可以不用显示
            string alipayNotifyURL = "https://www.alipay.com/cooperate/gateway.do?";
            string key = "l5243c96jz0xf9dipfs82pyzoxe79rzw"; //partner 的对应交易安全校验码（必须填写）
            string _input_charset = "utf-8";
            string partner = "2088002578114462"; 		//partner合作伙伴id（必须填写）

            alipayNotifyURL = alipayNotifyURL + "service=notify_verify" + "&partner=" + partner + "&notify_id=" + Request.QueryString["notify_id"];

            //获取支付宝ATN返回结果，true是正确的订单信息，false 是无效的
            string responseTxt = Get_Http(alipayNotifyURL, 120000);
            int i;
            NameValueCollection coll;
            //Load Form variables into NameValueCollection variable.
            coll = Request.QueryString;
            // Get names of all forms into a string array.
            String[] requestarr = coll.AllKeys;
            //进行排序；
            string[] Sortedstr = BubbleSort(requestarr);

           /* for (i = 0; i < Sortedstr.Length; i++)
           { 
              Response.Write("Form: " + Sortedstr[i] + "=" + Request.QueryString[Sortedstr[i]] + "<br>");
           }*/

            //构造待md5摘要字符串 ；
            StringBuilder prestr = new StringBuilder();
            for (i = 0; i < Sortedstr.Length; i++)
            {
                if (Request.Form[Sortedstr[i]] != "" && Sortedstr[i] != "sign" && Sortedstr[i] != "sign_type")
                {
                    if (i == Sortedstr.Length - 1)
                    {
                        prestr.Append(Sortedstr[i] + "=" + Request.QueryString[Sortedstr[i]]);
                    }
                    else
                    {
                        prestr.Append(Sortedstr[i] + "=" + Request.QueryString[Sortedstr[i]] + "&");
                     
                    }
                }
            }
            prestr.Append(key);

            //生成Md5摘要；
            string mysign = GetMD5(prestr.ToString(), _input_charset);
            string sign = Request.QueryString["sign"];
            string trade_status = Request.QueryString["trade_status"];

            Response.Write(prestr.ToString());  //打印返回通知消息，接收到的

            if (mysign == sign && responseTxt == "true" && trade_status == "TRADE_FINISHED")   //验证支付发过来的消息，签名是否正确
            {
                //返回验证完毕
                //更新自己数据库的订单语句，由后台提交，如果遇到阻塞的情况未处理
                //GAccountRecord

                Response.Write("success");     //返回给支付宝消息，成功（不用返回给支付宝）
                //打印出接收通知。计算结果
                Response.Write("------------------------------------------");
                Response.Write("<br>Result:responseTxt=" + responseTxt);
                Response.Write("<br>Result:mysign=" + mysign);
                Response.Write("<br>Result:sign=" + sign);
            }
            else
            {
                //打印出接收通知。计算结果
                Response.Write("------------------------------------------");
                Response.Write("<br>Result:responseTxt=" + responseTxt);
                Response.Write("<br>Result:mysign=" + mysign);
                Response.Write("<br>Result:sign=" + sign);
            }
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
            // runningid=内部流水号;runningnum外部流水号; pricetypeid = 充值; pricechannelid = 支付宝; price=申请金额=txt_price.text; oprateprice=0 （实际操作金额，以后成功了再改，也是判断状态的依据）;  servicecharge =手续费计算结果;
            // accountname=用户支付宝账户名  num=帐号 （提现使用）; serviceid=客服id; starttime=now  超时的判断依据; endtime以后填结束时间;  isstatus=状态="已下单"
            GAccountForOut.Insert(int.Parse(uid), runningid, 0, 3, 1, decimal.Parse(txt_price1.Text), 0, 0, null, null, null, DateTime.Now, null, 4);
            
            //下单提交完毕
        }
        else if (e.CurrentStepIndex == 1)
        {
            Query q = GAccountForOut.Query().WHERE("runningid='"+runningid+"'");
            q.AddUpdateSetting("isstatus", 1).Execute();    //状态更新 -- 处理中
            //状态更新完毕
            
            string out_trade_no = runningid.ToString();    //支付宝外部交易号 由我方构造  返回时会发回
            //** //这里用来记录标识，返回时以此为依据处理数据
            
            //业务参数赋值；需要确定以及留接口
            string gateway = "https://www.alipay.com/cooperate/gateway.do?";	//支付接口
            string service = "create_direct_pay_by_user";                       //服务代号
            string partner = "2088002578114462";		                        //partner 合作伙伴ID (保留字段) **
            string sign_type = "MD5";                                           //验证方式
            string subject = "易站充值";	                                    //subject 商品名称
            string body = "易站淘宝支付宝直充";		                            //body	商品描述    
            string payment_type = "1";                                          //支付类型	
            string total_fee = txt_price11.Text;                                //总金额	0.01～50000.00 **
            string show_url = "www.alipay.com";                                 //展示界面 (店铺柜台)
            string seller_email = "dsniper@126.com";                            //卖家账号 **
            string key = "l5243c96jz0xf9dipfs82pyzoxe79rzw";                    //partner账户的支付宝安全校验码 **
            string return_url = "~/ChargePrice.aspx";                           //客户端显示返回接口 **
            string notify_url = "~/ChargeAndCash/Alipay_Notify.aspx";           //服务器通知返回接口 **
            string _input_charset = "utf-8";

            AliPay ap = new AliPay();
            string aliay_url = ap.CreatUrl(
                gateway,
                service,
                partner,
                sign_type,
                out_trade_no,
                subject,
                body,
                payment_type,
                total_fee,
                show_url,
                seller_email,
                key,
                return_url,
                _input_charset,
                notify_url
                );

            //新页面还是跳转？
            Response.Redirect(aliay_url);
            //向支付宝提交完毕
        }
    }

    public static string GetMD5(string s, string _input_charset)
    {
        /// <summary>
        /// 与ASP兼容的MD5加密算法
        /// </summary>

        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] t = md5.ComputeHash(Encoding.GetEncoding(_input_charset).GetBytes(s));
        StringBuilder sb = new StringBuilder(32);
        for (int i = 0; i < t.Length; i++)
        {
            sb.Append(t[i].ToString("x").PadLeft(2, '0'));
        }
        return sb.ToString();
    }

    public static string[] BubbleSort(string[] r)
    {
        /// <summary>
        /// 冒泡排序法
        /// </summary>

        int i, j; //交换标志 
        string temp;
        bool exchange;

        for (i = 0; i < r.Length; i++) //最多做R.Length-1趟排序 
        {
            exchange = false; //本趟排序开始前，交换标志应为假

            for (j = r.Length - 2; j >= i; j--)
            {
                if (System.String.CompareOrdinal(r[j + 1], r[j]) < 0)　//交换条件
                {
                    temp = r[j + 1];
                    r[j + 1] = r[j];
                    r[j] = temp;

                    exchange = true; //发生了交换，故将交换标志置为真 
                }
            }

            if (!exchange) //本趟排序未发生交换，提前终止算法 
            {
                break;
            }
        }
        return r;
    }

    //获取远程服务器ATN结果
    public String Get_Http(String a_strUrl, int timeout)
    {
        string strResult;
        try
        {
            HttpWebRequest myReq = (HttpWebRequest)HttpWebRequest.Create(a_strUrl);
            myReq.Timeout = timeout;
            HttpWebResponse HttpWResp = (HttpWebResponse)myReq.GetResponse();
            Stream myStream = HttpWResp.GetResponseStream();
            StreamReader sr = new StreamReader(myStream, Encoding.Default);
            StringBuilder strBuilder = new StringBuilder();
            while (-1 != sr.Peek())
            {
                strBuilder.Append(sr.ReadLine());
            }
            strResult = strBuilder.ToString();
        }
        catch (Exception exp)
        {
            strResult = "错误：" + exp.Message;
        }
        return strResult;
    }

}
