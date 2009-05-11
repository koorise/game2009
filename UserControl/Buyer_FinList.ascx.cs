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

public partial class UserControl_Buyer_FinList : System.Web.UI.UserControl
{
    protected static int pagesize = 40;
    protected static int currentpage = 1;
    protected SqlQuery sq = new SqlQuery();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Tools.FillDropDownList(ddlGameID, "sysGame", "0", "请选择游戏");

            BindSource("all");
        }

    }

    /// <summary>
    /// 绑定datalist，处理数据源
    /// </summary>
    /// <param name="CommandName">传递的命令参数</param>
    protected void BindSource(string CommandName)
    {
        //string uid = Cookies.getCookies("cUID");
        string uid = "1";
        SqlQuery sqdef = new Select(GOrderInfo.IdColumn.ColumnName, "*").From(GOrderInfo.Schema).InnerJoin(GProduct.Schema).InnerJoin(SysGame.GameIDColumn, GProduct.GameIDColumn).InnerJoin(SysServer.ServerIDColumn, GProduct.ServerIDColumn).InnerJoin(GUserInfo.UIDColumn,GProduct.UserIDColumn).Where("uID").IsEqualTo(uid);
        if (CommandName == "all")
        {
            //
        }
        else if (CommandName == "search")
        {
            if (tbStart.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("pTimeEnd").IsGreaterThanOrEqualTo(tbStart.Text);
            }
            if (tbEnd.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("pTimeEnd").IsLessThanOrEqualTo(tbEnd.Text);
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
            if (tbSells.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("UserName").Like(tbSells.Text);
            }
            if (tbLow.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("PriceNow").IsGreaterThanOrEqualTo(tbLow.Text);
            }
            if (tbHigh.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("PriceNow").IsGreaterThanOrEqualTo(tbHigh.Text);
            }
        }
        object sqtemp = new Select("orderTypeID").From("SysOrderType").Where("orderType").IsEqualTo("成功").ExecuteScalar();
        sq = sqdef.And("OrderType").IsEqualTo(sqtemp);

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
            Panel PromisePanel = (Panel)e.Item.FindControl("PromisePanel");
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

            //评价部分还不确定
            //需要修改
            HyperLink link_sells = (HyperLink)e.Item.FindControl("link_sells");
            link_sells.NavigateUrl = "";
            link_sells.Text = "对方未评";   //对方已评  无色 可点击
            link_sells.CssClass = "red";
            HyperLink link_buyer = (HyperLink)e.Item.FindControl("link_buyer");
            link_buyer.NavigateUrl = "";
            link_buyer.Text = "评价卖家";   //已评  无色 可否点击？
            link_buyer.CssClass = "green";
            HyperLink link_servies = (HyperLink)e.Item.FindControl("link_servies");
            link_servies.NavigateUrl = "";
            link_servies.Text = "售后打分"; //已打分 无色 可否点击？
            link_servies.CssClass = "green";
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
