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
using System.Text;
using SubSonic;
using GameDB;

public partial class Service_OrderBuy_View : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Query q = GOrderInfo.Query().SetSelectList("OrderType").WHERE("uID=" + Cookies.getCookies("cUID")).WHERE("OrderNumber=" + decimal.Parse(Request["ordernum"]));
            string str = SysOrderType.Query().SetSelectList("OrderType").WHERE("OrderTypeID=" + int.Parse(q.ExecuteScalar().ToString())).ExecuteScalar().ToString();
            if (str != "成功")
                Tools.Error("订单状态已经改变，为保护您的帐户安全，当前操作已经取消，请返回列表刷新查看");
            else
                BindPage();
        }
    }

    /// <summary>
    /// 绑定页面元素
    /// </summary>
    protected void BindPage()
    {
        string uid = Cookies.getCookies("cUID");
        Query q = GOrderInfo.Query().SetSelectList("OrderType").WHERE("uID=" + uid).WHERE("OrderNumber=" + decimal.Parse(Request["ordernum"]));
        txt_orderstatus.Text = SysOrderType.Query().SetSelectList("OrderType").WHERE("OrderTypeID=" + int.Parse(q.ExecuteScalar().ToString())).ExecuteScalar().ToString();

        SqlQuery sq = new Select(GOrderInfo.IdColumn.ColumnName, "*").From(GOrderInfo.Schema).InnerJoin(GProduct.Schema).InnerJoin(GUserInfo.UIDColumn, GProduct.UserIDColumn).InnerJoin(GAccountInfo.PnkidColumn, GOrderInfo.PnkidColumn);   //关联表
        sq = sq.InnerJoin(SysGame.GameIDColumn, GProduct.GameIDColumn).InnerJoin(SysServer.ServerIDColumn, GProduct.ServerIDColumn).InnerJoin(SysOrderType.OrderTypeIDColumn, GOrderInfo.OrderTypeColumn).InnerJoin(SysSaleMethod.TypeIDColumn, GProduct.SaleMethodIDColumn).InnerJoin(SysSaleType.SaleTypeIDColumn, GProduct.SaleTypeIDColumn);    //关联字典
        sq = sq.Where("uID").IsEqualTo(uid);    //条件：订单用户
        sq = sq.And("OrderNumber").IsEqualTo(Request["ordernum"]);  //条件：订单号

        CheckStatus();

        FormView1.DataSource = sq.ExecuteDataSet().Tables[0].DefaultView;
        FormView1.DataBind();
    }

    /// <summary>
    /// 检查评价各项状态
    /// </summary>
    protected void CheckStatus()
    {
        //检查并设置按钮状态，防止漏洞
        //修改
        //
    }

    /// <summary>
    /// 获得出售类型的图标
    /// </summary>
    /// <param name="saletype">出售类型</param>
    /// <returns>图标地址</returns>
    protected string GetSaleTypeImage(string saletype)
    {
        string imgurl = string.Empty;
        if (saletype == "单个出售")
            imgurl = "images/ico_dan.gif";
        else if (saletype == "批量出售")
            imgurl = "images/ico_zheng.gif";
        else
        {
            //字典不全
            //images/ico_pei.gif
            //images/ico_zhong.gif
        }
        return imgurl;
    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        DataRowView drv = (DataRowView)FormView1.DataItem;

        Panel PromisePanel = (Panel)FormView1.Row.FindControl("PromisePanel");
        //根据卖方信誉度显示图标
        //drv["isSalerScores"]
        string htmcode = "<img src=\"images/ico_lanzuan.gif\" width=\"15\" height=\"13\" align=\"absmiddle\" />";
        htmcode += "<img src=\"images/ico_lanzuan.gif\" width=\"15\" height=\"13\" align=\"absmiddle\" />";
        htmcode += "<img src=\"images/ico_lanzuan.gif\" width=\"15\" height=\"13\" align=\"absmiddle\" />";
        StringBuilder sb = new StringBuilder();
        sb.Append(htmcode);
        Literal lit1 = new Literal();
        lit1.Text = sb.ToString();
        PromisePanel.Controls.Add(lit1);
    }

}

