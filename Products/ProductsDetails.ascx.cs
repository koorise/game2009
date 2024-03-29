﻿using System;
using System.Collections;
using System.Collections.Generic;
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

public partial class Products_ProductsDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Query q=new Query("vwProductsBaseDetail");
            q.AddWhere("PNKID", Request["PNKID"]);
            IDataReader pDR = q.ExecuteReader();
            if(pDR.Read())
            {
                UserTips1.uID = int.Parse(pDR["userID"].ToString());
                litProductTitle.Text = pDR["pTitle"].ToString();
                
                litPNKID.Text = Request["pnkid"];
                litGameName.Text = pDR["gamename"].ToString()+pDR["servername"];
                litStatus.Text = pDR["productsstatus"].ToString();
                litSaleMethod.Text = pDR["salemethod"].ToString();

                if(pDR["salemethodID"].ToString()== "3")
                {
                    imgBTNSubMit.Enabled = false;
                    tbMyPrice.Text = "此交易为中介交易";
                    tbMyPrice.Enabled = false;
                    PanelZhongJie.Visible = true;
                }
                else
                {
                    PanelZhongJie.Visible = false;
                }

                litSaleType.Text = pDR["saletype"].ToString();
                litTimeLeft2.Text = pDR["ptimeend"].ToString();
                litProductInTime.Text = pDR["intime"].ToString();
                
                litAccountNums1.Text = pDR["pAccountNums"].ToString();
                litAccountNums2.Text = litAccountNums1.Text;
                litAccountNums3.Text = litAccountNums1.Text;
                tbAccountNums.Text = litAccountNums1.Text;
               
                litViewCount.Text = pDR["ishits"].ToString();
                litProductDetails.Text = pDR["pDetails"].ToString();
                litPriceTop.Text = decimal.Parse(pDR["pPriceTop"].ToString()).ToString("F2");
                litPriceTop2.Text = litPriceTop.Text;
                litPriceTop11.Text = pDR["pPriceTop"].ToString();
                if(pDR["saletypeid"].ToString()=="1")
                {
                    pannelAccount.Visible = true;
                    Query q1=new Query("gAccountInfo");
                    q1.AddWhere("pnkid", Request["pnkid"]);
                    q1.SetSelectList("AccountPassport,AccountMail,AccountYellowpage,AccountTimeReg,AccountTimeEnd,AccountTimeLastlogin");
                    IDataReader dr1 = q1.ExecuteReader();
                    if (dr1.Read())
                    {
                        litAccountPassPort.Text = dr1[0].ToString()=="True"?"是":"否";
                        litAccountMail.Text = dr1[1].ToString() == "True" ? "是" : "否";
                        litAccountYellowPage.Text = dr1[2].ToString() == "True" ? "是" : "否";
                        litAccountTimeReg.Text = dr1[3].ToString();
                        litAccountTimeEnd.Text = dr1[4].ToString();
                        litAccountTimeLastLogin.Text = dr1[5].ToString();
                    }
                }
                litProductsPromise.Text = pDR["ProductsPromise"].ToString();
                litPriceStep.Text = pDR["pPriceStep"].ToString();

                //显示当前价格
                string pricenow =
                    Convert.ToString(GOrderInfo.Query().WHERE("pnkid", Request["pnkid"]).SetTop("1").SetSelectList("pricenow").ORDER_BY("pricenow desc").
                        ExecuteScalar());
                if(pricenow=="")
                {
                    pricenow = pDR["ppricebase"].ToString();
                }
                CompareValidator1.ValueToCompare = (double.Parse(pricenow) + double.Parse(litPriceStep.Text)).ToString();
                litPriceNow4.Text = (double.Parse(pricenow) + double.Parse(litPriceStep.Text)).ToString("F2");
                litPriceNow22.Text = decimal.Parse(pricenow).ToString();
                pricenow = decimal.Parse(pricenow).ToString("F2");
                litPriceNow1.Text = pricenow;
                litPriceNow2.Text = pricenow;
                litPriceNow3.Text = pricenow;
                

                //浏览次数+1
                GProduct gProduct=new GProduct("pnkid",Request["Pnkid"]);
                gProduct.IsHits = gProduct.IsHits.Value + 1;
                gProduct.Save();

                //留言板列表
                Query msgQ = ProductsMessageInfo.Query();
                msgQ.QueryType = QueryType.Select;
                msgQ.AddWhere("pnkid", Request["pnkid"]);
                msgQ.ORDER_BY("pmsgid desc");
                msgQ.PageIndex = Request["p"]==null?1:int.Parse(Request["p"]);
                msgQ.PageSize = 10;
                Repeater2.DataSource = msgQ.ExecuteReader();
                Repeater2.DataBind();

                for(int i = 1 ;i<= Tools.GetPageCount(msgQ.GetRecordCount(),msgQ.PageSize);i++)
                {
                    if(i==msgQ.PageIndex)
                    {
                        litPageNum.Text = litPageNum.Text + "<a href=ProductDetails.aspx?pnkid=" + Request["pnkID"] +
                                          "&p=" +
                                          i + " class='focus'><span>" + i + "</span></a>";
                    }
                    else
                    {
                        litPageNum.Text = litPageNum.Text + "<a href=ProductDetails.aspx?pnkid=" + Request["pnkID"] +
                                          "&p=" +
                                          i + "><span>" + i + "</span></a>";  
                    }
                }
                
                //登陆状态判断
                if(Tools.ChkStatus())
                {
                    panelLogin.Visible = false;
                }
                else
                {
                    panelLogin.Visible = true;
                    imgBTNMessageSubMit.Enabled = false;
                    HyperLink1.NavigateUrl = "~/login.aspx";
                    HyperLink2.NavigateUrl = "~/reg.aspx";
                }
            }
            
        }
        Page.Title = "编号：" + Request["pnkiD"] + " " + litProductTitle.Text;

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        DateTime dt = DateTime.Parse(litTimeLeft2.Text);
        TimeSpan ts = dt - DateTime.Now;
        if(ts.Seconds<=-1)
        {
            litTimeLeft.Text = "已过期";
        }
        else
        {
            litTimeLeft.Text = ts.Days.ToString() + "天" + ts.Hours.ToString() + "小时" + ts.Minutes.ToString() + "分"+ts.Seconds.ToString()+"秒";
        }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }
    protected void imgBTNSubMit_Click(object sender, ImageClickEventArgs e)
    {   
        LitError.Text = "";
        //验证登陆状态
        if(Tools.ChkStatus())
        {
            //验证登陆账户是否被封禁
            if(Cookies.getCookies("cisBlock")!="0")
            {
                LitError.Text = Tools.Error("您的账户已被封，请联络管理员开通！") + Tools.jsRedirect("login.aspx");
                Response.End();
            }
            //验证商品状态
            if(GProduct.Query().WHERE("pnkid="+Request["pnkid"]).SetSelectList("StatusID").WHERE("SaleMethodID",Comparison.NotEquals,Dictionary.SaleMethodID[3]).ExecuteScalar().ToString()!="1")
            {
                string err =
                    VwProductsBaseDetail.Query()
                    .SetSelectList("ProductsStatus")
                    .WHERE("pnkID=" + Request["pnkid"])
                    .ExecuteScalar().ToString();
                LitError.Text = Tools.Error("该商品已经" + err) + Tools.jsRedirect(Request.Url.ToString());
                Response.End();
            }
            //开始处理竞拍逻辑
            Query q = new Query(GOrderInfo.Schema);
            q.SetSelectList("priceAgent,ID");
            q.SetTop("1");
            q.ORDER_BY("priceNow desc");
            q.AddWhere("pnkID", Request["pnkid"]);
            decimal Pricemy = decimal.Parse(tbMyPrice.Text);
            decimal PriceNow = decimal.Parse(litPriceNow22.Text);
            decimal PriceStep = decimal.Parse(litPriceStep.Text);
            decimal PriceTop = decimal.Parse(litPriceTop11.Text);
            if (q.GetRecordCount() == 0)
            {
                //插入新纪录
                if (Pricemy >= PriceNow)
                {
                    if(Pricemy>=PriceTop)
                    {
                        LitError.Text = Tools.Error("您的出价已经超过一口价，请直接以一口价购买!") + Tools.jsRedirect(Request.UrlReferrer.ToString());
                    }
                    else
                    {
                        decimal myMoney = Money.AccountCPrice(int.Parse(Cookies.getCookies("cUid")),
                                                              Dictionary.MoneyType[1]);
                        if(myMoney<Money.YaJin(1))
                        {
                            LitError.Text = Tools.Error("账务余额不足，请充值！") + Tools.jsRedirect(Request.UrlReferrer.ToString());
                            Response.End();
                        }

                        decimal orderNumber = Tools.CreateNum();
                        GOrderInfo g = new GOrderInfo();
                        g.UID = int.Parse(Cookies.getCookies("cUID"));
                        g.Pnkid = decimal.Parse(Request["pnkID"]);
                        g.OrderNumber = orderNumber;
                        g.OrderType = 2; //2-领先
                        //g.OrderStatus = 2;
                        g.PriceNow = PriceNow;
                        g.PriceAgent = Pricemy;
                        g.InTime = DateTime.Now;
                        g.Save();
                        
                        //更新gProducts.pPriceNow
                        int u =
                            new Update(GProduct.Schema).Set(GProduct.PPriceNowColumn).EqualTo(PriceNow).Where(
                                GProduct.PnkidColumn).IsEqualTo(Request["pnkid"]).Execute();
                        //押金扣除
                        Money.AccountRecordOprate(int.Parse(Cookies.getCookies("cUid")), orderNumber,
                                                  decimal.Parse(Request["pnkid"]), Dictionary.MoneyType[2],
                                                  Dictionary.PriceType[7], -Money.YaJin(1), "", 
                                                  Dictionary.AccountRecordStatus[5],DateTime.Now);
                        LitError.Text = Tools.Error("出价成功!自动扣除押金" + Money.YaJin(1) + "元") +
                                        Tools.jsRedirect(Request.UrlReferrer.ToString());


                    }
                }
                else
                {
                    LitError.Text = Tools.Error("出价过低！");
                }
            }
            else
            {
                IDataReader dr = q.ExecuteReader();
                dr.Read();
                decimal priceAgent = decimal.Parse(dr[0].ToString());
                if (Pricemy < priceAgent)
                {
                    //我的出价小于代理出价
                    GOrderInfo g = new GOrderInfo();
                    g.UID = int.Parse(Cookies.getCookies("cUID"));
                    g.Pnkid = decimal.Parse(Request["pnkID"]);
                    g.OrderNumber = Tools.CreateNum();
                    g.OrderType = Dictionary.orderType[1]; // 1-出局
                    g.OrderStatus = Dictionary.orderStatus[0];
                    g.PriceNow = Pricemy;
                    g.PriceAgent = Pricemy;
                    g.InTime = DateTime.Now;
                    g.Save();
                    GOrderInfo _g = new GOrderInfo("id", dr[1].ToString());
                    if (Pricemy + PriceStep < priceAgent)
                    {
                        _g.PriceNow = _g.PriceNow + PriceStep;
                    }
                    else
                    {
                        _g.PriceNow = _g.PriceAgent.Value;
                    }
                    _g.InTime = DateTime.Now.AddSeconds(-1);
                    _g.Save();
                }
                else
                {
                    if (Pricemy < PriceTop)
                    {
                        decimal myMoney = Money.AccountCPrice(int.Parse(Cookies.getCookies("cUid")),
                                                              Dictionary.MoneyType[1]);
                        if (myMoney < Money.YaJin(1))
                        {
                            LitError.Text = Tools.Error("账务余额不足，请充值！") + Tools.jsRedirect(Request.UrlReferrer.ToString());
                            Response.End();
                        }

                        //我的出价大于代理出价
                        decimal orderNumber = Tools.CreateNum();
                        GOrderInfo g = new GOrderInfo();
                        g.UID = int.Parse(Cookies.getCookies("cUID"));
                        g.Pnkid = decimal.Parse(Request["pnkID"]);
                        g.OrderNumber = orderNumber;
                        g.OrderType = Dictionary.orderType[2]; //2-领先
                        g.OrderStatus = Dictionary.orderStatus[0];
                        if (Pricemy - priceAgent > PriceStep)
                        {
                            g.PriceNow = priceAgent + PriceStep;
                            //更新gProducts.pPriceNow
                            int u =
                                new Update(GProduct.Schema).Set(GProduct.PPriceNowColumn).EqualTo(priceAgent + PriceStep).Where(
                                    GProduct.PnkidColumn).IsEqualTo(Request["pnkid"]).Execute();

                        }
                        else
                        {
                            g.PriceNow = Pricemy;
                            //更新gProducts.pPriceNow
                            int u =
                                new Update(GProduct.Schema).Set(GProduct.PPriceNowColumn).EqualTo(Pricemy).Where(
                                    GProduct.PnkidColumn).IsEqualTo(Request["pnkid"]).Execute();
                        }
                        g.PriceAgent = Pricemy;
                        g.InTime = DateTime.Now;
                        g.Save();

                        //押金扣除
                        Money.AccountRecordOprate(int.Parse(Cookies.getCookies("cUid")), orderNumber,
                                                  decimal.Parse(Request["pnkid"]), Dictionary.MoneyType[2],
                                                  Dictionary.PriceType[7], -Money.YaJin(1), "", 
                                                  Dictionary.AccountRecordStatus[5], DateTime.Now);

                        //更新之前领先订单为出局
                        GOrderInfo __g = new GOrderInfo("id", dr[1].ToString());
                        __g.PriceNow = __g.PriceAgent.Value;
                        __g.OrderType = Dictionary.orderType[1]; //1-出局
                        __g.InTime = DateTime.Now.AddSeconds(-1);
                        __g.Save();

                        //返还押金
                        Query query = new Query(GOrderInfo.Schema);
                        query.AddWhere("ID", dr[1].ToString());
                        query.SetSelectList("uID,orderNumber");
                        IDataReader drQuery = query.ExecuteReader();
                        if(drQuery.Read())
                        {
                            Money.AccountRecordOprate(int.Parse(drQuery[0].ToString()), decimal.Parse(dr[1].ToString()),
                                                  decimal.Parse(Request["pnkid"]), Dictionary.MoneyType[2],
                                                  Dictionary.PriceType[8], Money.YaJin(1), "", 
                                                  Dictionary.AccountRecordStatus[5], DateTime.Now);
                        }
                        LitError.Text = Tools.Error("出价成功!自动扣除押金" + Money.YaJin(1) + "元") +
                                        Tools.jsRedirect(Request.UrlReferrer.ToString());
                    }
                    else
                    {
                        //出价超过一口价
                        LitError.Text = Tools.Error("您的出价已经超过一口价，请直接以一口价购买!") + Tools.jsRedirect(Request.UrlReferrer.ToString());
                    }
                }
            }
            LitError.Text = Tools.Error("出价成功!")+Tools.jsRedirect(Request.UrlReferrer.ToString());
            
        }
        else
        {
            LitError.Text = Tools.Error("未登录或验证码错误！");
        }
    }
    protected void imgBTNPriceTopSubmit_Click(object sender, ImageClickEventArgs e)
    {
        if(PanelZhongJie.Visible)
        {
            Query q = new Query(VwProductsBaseDetail.Schema);
            q.AddWhere("PNKID", Request["pnkID"]);
            q.AddWhere("SaleMethodID", Dictionary.SaleMethodID[3]);
            q.AddWhere("pFastkey", tbFastKey.Text);
            if(q.GetRecordCount()>0)
            {
                Cookies.addCookies("cFastKey",tbFastKey.Text,0);

                decimal PriceNow = decimal.Parse(litPriceNow22.Text);
                GOrderInfo g = new GOrderInfo();
                g.UID = int.Parse(Cookies.getCookies("cUID"));
                g.Pnkid = decimal.Parse(Request["pnkID"]);
                g.OrderNumber = Tools.CreateNum();
                g.OrderType = Dictionary.orderType[2]; //3-等待付款
                //g.OrderStatus = 2;
                g.PriceNow = PriceNow;
                g.PriceAgent = PriceNow;
                g.InTime = DateTime.Now;
                g.Save();
                Response.Redirect("~/Payorder.aspx?pnkid="+Request["pnkid"]);
            }
        }
        else
        {

            Response.Redirect("~/payorder.aspx?pnkid=" + Request["pnkid"]);
        }
    }
}
