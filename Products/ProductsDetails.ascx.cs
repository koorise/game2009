using System;
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
                Query _q = new Query(GUserInfo.Schema);
                //_q.SetSelectList("username");
                _q.AddWhere("uID", pDR["UserID"].ToString());
                IDataReader uDr = _q.ExecuteReader();
                if(uDr.Read())
                {
                    hyLinkUserName.Text = uDr["username"].ToString();
                    hyLinkUserName.NavigateUrl = "~/" + pDR["UserID"].ToString();

                    litisBuyerPer.Text = string.Format("{0:0.00%}", decimal.Parse(uDr["isBuyerPer"].ToString()));
                    litisBuyerScores.Text = uDr["isBuyerScores"].ToString();
                    litisSalerPer.Text = string.Format("{0:0.00%}", decimal.Parse(uDr["isSalerper"].ToString()));
                    litisSalerScores.Text = uDr["isSalerScores"].ToString();
                    litInTime.Text = DateTime.Parse(uDr["inTime"].ToString()).ToShortDateString();
                }
                litProductTitle.Text = pDR["pTitle"].ToString();
                
                litPNKID.Text = Request["pnkid"];
                litGameName.Text = pDR["gamename"].ToString()+pDR["servername"];
                litStatus.Text = pDR["productsstatus"].ToString();
                litSaleMethod.Text = pDR["salemethod"].ToString();
                litSaleType.Text = pDR["saletype"].ToString();
                litTimeLeft2.Text = pDR["ptimeend"].ToString();
                litProductInTime.Text = pDR["intime"].ToString();
                
                litAccountNums1.Text = pDR["pAccountNums"].ToString();
                litAccountNums2.Text = litAccountNums1.Text;
                litAccountNums3.Text = litAccountNums1.Text;
                tbAccountNums.Text = litAccountNums1.Text;
               
                litViewCount.Text = pDR["ishits"].ToString();
                litProductDetails.Text = pDR["pDetails"].ToString();
                litPriceTop.Text = decimal.Parse(pDR["pPriceTop"].ToString()).ToString("C");
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
                CompareValidator1.ValueToCompare = (double.Parse(pricenow)+10).ToString();
                litPriceNow4.Text = (double.Parse(pricenow) + double.Parse(litPriceStep.Text)).ToString("C");
                litPriceNow22.Text = decimal.Parse(pricenow).ToString();
                pricenow = decimal.Parse(pricenow).ToString("C");
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
            if(GProduct.Query().WHERE("pnkid="+Request["pnkid"]).SetSelectList("StatusID").ExecuteScalar().ToString()!="1")
            {
                string err =
                    VwProductsBaseDetail.Query().SetSelectList("ProductsStatus").WHERE("pnkID=" + Request["pnkid"]).
                        ExecuteScalar().ToString();
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
                        //出价超过一口价
                        GOrderInfo g = new GOrderInfo();
                        g.UID = int.Parse(Cookies.getCookies("cUID"));
                        g.Pnkid = decimal.Parse(Request["pnkID"]);
                        g.OrderNumber = int.Parse(tbAccountNums.Text);
                        g.OrderType = 1;
                        g.OrderStatus = 3;
                        g.PriceNow = PriceTop;
                        g.PriceAgent = Pricemy;
                        g.InTime = DateTime.Now;
                        g.Save();
                        
                        GProduct gProduct=new GProduct("pnkid",Request["pnkID"]);
                        gProduct.StatusID = 2;
                        gProduct.Save();

                        LitError.Text = Tools.Error("竞拍成功,等待付款!") + Tools.jsRedirect(Request.UrlReferrer.ToString());
                    }
                    else
                    {
                        GOrderInfo g = new GOrderInfo();
                        g.UID = int.Parse(Cookies.getCookies("cUID"));
                        g.Pnkid = decimal.Parse(Request["pnkID"]);
                        g.OrderNumber = int.Parse(tbAccountNums.Text);
                        g.OrderType = 1;
                        g.OrderStatus = 1;
                        g.PriceNow = PriceNow;
                        g.PriceAgent = Pricemy;
                        g.InTime = DateTime.Now;
                        g.Save();
                        LitError.Text = Tools.Error("出价成功!") + Tools.jsRedirect(Request.UrlReferrer.ToString());

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
                    g.OrderNumber = int.Parse(tbAccountNums.Text);
                    g.OrderType = 1;
                    g.OrderStatus = 1;
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
                        //我的出价大于代理出价
                        GOrderInfo g = new GOrderInfo();
                        g.UID = int.Parse(Cookies.getCookies("cUID"));
                        g.Pnkid = decimal.Parse(Request["pnkID"]);
                        g.OrderNumber = int.Parse(tbAccountNums.Text);
                        g.OrderType = 1;
                        g.OrderStatus = 1;
                        if (Pricemy - priceAgent > PriceStep)
                        {
                            g.PriceNow = priceAgent + PriceStep;
                        }
                        else
                        {
                            g.PriceNow = Pricemy;
                        }
                        g.PriceAgent = Pricemy;
                        g.InTime = DateTime.Now;
                        g.Save();

                        GOrderInfo __g = new GOrderInfo("id", dr[1].ToString());
                        __g.PriceNow = __g.PriceAgent.Value;
                        __g.InTime = DateTime.Now.AddSeconds(-1);
                        __g.Save();
                    }
                    else
                    {
                        //出价超过一口价
                        GOrderInfo g = new GOrderInfo();
                        g.UID = int.Parse(Cookies.getCookies("cUID"));
                        g.Pnkid = decimal.Parse(Request["pnkID"]);
                        g.OrderNumber = int.Parse(tbAccountNums.Text);
                        g.OrderType = 1;
                        g.OrderStatus = 3;
                        g.PriceNow = PriceTop;
                        g.PriceAgent = Pricemy;
                        g.InTime = DateTime.Now;
                        g.Save();

                        GProduct gProduct = new GProduct("pnkid", Request["pnkID"]);
                        gProduct.StatusID = 2;
                        gProduct.Save();

                        LitError.Text = Tools.Error("竞拍成功,等待付款!") + Tools.jsRedirect(Request.UrlReferrer.ToString());
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
}
