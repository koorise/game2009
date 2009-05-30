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

public partial class ShopUserControl_Shop : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int shopID = int.Parse(Request["shopid"]);//店铺id转换类型
        //店铺基础数据赋值
        IDataReader dr = ShopInfo.Query().AddWhere("shopid", shopID).ExecuteReader();
        if (dr.Read())
        {
            UserTips1.uID = int.Parse(dr["userid"].ToString());
            litShopPost.Text = dr["shoppost"].ToString();
            LitShopLastUpdateTIme.Text = dr["shopupdatetime"].ToString();
            hySHopname.Text = dr["shopname"].ToString();
            imgShopLogo.ImageUrl = dr["shoplogo"].ToString();
        }
        //店铺公告绑定Repeater1
        Repeater1.DataSource =
            VwShopRecommendlist.Query().AddWhere("shopid", shopID).AddWhere("isshow", 1).SetSelectList(
                "pnkid,pricetop,ptitle").ORDER_BY("recommendid desc").ExecuteDataSet();
        Repeater1.DataBind();
        //店铺商品列表数据绑定Repeater2
        int page = 1;
        int pagesize = 20;
        if (Request["page"] != null)
        {
            page = int.Parse(Request["page"]);
        }
        if (Request["pagesize"] != null)
        {
            pagesize = int.Parse(Request["pagesize"]);
        }
        hyPagePre.NavigateUrl = "~/Shop.aspx?ShopID=" + Request["shopid"] + "&page=" + (page-1) + "&pagesize=" + pagesize ;
        hyPageNext.NavigateUrl = "~/Shop.aspx?ShopID=" + Request["shopid"] + "&page=" + (page + 1) + "&pagesize=" + pagesize;
        HyperLink3.NavigateUrl = "~/Shop.aspx?ShopID=" + Request["shopid"] + "&page=" + page + "&pagesize=20";
        HyperLink4.NavigateUrl = "~/Shop.aspx?ShopID=" + Request["shopid"] + "&page=" + page + "&pagesize=40";
        HyperLink5.NavigateUrl = "~/Shop.aspx?ShopID=" + Request["shopid"] + "&page=" + page + "&pagesize=60";
        Repeater2.DataSource = Tools.PageDST("spAll_returnrows",
                                             "select pnkid,Title,gamename,servername,priceNow,pricetop,pAccountNums,pTimeEnd,isYellow,isPassPort,isMail,ppromise from vwProductsBaseDetail where userid=" +
                                             dr["userid"].ToString(), page.ToString(), pagesize.ToString(), "PID", "PID");
        Repeater2.DataBind();

            if(Request["shopID"]!=null)
            {
                
                //页码
                litPageSize.Text = pagesize.ToString();
                litRecordCount.Text =
                    VwProductsBaseDetail.Query().AddWhere("userid", dr["userid"].ToString()).GetRecordCount().ToString();
                for(int i=1;i<=int.Parse(litRecordCount.Text);i++)
                {
                    if(Request["page"]==i.ToString())
                    {
                        LitPageCountor.Text = LitPageCountor.Text + "<a class='focus' href='/Shop.aspx?ShopID=" + Request["shopid"] + "&page=" + i + "&pagesize="+ pagesize +"'><span>" + i + "</span></a> ";
                    }
                    else
                    {
                        LitPageCountor.Text = LitPageCountor.Text + "<a href='/Shop.aspx?ShopID=" + Request["shopid"] + "&page=" + i + "&pagesize=" + pagesize + "'><span>" + i + "</span></a> ";
                    }
                }
            }
            //Dropdownlist 绑定
            Tools.FillDropDownList(ddlGame,"sysGame","","游戏");
            Tools.FillDropDownList(ddlSaleMethod,"sysSalemethod","","所有模式");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if(Panel2.Visible)
        {
            Panel2.Visible = false;
            LinkButton2.Text = "更多搜索选项>>";
        }
        else
        {
            Panel2.Visible = true;
            LinkButton2.Text = "<<精简搜索选项";
        }
    }

    protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        if(Panel2.Visible)
        {
            
        }
        else
        {
            
        }
    }
    protected void ddlGame_SelectedIndexChanged(object sender, EventArgs e)
    {
        Tools.FillDropDownList(ddlServer,"sysServer","","全部","gameid",ddlGame.SelectedValue);
        Tools.FillDropDownList(ddlRace,"sysRace","","全部","gameid",ddlGame.SelectedValue);
        Tools.FillDropDownList(ddlJob,"sysJob","","全部","gameid",ddlGame.SelectedValue);
    }
}
