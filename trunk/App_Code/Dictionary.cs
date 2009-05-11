using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
///Status 的摘要说明
/// </summary>
public class Dictionary
{
    public Dictionary()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// gOrderInfo.orderType 1-出局,2-领先,3-等待付款,4-等待交货,5-移交中,6-成功,7-失败,8-撤销
    /// </summary>
    public static int[] orderType = {0, 1, 2, 3, 4, 5, 6, 7, 8};
    /// <summary>
    /// gAccountRecord.PriceType 1-支付,2-售得,3-充值,4-提现,5-支付退款,6-提现退款,7-预交押金,8-押金取回,9-提现手续费
    /// </summary>
    public static int[] PriceType = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    /// <summary>
    /// gAccountRecord.isStatus 1-处理中,2-处理完毕,3-已撤销,4-个人操作,5-系统处理
    /// </summary>
    public static int[] AccountRecordStatus = {0, 1, 2, 3, 4, 5};
    /// <summary>
    /// SaleType 1-单个出售,2-批量出售
    /// </summary>
    public static int[] SaleTypeID = {0, 1, 2};
    /// <summary>
    /// SaleMethod 1-寄售,2-担保,3-中介
    /// </summary>
    public static int[] SaleMethodID = {0, 1, 2, 3};
    /// <summary>
    /// ProductsStatus 1-出售中,2-成交结束,3-流拍,4-已撤销
    /// </summary>
    public static int[] ProductsStatus = {0, 1, 2, 3, 4};
    /// <summary>
    /// 1-交易活动，2-押金，3-诚信担保金
    /// </summary>
    public static int[] MoneyType = { 0, 1, 2, 3 };
    /// <summary>
    /// gOrderInfo.OrderStatus 未定义
    /// </summary>
    public static int[] orderStatus = {0, 1, 2, 3, 4};
}
