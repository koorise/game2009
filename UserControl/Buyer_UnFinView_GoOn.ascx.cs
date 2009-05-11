using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SubSonic;
using GameDB;

public partial class UserControl_Buyer_UnFinView_GoOn : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (CheckStatus(2))
                BindPage();
            else
                Tools.Error("订单状态已经改变，为保护您的帐户安全，当前操作已经取消，请返回列表刷新查看");
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

        SqlQuery sq = new Select(GOrderInfo.IdColumn.ColumnName, "*").From(GOrderInfo.Schema).InnerJoin(GProduct.Schema).InnerJoin(GUserInfo.UIDColumn,GProduct.UserIDColumn).InnerJoin(GAccountInfo.PnkidColumn,GOrderInfo.PnkidColumn);   //关联表
        sq = sq.InnerJoin(SysGame.GameIDColumn, GProduct.GameIDColumn).InnerJoin(SysServer.ServerIDColumn, GProduct.ServerIDColumn).InnerJoin(SysOrderType.OrderTypeIDColumn,GOrderInfo.OrderTypeColumn).InnerJoin(SysSaleMethod.TypeIDColumn,GProduct.SaleMethodIDColumn).InnerJoin(SysSaleType.SaleTypeIDColumn,GProduct.SaleTypeIDColumn);    //关联字典
        sq = sq.Where("uID").IsEqualTo(uid);    //条件：订单用户
        sq = sq.And("OrderNumber").IsEqualTo(Request["ordernum"]);  //条件：订单号

        if (txt_orderstatus.Text == "出局")
        {
            btn_add1.Enabled = true;
            btn_add1.Visible = true;
        }
        else
        {
            btn_add1.Enabled = false;
            btn_add1.Visible = false;
        }

        FormView1.DataSource = sq.ExecuteDataSet().Tables[0].DefaultView;
        FormView1.DataBind();
    }

    /// <summary>
    /// 检查订单当前状态
    /// </summary>
    /// <param name="checkmember">检查的成员数</param>
    /// <returns>是/否</returns>
    protected bool CheckStatus(int checkmember)
    {
        Query q = GOrderInfo.Query().SetSelectList("OrderType").WHERE("uID=" + Cookies.getCookies("cUID")).WHERE("OrderNumber=" + decimal.Parse(Request["ordernum"]));
        string str = SysOrderType.Query().SetSelectList("OrderType").WHERE("OrderTypeID=" + int.Parse(q.ExecuteScalar().ToString())).ExecuteScalar().ToString();
        if (checkmember == 1)
        {
            if (str != "出局")
                return false;
        }
        else
        {
            if (str != "出局" && str != "领先")
                return false;
        }
        return true;
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

    /// <summary>
    /// 获得物品剩余时间（特定格式）
    /// </summary>
    /// <param name="endtime">结束时间</param>
    /// <returns>计算结果</returns>
    protected string GetLastTime(object endtime)
    {
        string str = string.Empty;
        DateTime dt = Convert.ToDateTime(endtime);
        if (DateTime.Now.CompareTo(dt) < 0)
        {
            TimeSpan ts = dt - DateTime.Now;
            str = ts.Days.ToString() + "天" + ts.Hours.ToString() + "小时" + ts.Minutes.ToString() + "分";
        }
        else
            str = "已过期";
        return str;
    }

    /// <summary>
    /// 获得物品当前价格
    /// </summary>
    /// <param name="pnkid">物品编号</param>
    /// <returns>价格</returns>
    protected string GetCurrentPrice(string pnkid)
    {
        Query q = GOrderInfo.Query().WHERE("pnkid=" + pnkid);
        double money = Convert.ToDouble(q.GetMax("PriceNow"));
        double mymoney = Convert.ToDouble(q.WHERE("uid=" + Cookies.getCookies("cUID")).GetMax("PriceNow"));
        string str = Math.Max(money, mymoney).ToString("0.00");
        return str;
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

        ImageButton btn_add2 = (ImageButton)FormView1.Row.FindControl("btn_add2");
        ImageButton btn_add3 = (ImageButton)FormView1.Row.FindControl("btn_add3");
        if (txt_orderstatus.Text == "出局")
        {
            btn_add2.Enabled = true;
            btn_add2.Visible = true;
            btn_add3.Enabled = true;
            btn_add3.Visible = true;
        }
        else
        {
            btn_add2.Enabled = false;
            btn_add2.Visible = false;
            btn_add3.Enabled = false;
            btn_add3.Visible = false;
        }
    }
    protected void btn_add1_Click(object sender, ImageClickEventArgs e)
    {
        if (CheckStatus(1))
        {
            Query q = GOrderInfo.Query().SetSelectList("pnkid").WHERE("OrderNumber=" + decimal.Parse(Request["ordernum"]));
            Tools.jsRedirect("~/ProductDetails.aspx?pnkid=" + q.ExecuteScalar().ToString());   //出价页面
        }
        else
            Tools.Error("订单状态已经改变，为保护您的帐户安全，当前操作已经取消，请返回列表刷新查看");
    }
    protected void btn_backlist_Click(object sender, EventArgs e)
    {
        Tools.jsRedirect("~/Buyer_UnFin.aspx");
    }
}
