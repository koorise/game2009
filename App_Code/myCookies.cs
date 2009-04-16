using System;
using System.Web;
using System.Web.Security;

/// <summary>
///myCookies 的摘要说明
/// </summary>
public class Cookies
{
    public static string CookiesKey = "eGame2009";
    #region void addCookies(string cookiesName, string cookiesValue, int ExpireDay)增加Cookies
    /// <summary>
    /// 增加Cookies
    /// </summary>
    /// <param name="cookiesName">名称</param>
    /// <param name="cookiesValue">值</param>
    /// <param name="ExpireDay">过期时间，0表示跟随浏览器状态，-1 注销Cookies</param>
    public void addCookies(string cookiesName, string cookiesValue, int ExpireDay)
    {
        HttpCookie aCookies = new HttpCookie(cookiesName);
        aCookies.Value = HttpUtility.UrlEncode(cookiesValue);
        if (ExpireDay != 0)
        {
            aCookies.Expires = DateTime.Now.AddDays(ExpireDay);
        }
        HttpContext.Current.Response.Cookies.Add(aCookies);
    }
    #endregion
    #region string getCookies(string cookiesName)获取Cookies值
    /// <summary>
    /// 获取Cookies值
    /// </summary>
    /// <param name="cookiesName">名称</param>
    /// <returns>返回值，返回0表示不存在.</returns>
    public string getCookies(string cookiesName)
    {
        return HttpContext.Current.Request.Cookies[cookiesName] != null ? HttpUtility.UrlDecode(HttpContext.Current.Request.Cookies[cookiesName].Value) : "0";
    }
    #endregion
    #region string md5(string s) MD5加密
    /// <summary>
    /// MD5加密
    /// </summary>
    /// <param name="s">字符串</param>
    /// <returns>返回md5加密后的string</returns>
    public string md5(string s)
    {
        return FormsAuthentication.HashPasswordForStoringInConfigFile(s, "MD5");
    }
    #endregion
}
