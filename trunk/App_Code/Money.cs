using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SubSonic;
using GameDB;

/// <summary>
///Money 的摘要说明
/// </summary>
public class Money
{
	public Money()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public static bool HastenCent(int userID)
    {
        Query q = new Query("gAccountRecord");
        q.AddWhere("userID", userID);
        return true;
    }
}
