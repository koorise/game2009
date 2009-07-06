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

public partial class AccountControl_AccountList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Tools.FillDropDownList(ddlGame,"sysGame","","请选择游戏");
            Tools.FillDropDownList(ddlProductStatusID,"sysProductsStatus","","");
            bindRept(1);
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        bindRept(1);
    }
    protected void ddlGame_SelectedIndexChanged(object sender, EventArgs e)
    {
        Tools.FillDropDownList(ddlGame, "sysServer", "", "请选择服务器","GameID",ddlGame.SelectedValue.ToString());
    }
    void bindRept(int p)
    {
        Query q = new Query(VwOrderInfoForSaler.Schema);
        q.SetSelectList("title,gamename,Servername,OrderNumber,Pricenow,pAccountNums,uID,username,orderintime,OrderType");
        q.AddWhere("userid", Cookies.getCookies("cUID"));
        if (tbKeyWord.Text != "")
        {
            if (tbKeyWord.Text.Substring(1, 2) == "20")
            {
                q.AddWhere("pnkid", tbKeyWord.Text);
            }
            else
            {
                q.AddWhere("title", Comparison.Like, "%" + tbKeyWord.Text + "%");
            }
        }
        q.AddWhere("statusID", ddlProductStatusID.SelectedValue);
        if (ddlGame.SelectedValue != "0")
        {
            q.AddWhere("GameID", ddlGame.SelectedValue);
        }
        if (ddlServer.SelectedValue != "0")
        {
            q.AddWhere("serverID", ddlServer.SelectedValue);
        }
        if (tbStartTime.Text != "")
        {
            q.AddWhere("pTimeStart", Comparison.LessOrEquals, tbStartTime.Text);
        }
        if (tbEndTime.Text != "")
        {
            q.AddWhere("pTimeEnd", Comparison.LessOrEquals, tbEndTime.Text);
        }
        if (tbBuyerName.Text != "")
        {
            q.AddWhere("username", Comparison.Like, "%" + tbBuyerName.Text + "%");
        }
        litCounts.Text = q.GetRecordCount().ToString();
        bindPage(int.Parse(litCounts.Text), p);
        
        Repeater1.DataSource = Tools.PageDST("spAll_returnrows", q.GetSql(), p.ToString(), "3",
                                             "PNKID", "PNKID");
        Repeater1.DataBind();
    }
    void bindPage(int count,int indexPage)
    {
        
        int page = Tools.GetPageCount(count, 3);
        litPageCount.Text = page.ToString();
        for(int i = 1;i<=page;i++)
        {

            Button b = new Button();
            b.ID = "btnPage_" + i.ToString();
            b.Text = i.ToString();
            b.CommandArgument = i.ToString();
            b.CommandName = "page";
            b.Command += new CommandEventHandler(b_Command);
            PlaceHolder1.Controls.Add(b);
        }
        if (indexPage == 1)
        {
            imgBtnPrv.CommandArgument = "1";
            imgBtnNext.CommandArgument = "2";
        }
        else
        {
            if(indexPage==page)
            {
                imgBtnNext.CommandArgument = page.ToString();
                imgBtnPrv.CommandArgument = (page - 1).ToString();
            }
            else
            {
                imgBtnNext.CommandArgument = (indexPage + 1).ToString();
                imgBtnPrv.CommandArgument = (indexPage - 1).ToString();
            }
        }
    }
    void b_Command(object sender, CommandEventArgs e)
    {
        bindRept(int.Parse(e.CommandArgument.ToString()));
    }
    protected void imgBtnPrv_Click(object sender, ImageClickEventArgs e)
    {
        bindRept(int.Parse(imgBtnPrv.CommandArgument));
    }
    protected void imgBtnNext_Click(object sender, ImageClickEventArgs e)
    {
        bindRept(int.Parse(imgBtnNext.CommandArgument));
    }
}
