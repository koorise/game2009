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
///AppraiseData 的摘要说明
/// </summary>
public class AppraiseData
{
	public AppraiseData()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 增加评价
    /// </summary>
    /// <param name="orderNumber">订单编号</param>
    /// <param name="isWho">用户身份类型</param>
    /// <param name="isGood">评价分数</param>
    /// <param name="EvaluationWords">评语</param>
    /// <param name="istype">评价类型</param>
    /// <returns>bool</returns>
    public static bool Add(decimal orderNumber,int isWho,int isGood,string EvaluationWords,int istype)
    {
        Query q=new Query(VwAppaiseToSaler.Schema);
        q.AddWhere(VwAppaiseToSaler.Columns.OrderNumber, orderNumber);
        IDataReader dr = q.ExecuteReader();
        if(dr.Read())
        {
            string pnkid = dr["pnkid"].ToString();
            string buyerid = dr["uid"].ToString();
            string salerID = dr["saleruserid"].ToString();

            GoodWillUser g=new GoodWillUser();
            g.Pnkid = decimal.Parse(pnkid);
            g.OrderNumber = orderNumber;
            g.IsType = 1;//信誉评价=1，售后服务评价=2
            g.IsWho = isWho;
            g.Uid = int.Parse(Cookies.getCookies("cUID"));
            g.Unid = (isWho != 0) ? int.Parse(buyerid) : int.Parse(salerID);
            g.IsGood = isGood;
            g.IsContent = (EvaluationWords == "") ? 0 : 1;
            g.EvaluationinTime = DateTime.Now;
            g.EvaluationWords = EvaluationWords;
            g.EvaluationinTimeYear = DateTime.Now.Year;
            g.EvaluationinMonth = DateTime.Now.Month;
            g.EvaluationinTimeDate = DateTime.Now.Day;
            g.IsModifyByUsr = 0;
            g.IsStatus = 0;
            g.Save();
            return true;
        }
        else
        {
            return false;
        }
        
    }
}
