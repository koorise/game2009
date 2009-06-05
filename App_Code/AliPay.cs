using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Security.Cryptography;
/// <summary>
/// New Interface for AliPay
/// </summary>
namespace Gateway
{
    /// <summary>
    /// created by sunzhizhi 2006.5.21,sunzhizhi@msn.com��
    /// </summary>
    public class AliPay
    {

        public static string GetMD5(string s, string _input_charset)
        {

            /// <summary>
            /// ��ASP���ݵ�MD5�����㷨
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
            /// ð������
            /// </summary>

            int i, j; //������־ 
            string temp;

            bool exchange;

            for (i = 0; i < r.Length; i++) //�����R.Length-1������ 
            {
                exchange = false; //��������ʼǰ��������־ӦΪ��

                for (j = r.Length - 2; j >= i; j--)
                {
                    if (System.String.CompareOrdinal(r[j + 1], r[j]) < 0)��//��������
                    {
                        temp = r[j + 1];
                        r[j + 1] = r[j];
                        r[j] = temp;

                        exchange = true; //�����˽������ʽ�������־��Ϊ�� 
                    }
                }

                if (!exchange) //��������δ������������ǰ��ֹ�㷨 
                {
                    break;
                }

            }
            return r;
        }

        public string CreatUrl(
            string gateway, 
            string service, 
            string partner, 
            string sign_type,
            string out_trade_no,
            string subject, 
            string body, 
            string payment_type, 
            string total_fee, 
            string show_url, 
            string seller_email, 
            string key, 
            string return_url,
            string _input_charset,
            string notify_url
            )
        {
            /// <summary>
            /// created by sunzhizhi 2006.5.21,sunzhizhi@msn.com��
            /// </summary>
            int i;
           
             //�������飻
                string[] Oristr ={ 
                "service="+service, 
                "partner=" + partner, 
                "subject=" + subject, 
                "body=" + body, 
                "out_trade_no=" + out_trade_no, 
                "total_fee=" + total_fee, 
                "show_url=" + show_url,  
                "payment_type=" + payment_type, 
                "seller_email=" + seller_email, 
                "notify_url=" + notify_url,
                "_input_charset="+_input_charset,          
                "return_url=" + return_url
                };
            
            //��������
            string[] Sortedstr = BubbleSort(Oristr);


            //�����md5ժҪ�ַ��� ��

            StringBuilder prestr = new StringBuilder();

            for (i = 0; i < Sortedstr.Length; i++)
            {
                if (i == Sortedstr.Length - 1)
                {
                    prestr.Append(Sortedstr[i]);

                }
                else
                {

                    prestr.Append(Sortedstr[i] + "&");
                }

            }

            prestr.Append(key);

            //����Md5ժҪ��
            string sign = GetMD5(prestr.ToString(), _input_charset);

            //����֧��Url��
            char[] delimiterChars = { '='};
            StringBuilder parameter = new StringBuilder();
            parameter.Append(gateway);
            for (i = 0; i < Sortedstr.Length; i++)
            {

                parameter.Append(Sortedstr[i].Split(delimiterChars)[0] + "=" + HttpUtility.UrlEncode(Sortedstr[i].Split(delimiterChars)[1]) + "&");
            }

            parameter.Append("sign=" + sign + "&sign_type=" + sign_type);


            //����֧��Url��
            return parameter.ToString();

        }



    }
}