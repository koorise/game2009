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

public partial class Service_OrderBuy_List : System.Web.UI.UserControl
{
    protected static int pagesize = 40;
    protected static int currentpage = 1;
    protected SqlQuery sq = new SqlQuery();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //

            BindSource("all");
        }

    }

    /// <summary>
    /// 绑定datalist，处理数据源
    /// </summary>
    /// <param name="CommandName">传递的命令参数</param>
    protected void BindSource(string CommandName)
    {
        string uid = Cookies.getCookies("cUID");
        SqlQuery sqdef = new Select(GOrderInfo.IdColumn.ColumnName, "*").From(GOrderInfo.Schema).InnerJoin(GProduct.Schema).InnerJoin(SysGame.GameIDColumn, GProduct.GameIDColumn).InnerJoin(SysServer.ServerIDColumn, GProduct.ServerIDColumn).InnerJoin(SysOrderType.OrderTypeIDColumn, GOrderInfo.OrderTypeColumn).Where("uID").IsEqualTo(uid);
        if (CommandName == "search")
        {
            
                object sqtemp = new Select("orderTypeID").From("SysOrderType").Where("orderType").IsEqualTo("成功").ExecuteScalar();
                sq = sqdef.And("OrderType").IsNotEqualTo(sqtemp);
            
        }

        sq = sq.OrderDesc(GOrderInfo.InTimeColumn.QualifiedName);
        currentpage = 1;
        BindList();
    }

    /// <summary>
    /// 绑定datalist
    /// </summary>
    protected void BindList()
    {
        sq = sq.Paged(currentpage, pagesize);
        MyOrderList1.DataSource = sq.ExecuteDataSet().Tables[0].DefaultView;
        MyOrderList1.DataBind();
    }

    protected void lbtnSearchMore_Click(object sender, EventArgs e)
    {
        //

    }

    protected void ddlGameID_SelectedIndexChanged(object sender, EventArgs e)
    {
        //
    }

    protected void MyOrderList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataRowView drv = (DataRowView)e.Item.DataItem;
        if (e.Item.ItemType == ListItemType.Header)
        {
            //图片不全
            //根据pagesize值改变对应按钮的图标
            //highlight shadow
        }
        else if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HyperLink link_view = (HyperLink)e.Item.FindControl("link_view");
            if (drv["orderType1"].ToString() == "出局" || drv["orderType1"].ToString() == "领先")
                link_view.NavigateUrl = "~/Buyer_UnFinView_GoOn.aspx?ordernum=" + drv["ordernumber"].ToString();
            else if (drv["orderType1"].ToString() == "等待付款")
                link_view.NavigateUrl = "~/Buyer_UnFinView_ToPay.aspx?ordernum=" + drv["ordernumber"].ToString();
            else if (drv["orderType1"].ToString() == "等待交货" || drv["orderType1"].ToString() == "移交中")
                link_view.NavigateUrl = "~/Buyer_UnFinView_Wait.aspx?ordernum=" + drv["ordernumber"].ToString();
            else if (drv["orderType1"].ToString() == "失败")
                link_view.NavigateUrl = "~/Buyer_UnFinView_Lost.aspx?ordernum=" + drv["ordernumber"].ToString();
            else if (drv["orderType1"].ToString() == "卖家撤销" || drv["orderType1"].ToString() == "客服撤销")
                link_view.NavigateUrl = "~/Buyer_UnFinView_Cancel.aspx?ordernum=" + drv["ordernumber"].ToString();

            HyperLink hl = (HyperLink)e.Item.FindControl("link_nexttip");
            if (drv["orderType1"].ToString() == "出局")
            {
                hl.Text = "提高出价";
                hl.NavigateUrl = "#";   //转到出价页面
                hl.Visible = true;
            }
            else if (drv["orderType1"].ToString() == "等待付款")
            {
                hl.Text = "立刻付款";
                hl.NavigateUrl = "~/CheckPay.aspx?pnkid=" + drv["pnkid"].ToString();
                hl.Visible = true;
            }
            else
            {
                hl.Visible = false;
            }
        }
        else if (e.Item.ItemType == ListItemType.Footer)
        {
            int pc = Tools.GetPageCount(sq.GetRecordCount(), pagesize);
            Label txt_listcount = (Label)e.Item.FindControl("txt_listcount");
            txt_listcount.Text = "物品信息总数：" + sq.GetRecordCount();
            txt_listcount.Text += "    显示总页数：";
            txt_listcount.Text += pc.ToString();

            ImageButton btn_prepage = (ImageButton)e.Item.FindControl("btn_prepage");
            if (currentpage == 1)
                btn_prepage.Enabled = false;
            ImageButton btn_nextpage = (ImageButton)e.Item.FindControl("btn_nextpage");
            if (currentpage == pc)
                btn_nextpage.Enabled = false;

            Panel btnpanel = (Panel)e.Item.FindControl("btnpanel");
            for (int i = currentpage - 3; i <= currentpage + 3; i++)
            {
                if (i < 1)
                    continue;
                else if (i > pc)
                    break;
                Button btn_page = new Button();
                btn_page.ID = "btn_page" + i.ToString();
                btn_page.Text = i.ToString();
                btn_page.CommandName = i.ToString();
                if (i == currentpage)
                {
                    btn_page.CssClass = "focus";
                    btn_page.Enabled = false;
                }
                btn_page.Click += new EventHandler(btn_page_Click);
                btnpanel.Controls.Add(btn_page);
            }
        }
    }

    protected void btn_search_all_Click(object sender, EventArgs e)
    {
        currentpage = 1;
        BindSource("search");
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        currentpage = 1;
        BindSource("search");
    }

    protected void btn_page_Click(object sender, EventArgs e)
    {
        //需要修改
        currentpage = 1;
        BindList();
    }
}
