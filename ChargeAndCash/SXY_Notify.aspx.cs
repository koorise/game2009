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

public partial class ChargeAndCash_SXY_Notify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strArctit = Request.ServerVariables["QUERY_STRING"];
        string strtt = System.Web.HttpUtility.UrlDecode(strArctit, System.Text.Encoding.GetEncoding("Gb2312"));
        //Response.Write(strtt);

        int start, end;
      
        start = strtt.IndexOf("v_oid");
        end = strtt.IndexOf("&", start);
        end = end;
        string strpoid1 = strtt.Substring(start, end - start);

        int st1 = strpoid1.IndexOf("=") + 1;
        string strpoid = strpoid1.Substring(st1);
        Response.Write("v_oid:");
        Response.Write(strpoid);
        Response.Write("<br>");

        start = strtt.IndexOf("v_pmode");
        end = strtt.IndexOf("&", start);
        end = end;
        string strpode1 = strtt.Substring(start, end - start);

        int st2 = strpode1.IndexOf("=") + 1;
        string strpode = strpode1.Substring(st2);
        Response.Write("v_pmode:");
        Response.Write(strpode);
        Response.Write("<br>");

        start = strtt.IndexOf("v_pstatus");
        end = strtt.IndexOf("&", start);
        end = end;
        string strpstatus1 = strtt.Substring(start, end - start);

        int st3 = strpstatus1.IndexOf("=") + 1;
        string strpstatus = strpstatus1.Substring(st3);
        Response.Write("v_pstatus:");
        Response.Write(strpstatus);
        Response.Write("<br>");

        start = strtt.IndexOf("v_pstring");
        end = strtt.IndexOf("&", start);
        end = end;
        string strpstring1 = strtt.Substring(start, end - start);

        int st4 = strpstring1.IndexOf("=") + 1;
        string strpstring = strpstring1.Substring(st4);
        Response.Write("v_pstring:");
        Response.Write(strpstring);
        Response.Write("<br>");


        start = strtt.IndexOf("v_md5info");
        end = strtt.IndexOf("&", start);
        end = end;
        string strpmd5info1 = strtt.Substring(start, end - start);

        int st5 = strpmd5info1.IndexOf("=") + 1;
        string strpmd5info = strpmd5info1.Substring(st5);
        Response.Write("v_md5info:");
        Response.Write(strpmd5info);
        Response.Write("<br>");

        start = strtt.IndexOf("v_amount");
        end = strtt.IndexOf("&", start);
        end = end;
        string strpamount1 = strtt.Substring(start, end - start);

        int st6 = strpamount1.IndexOf("=") + 1;
        string strpamount = strpamount1.Substring(st6);
        Response.Write("v_amount:");
        Response.Write(strpamount);
        Response.Write("<br>");

        start = strtt.IndexOf("v_moneytype");
        end = strtt.IndexOf("&", start);
        end = end;
        string strpmoneytype1 = strtt.Substring(start, end - start);

        int st7 = strpmoneytype1.IndexOf("=") + 1;
        string strpmoneytype = strpmoneytype1.Substring(st7);
        Response.Write("v_moneytype:");
        Response.Write(strpmoneytype);
        Response.Write("<br>");

        start = strtt.IndexOf("v_md5money");
        end = strtt.IndexOf("&", start);
        end = end;
        string strpmd5money1 = strtt.Substring(start, end - start);

        int st8 = strpmd5money1.IndexOf("=") + 1;
        string strpmd5money = strpmd5money1.Substring(st8);
        Response.Write("v_md5money:");
        Response.Write(strpmd5money);
        Response.Write("<br>");

        start = strtt.IndexOf("v_sign");
        end = strtt.IndexOf("&", start);
        end = end;
        string strpsign1 = strtt.Substring(start,start);


        int st9 = strpsign1.IndexOf("=") + 1 ;
        string strpsign = strpsign1.Substring(st9);
        Response.Write("v_sign:");
        Response.Write(strpsign);
        Response.Write("<br>");
 

        ClassHmac2003.ClassHmac cc = new ClassHmac2003.ClassHmac();
        mm = strpoid + strpstatus + strpstring + strpode;
        md5info = cc.hex_hmac_md5(mm, "test");
        Response.Write("md5info:");
        Response.Write(md5info);
        Response.Write("<br>");

        md = strpamount + strpmoneytype;
        md5money = cc.hex_hmac_md5(md, "test");
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
    }
}
