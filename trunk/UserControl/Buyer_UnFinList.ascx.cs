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

public partial class UserControl_Buyer_UnFinList : System.Web.UI.UserControl
{
    protected static int pagesize = 40;
    protected static int currentpage = 1;
    protected SqlQuery sq = new SqlQuery();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Tools.FillDropDownList(ddlGameID, "sysGame", "0", "请选择游戏");
            Tools.FillDropDownList(ddlDealStatus, "sysOrderType", "0", "不限制");
            ddlDealStatus.Items.Remove(ddlDealStatus.Items.FindByText("成功"));

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
        SqlQuery sqdef = new Select(GOrderInfo.IdColumn.ColumnName,"*").From(GOrderInfo.Schema).InnerJoin(GProduct.Schema).InnerJoin(SysGame.GameIDColumn,GProduct.GameIDColumn).InnerJoin(SysServer.ServerIDColumn,GProduct.ServerIDColumn).InnerJoin(SysOrderType.OrderTypeIDColumn,GOrderInfo.OrderTypeColumn).Where("uID").IsEqualTo(uid);
        if (CommandName == "all")
        {
            object sqtemp = new Select("orderTypeID").From("SysOrderType").Where("orderType").IsEqualTo("成功").ExecuteScalar();
            sq = sqdef.And("OrderType").IsNotEqualTo(sqtemp);
        }
        else if (CommandName == "pay")
        {
            object sqtemp = new Select("orderTypeID").From("SysOrderType").Where("orderType").IsEqualTo("等待付款").ExecuteScalar();
            sq = sqdef.And("OrderType").IsEqualTo(sqtemp);
        }
        else if (CommandName == "deliver")
        {
            object sqtemp1 = new Select("orderTypeID").From("SysOrderType").Where("orderType").IsEqualTo("等待付款").ExecuteScalar();
            object sqtemp2 = new Select("orderTypeID").From("SysOrderType").Where("orderType").IsEqualTo("移交中").ExecuteScalar();
            sq = sqdef.And("OrderType").In(sqtemp1,sqtemp2);
        }
        else if (CommandName == "lead")
        {
            object sqtemp = new Select("orderTypeID").From("SysOrderType").Where("orderType").IsEqualTo("领先").ExecuteScalar();
            sq = sqdef.And("OrderType").IsEqualTo(sqtemp);
        }
        else if (CommandName == "out")
        {
            object sqtemp = new Select("orderTypeID").From("SysOrderType").Where("orderType").IsEqualTo("出局").ExecuteScalar();
            sq = sqdef.And("OrderType").IsEqualTo(sqtemp);
        }
        else if (CommandName == "search")
        {
            if (tbStart.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("pTimeStart").IsGreaterThanOrEqualTo(tbStart.Text);
            }
            if (tbEnd.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("pTimeStart").IsLessThanOrEqualTo(tbEnd.Text);
            }
            if (ddlGameID.SelectedIndex > 0)
            {
                sqdef = sqdef.And("GameID").IsEqualTo(ddlGameID.SelectedValue);
            }
            if (ddlServerID.SelectedIndex > 0)
            {
                sqdef = sqdef.And("ServerID").IsEqualTo(ddlServerID.SelectedValue);
            }
            if (tbKeyWord.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.AndExpression("pTitle").Like(tbKeyWord.Text);
                sqdef = sqdef.Or("OrderNumber").Like(tbKeyWord.Text).CloseExpression();
            }
            if (ddlDealStatus.SelectedIndex > 0)
            {
                sq = sqdef.And("OrderType").IsEqualTo(ddlDealStatus.SelectedValue);
            }
            else
            {
                object sqtemp = new Select("orderTypeID").From("SysOrderType").Where("orderType").IsEqualTo("成功").ExecuteScalar();
                sq = sqdef.And("OrderType").IsNotEqualTo(sqtemp);
            }
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

    /// <summary>
    /// 获得物品类型图片
    /// </summary>
    /// <param name="pnkid">物品编号</param>
    /// <returns>图片地址</returns>
    protected string GetTypeImage(string pnkid)
    {
        string imgurl = "images/ico_zhang.gif";
        //目前1期只有帐号，未加分类
        return imgurl;
    }

    /// <summary>
    /// 获得订单状态图片
    /// </summary>
    /// <param name="ordertype">订单类型</param>
    /// <returns>图片地址</returns>
    protected string GetStatusImage(string ordertype)
    {
        string imgurl = string.Empty;
        if (ordertype == "领先")
            imgurl = "images/btn_lingxian.gif";
        else if (ordertype == "出局")
            imgurl = "images/btn_chuju.gif";
        else if (ordertype == "等待付款")
            imgurl = "images/btn_dengdai.gif";
        else
        {
            //图不全
        }
        return imgurl;
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

    /// <summary>
    /// 获得物品总量（批量的情况）
    /// </summary>
    /// <param name="pnkid">物品编号</param>
    /// <returns>价格</returns>
    protected string GetProductCount(string pnkid)
    {
        Query q = VwProductsBaseDetail.Query().WHERE("pnkid=" + pnkid);
        string str = q.SetSelectList("pAccountNums").ExecuteScalar().ToString();
        return str;
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

    protected void lbtnSearchMore_Click(object sender, EventArgs e)
    {
        if (Panel1.Visible)
        {
            Panel1.Visible = false;
            lbtnSearchMore.Text = "高级搜索选项";
        }
        else
        {
            Panel1.Visible = true;
            lbtnSearchMore.Text = "精简搜索选项";
        }

    }

    protected void ddlGameID_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlServerID.Items.Clear();
        Tools.FillDropDownList(ddlServerID, "sysServer", "0", "请选择服务器", "GameID", ddlGameID.SelectedValue);
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
                link_view.NavigateUrl = "~/Buyer_UnFinView_GoOn.aspx?ordernum="+drv["ordernumber"].ToString();
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
            txt_listcount.Text = "物品信息总数："+sq.GetRecordCount();
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
                btn_page.ID = "btn_page"+i.ToString();
                btn_page.Text = i.ToString();
                btn_page.CommandName = i.ToString();
                if (i == currentpage)
                {
                    btn_page.CssClass = "focus";
                    btn_page.Enabled = false;
                }
                btn_page.Click +=new EventHandler(btn_page_Click);
                btnpanel.Controls.Add(btn_page);
            }
        }
    }
    protected void btn_pagecount1_Click(object sender, ImageClickEventArgs e)
    {
        pagesize = 20;
        currentpage = 1;
        BindList();
    }
    protected void btn_pagecount2_Click(object sender, ImageClickEventArgs e)
    {
        pagesize = 40;
        currentpage = 1;
        BindList();
    }
    protected void btn_pagecount3_Click(object sender, ImageClickEventArgs e)
    {
        pagesize = 80;
        currentpage = 1;
        BindList();
    }
    protected void btn_search_pay_Click(object sender, EventArgs e)
    {
        currentpage = 1;
        BindSource("pay");
    }
    protected void btn_search_deliver_Click(object sender, EventArgs e)
    {
        currentpage = 1;
        BindSource("deliver");
    }
    protected void btn_search_lead_Click(object sender, EventArgs e)
    {
        currentpage = 1;
        BindSource("lead");
    }
    protected void btn_search_out_Click(object sender, EventArgs e)
    {
        currentpage = 1;
        BindSource("out");
    }
    protected void btn_search_all_Click(object sender, EventArgs e)
    {
        currentpage = 1;
        BindSource("all");
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
