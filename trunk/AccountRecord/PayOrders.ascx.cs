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

public partial class AccountRecord_PayOrders : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;

            Query query = new Query(GProduct.Schema);
            query.AddWhere("pnkid", Request["pnkid"]);
            query.SetSelectList("pTitle");
            litProductBasic1.Text = query.ExecuteScalar().ToString();
            litProductBasic2.Text = litProductBasic1.Text;
            litProductBasic3.Text = litProductBasic1.Text;

            Query q = new Query(GOrderInfo.Schema);
            q.AddWhere("pnkid", Request["pnkid"]);
            q.AddWhere("orderType", Dictionary.orderType[3]);//3-等待付款
            q.AddWhere("uid", Cookies.getCookies("cUID"));
            q.SetSelectList("pricenow");
            if(q.GetRecordCount()>0)
            {
                litPrice1.Text = Convert.ToDecimal(q.ExecuteScalar()).ToString("F2");
                litPrice2.Text = litPrice1.Text;
                litPrice3.Text = litPrice1.Text;
            }
            else
            {
                litPrice1.Text =
                    GProduct.Query().SetSelectList("pPriceTop").WHERE("pnkid", Request["pnkid"]).WHERE("statusid",
                                                                                                       Dictionary.
                                                                                                           ProductsStatus
                                                                                                           [1]).
                        ExecuteScalar().ToString();
                litPrice2.Text = litPrice1.Text;
                litPrice3.Text = litPrice1.Text;
                //litErr.Text = Tools.Error("对不起，您没有竞拍成功！") + Tools.jsRedirect("Default.aspx");
                //Response.End();
            }


        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        Panel3.Visible = false;
        Panel4.Visible = false;

        decimal myMoney = Money.AccountCPrice(int.Parse(Cookies.getCookies("cUid")));
        if (myMoney < decimal.Parse(litPrice1.Text))
        {
            ImageButton2.Visible = false;
            ImageButton22.Visible = true;
        }
        else
        {
            ImageButton2.Visible = true;
            ImageButton22.Visible = false;
            litMyMoney2.Text = myMoney.ToString("F2");
            litMyMoney3.Text = myMoney.ToString("F2");
        }
        
    }
    protected void ImageButton22_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/PayMent.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = true;
        Panel4.Visible = false;

        Tools.FillDropDownList(ddlQuestion,"sysQuestion","0","请选择密保问题");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {

        if(GUserInfo.Query().WHERE("uID",Cookies.getCookies("cUID")).WHERE("QuestionType",ddlQuestion.SelectedValue).WHERE("MyKey",tbAnswer.Text).GetRecordCount()>0)
        {

            //二次校验身份是否符合
            Query q = new Query(GOrderInfo.Schema);
            q.AddWhere("pnkid", Request["pnkid"]);
            q.AddWhere("orderType", Dictionary.orderType[3]);//3-等待付款
            q.AddWhere("uid", Cookies.getCookies("cUID"));
            q.SetSelectList("pricenow,orderNumber");
            if (q.GetRecordCount() > 0)
            {
                IDataReader dr = q.ExecuteReader();
                dr.Read();
                decimal orderNumer = decimal.Parse(dr[1].ToString());

                decimal pay = decimal.Parse(dr[0].ToString());
                decimal mine = Money.AccountCPrice(int.Parse(Cookies.getCookies("cUID")));
               
                if( mine >= pay)
                {
                    //账务 扣款
                    Money.AccountRecordOprate(int.Parse(Cookies.getCookies("cUID")), orderNumer, decimal.Parse(Request["pnkid"]), Dictionary.MoneyType[1], Dictionary.PriceType[1], -pay, "", tbQQ.Text, tbPhone.Text, Dictionary.AccountRecordStatus[4], DateTime.Now);

                    //更新gPorduct.StatusID 为 2 -成交结束
                    GProduct gProduct = new GProduct("pnkid", Request["Pnkid"]);
                    gProduct.StatusID = Dictionary.ProductsStatus[2];
                    gProduct.Save();

                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = true;
                    litErr.Text = Tools.jsClipBoard();
                    litOrderNumber.Text = orderNumer.ToString() + "<a href='#' onclick=copyToClipBoard('"+ orderNumer.ToString() +"')>[复制]</a>";
                }
                else
                {
                    litErr.Text = Tools.Error("对不起，您的账户余额不足！") + Tools.jsRedirect("Default.aspx");
                    Response.End();
                }
            }
            else
            {
                Query q1=new Query(GProduct.Schema);
                q1.AddWhere("statusID", Dictionary.ProductsStatus[1]);
                q1.AddWhere("salemethodid", Comparison.NotEquals, Dictionary.SaleMethodID[3]);
                q1.AddWhere("PNKID", Request["pnkid"]);
                q1.SetSelectList("pPriceTop");
                decimal priceTop = decimal.Parse(q1.ExecuteScalar().ToString());
                decimal pricemy = Money.AccountCPrice(int.Parse(Cookies.getCookies("cUid")));

                if(pricemy>=priceTop)
                {
                    //订单表插入操作
                    decimal orderNumber = Tools.CreateNum();
                    GOrderInfo g = new GOrderInfo();
                    g.UID = int.Parse(Cookies.getCookies("cUID"));
                    g.Pnkid = decimal.Parse(Request["pnkID"]);
                    g.OrderNumber = orderNumber;
                    g.OrderType = Dictionary.orderType[4]; //4-等待交货
                    //g.OrderStatus = 2;
                    g.PriceNow = priceTop;
                    g.PriceAgent = priceTop;
                    g.InTime = DateTime.Now;
                    g.Save();
                    
                    //更新gPorduct.StatusID 为 2 -成交结束
                    GProduct gProduct=new GProduct("pnkid",Request["Pnkid"]);
                    gProduct.StatusID = Dictionary.ProductsStatus[2];
                    gProduct.Save();


                    //账务 扣款
                    Money.AccountRecordOprate(int.Parse(Cookies.getCookies("cUID")),orderNumber,decimal.Parse(Request["pnkid"]),Dictionary.MoneyType[1],Dictionary.PriceType[1],-priceTop,"",tbQQ.Text,tbPhone.Text,Dictionary.AccountRecordStatus[4],DateTime.Now);
                    litErr.Text = Tools.jsClipBoard();
                    litOrderNumber.Text = orderNumber.ToString() + "<a href='#' onclick=copyToClipBoard('" + orderNumber.ToString() + "')>[复制]</a>";

                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = true;

                }
                else
                {
                    litErr.Text = Tools.Error("对不起，您的账户余额不足！") + Tools.jsRedirect("Default.aspx");
                    Response.End();
                }
                 
            }
        }
    }
}
