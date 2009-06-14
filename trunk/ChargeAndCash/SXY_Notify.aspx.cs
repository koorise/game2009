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

public partial class ChargeAndCash_SXY_Notify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strArctit = Request.ServerVariables["QUERY_STRING"];
        string strtt = System.Web.HttpUtility.UrlDecode(strArctit, System.Text.Encoding.GetEncoding("Gb2312"));
        //Response.Write(strtt);

        int start, end;
      
        //
        start = strtt.IndexOf("v_oid");
        end = strtt.IndexOf("&", start);
        string strpoid1 = strtt.Substring(start, end - start);
        int st1 = strpoid1.IndexOf("=") + 1;
        string strpoid = strpoid1.Substring(st1);
        
        Response.Write("v_oid:");
        Response.Write(strpoid);
        Response.Write("<br>");

        //
        start = strtt.IndexOf("v_pmode");
        end = strtt.IndexOf("&", start);
        string strpode1 = strtt.Substring(start, end - start);
        int st2 = strpode1.IndexOf("=") + 1;
        string strpode = strpode1.Substring(st2);
       
        Response.Write("v_pmode:");
        Response.Write(strpode);
        Response.Write("<br>");

        //
        start = strtt.IndexOf("v_pstatus");
        end = strtt.IndexOf("&", start);
        string strpstatus1 = strtt.Substring(start, end - start);
        int st3 = strpstatus1.IndexOf("=") + 1;
        string strpstatus = strpstatus1.Substring(st3);
        
        Response.Write("v_pstatus:");
        Response.Write(strpstatus);
        Response.Write("<br>");

        //
        start = strtt.IndexOf("v_pstring");
        end = strtt.IndexOf("&", start);
        string strpstring1 = strtt.Substring(start, end - start);
        int st4 = strpstring1.IndexOf("=") + 1;
        string strpstring = strpstring1.Substring(st4);
        
        Response.Write("v_pstring:");
        Response.Write(strpstring);
        Response.Write("<br>");

        //
        start = strtt.IndexOf("v_md5info");
        end = strtt.IndexOf("&", start);
        string strpmd5info1 = strtt.Substring(start, end - start);
        int st5 = strpmd5info1.IndexOf("=") + 1;
        string strpmd5info = strpmd5info1.Substring(st5);
        
        Response.Write("v_md5info:");
        Response.Write(strpmd5info);
        Response.Write("<br>");

        //
        start = strtt.IndexOf("v_amount");
        end = strtt.IndexOf("&", start);
        string strpamount1 = strtt.Substring(start, end - start);
        int st6 = strpamount1.IndexOf("=") + 1;
        string strpamount = strpamount1.Substring(st6);
        
        Response.Write("v_amount:");
        Response.Write(strpamount);
        Response.Write("<br>");

        //
        start = strtt.IndexOf("v_moneytype");
        end = strtt.IndexOf("&", start);
        string strpmoneytype1 = strtt.Substring(start, end - start);
        int st7 = strpmoneytype1.IndexOf("=") + 1;
        string strpmoneytype = strpmoneytype1.Substring(st7);
        
        Response.Write("v_moneytype:");
        Response.Write(strpmoneytype);
        Response.Write("<br>");

        //
        start = strtt.IndexOf("v_md5money");
        end = strtt.IndexOf("&", start);
        string strpmd5money1 = strtt.Substring(start, end - start);
        int st8 = strpmd5money1.IndexOf("=") + 1;
        string strpmd5money = strpmd5money1.Substring(st8);
        
        Response.Write("v_md5money:");
        Response.Write(strpmd5money);
        Response.Write("<br>");

        //
        start = strtt.IndexOf("v_sign");
        end = strtt.IndexOf("&", start);
        string strpsign1 = strtt.Substring(start,start);
        int st9 = strpsign1.IndexOf("=") + 1 ;
        string strpsign = strpsign1.Substring(st9);
        
        Response.Write("v_sign:");
        Response.Write(strpsign);
        Response.Write("<br>");
 
        //
        ClassHmac2003.ClassHmac cc = new ClassHmac2003.ClassHmac();
        string mm = strpoid + strpstatus + strpstring + strpode;
        string md5info = cc.hex_hmac_md5(mm, "test");
        Response.Write("md5info:");
        Response.Write(md5info);
        Response.Write("<br>");

        //
        string md = strpamount + strpmoneytype;
        string md5money = cc.hex_hmac_md5(md, "test");
        Response.Write("md5money:");
        Response.Write(md5money);
        Response.Write("<br>");

        if (md5info != strpmd5info || md5money != strpmd5money)
        {
            Response.Write("error");
        }
        else
        {
            Response.Write("sent");
        }

        //RSA的验证
        /**
        String strSource = strpoid + strpstatus + strpamount + strpmoneytype;
        //String strSource = v_oid + v_pstatus + v_amount + v_moneytype;
        Response.Write(strSource);
        RSA_MD5 rsa = new RSA_MD5();
        int i = rsa.PublicVerifyMD5("D:\\Public1024.key", strpsign, strSource);
        Response.Write(i.ToString());

        if (i ==0)
        {
            Response.Write("sent");
        }
        else
        {
            Response.Write("error");
        }
        */

        /*
         * 订单个数  （v_count）：本次发送的订单个数；（最少为1，最大为4）
 订单编号组（v_oid）：定义同商户提交待付款订单接口中的订单编号定义；
 支付方式组（v_pmode）：支付方式中文说明，如“中行长城信用卡”。
 支付状态组（v_pstatus）：支付结果，0→待处理（支付结果未确定）；
									   1支付完成；
                                   3支付被拒绝； 
 支付结果说明（v_pstring）：对支付结果的说明，成功时（v_pstatus=1）为“支付成功”，支付被拒绝时（v_pstatus=3）为失败原因。
订单支付金额(v_amount):订单实际支付金额
订单支付币种(v_moneytype):订单实际支付币种
         * 
         * v_sign：商城数据签名，参与签名的数据（v_oid+v_pstatus+v_amount+v_moneytype+v_count）
         * 数字指纹（v_mac）：防篡改信息，v_mac=hmac_md5(text , key)；其中text是表单中各项的value按如下顺序拼串的结果：v_oid+v_pmode+v_pstatus+v_pstring+v_count，key为双方约定的密钥
         * 数字指纹（v_md5money）：防篡改信息，v_md5money=hmac_md5(text , key)；其中text是表单中各项的value按如下顺序拼串的结果：v_amount +v_moneytype，key为双方约定的密钥。
         */

        //验证的代码  ** 编辑中
        //

        start = Request["v_oid"].LastIndexOf("-");
        string runningid = Request["v_oid"].Substring(start);

        if (Request["v_pstatus"] == "1")
        {
            // 更新自己数据库的订单语句
            // 向gAccountForOut修改数据的代码 
            // runningnumber不明; oprateprice=实际操作金额 
            // endtime=now; isstatus="成功"
            // 实际金额不为0表成功；为0则失败
            Query q = GAccountForOut.Query().WHERE("runningid='" + runningid + "'");
            q.AddUpdateSetting("runningnum", Request["v_oid"]);
            q.AddUpdateSetting("operateprice=",Request["v_amount"]);
            q.AddUpdateSetting("fintime=",DateTime.Now);
            q.AddUpdateSetting("isstatus", 2).Execute();    //状态更新 -- 完毕
            //状态更新完毕
        }
        else if (Request["v_pstatus"] == "3")
        {
            Query q = GAccountForOut.Query().WHERE("runningid='" + runningid + "'");
            q.AddUpdateSetting("runningnum", Request["v_oid"]);
            q.AddUpdateSetting("fintime=",  DateTime.Now);
            q.AddUpdateSetting("isstatus", 2).Execute();    //状态更新 -- 完毕
            //状态更新完毕
        }
    }
}
