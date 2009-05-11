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
    /// <summary>
    /// 押金
    /// </summary>
    public static decimal YaJin (int i)
    {
        if(i==1)
        {
            return 10;
        }
        else
        {
            return 0;
        }
    }
    public static bool HastenCent(int userID)
    {
        Query q = new Query("gAccountRecord");
        q.AddWhere("userID", userID);
        return true;
    }
    /// <summary>
    /// 返回账户余额
    /// </summary>
    /// <param name="userID">用户ID</param>
    /// <param name="moneyType">余额类型</param>
    /// <returns>返回账户余额</returns>
    public static decimal AccountCPrice(int userID,params int[] moneyType)
    {
        Query q=new Query("gAccountRecord");
        q.AddWhere("userID", userID);
        if(moneyType.Length>0)
        {
            q.AddWhere("moneyType", moneyType[0]);
        }
        q.SetSelectList("cPrice");
        q.SetTop("1");
        q.ORDER_BY("ID desc");
        return decimal.Parse(q.ExecuteScalar().ToString());
    }
    public static void AccountRecordOprate(int userID,decimal orderNumber,decimal PNKID,int moneyType, int priceType, decimal opratePrice,string bak,string qNumber,string tNumber,int isStatus,DateTime finishtime)
    {
        decimal cPrice = AccountCPrice(userID);
        if(cPrice+opratePrice>=0)
        {
            GAccountRecord g= new GAccountRecord();
            g.RunningID = Tools.CreateNum();
            g.UserID = userID;
            g.OrderNumber = orderNumber;
            g.Pnkid = PNKID;
            g.MoneyType = moneyType;
            g.PriceType = priceType;
            g.InTime = DateTime.Now;
            g.OperatePrice = opratePrice;
            g.CPrice = cPrice + opratePrice;
            g.Bak = bak;
            g.QNumber = qNumber;
            g.TNumber = tNumber;
            g.IsStatus = isStatus;
            g.FinishTime = finishtime;
            g.Save();
        }
        
        
    }
}
