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

public partial class AccountControl_Saler_Order : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Query q = new Query(VwOrderInfoForSaler.Schema);
        q.AddWhere("PNKID", Request["pnkid"]);
        q.AddWhere("userID", Cookies.getCookies("cUid"));
        q.AddWhere("orderType", Comparison.GreaterThan, 1);
        IDataReader dr = q.ExecuteReader();
        if(q.GetRecordCount()>0)
        {
            dr.Read();
            hyLink_lingXian.Text = dr["username"].ToString();
            hyLink_lingXian.NavigateUrl = "~/userCred.aspx?uID=" + dr["uID"];
            litMoney.Text = ((decimal) dr["pricenow"]).ToString("C");
            litAccountNums.Text = dr["pAccountNums"].ToString();
            litOrderinTIme.Text = dr["orderintime"].ToString();
            hyProductDetails.Text = dr["ptitle"].ToString();
            hyProductDetails.NavigateUrl = "~/ProductDetails.aspx?pnkID=" + Request["pnkid"];
            litGame.Text = dr["gamename"].ToString();
            litServer.Text = dr["servername"].ToString();
            litSaleType.Text = dr["saletype"].ToString();
            hyBuyersUsername.Text = hyLink_lingXian.Text;
            litTimeLeft.Text = Tools.TimeLeft(dr["ptimeend"].ToString());
            litProductDetails.Text = dr["pDetails"].ToString();
            litProductPromise.Text = dr["productspromise"].ToString();
            litAccountNums2.Text = litAccountNums.Text;
            litPriceNow.Text = litMoney.Text;
            litPricePer.Text = ((decimal) dr["pricenow"]/(decimal) dr["pAccountNums"]).ToString("C");
            litOrderNumber.Text = dr["orderNumber"].ToString();
            litPNKID.Text = Request["pnkid"];
            litOrderInTime2.Text = litOrderinTIme.Text;
            imgOrderType.ImageUrl = Dictionary.orderTypeImage((int) dr["ordertype"]);

            litPassPort.Text = (bool)dr["isPassport"] ? "是" : "否";
            litmail.Text = (bool)dr["ismail"] ? "是" : "否";
            litYellowPage.Text = (bool)dr["isYellow"] ? "是" : "否";
            // 批量 没有此项。
            if((int) dr["saletypeid"]==1)
            {
                Query _q=new Query(GAccountInfo.Schema);
                _q.AddWhere("pnkid", Request["pnkid"]);
                IDataReader _dr = _q.ExecuteReader();
                _dr.Read();
                litTimeReg.Text = (string) _dr["AccountTimeReg"];
                litTimeLastLogin.Text = (string) _dr["AccountTimeLastlogin"];
                litTimeEnd.Text = (string) _dr["AccountTimeEnd"];
            }
            int orderStatus = (int) dr["ordertype"];
            switch (orderStatus)
            {
                case 2://领先
                    pnl_0_1.Visible = true;
                    break;
                case 3://等待付款
                    pnl_0_2.Visible = true;
                    break;
                case 4:
                    pnl_0_3.Visible = true;
                    break;
                case 5:
                    pnl_0_4.Visible = true;
                    break;
                case 6:
                    pnl_0_5.Visible = true;
                    break;
                case 7:
                    pnl_0_6.Visible = true;
                    break;
                case 8:
                    pnl_0_7.Visible = true;
                    break;
                    default:
                    break;
            }
        }
    }
}
