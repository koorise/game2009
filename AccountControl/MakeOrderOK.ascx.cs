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

public partial class AccountControl_MakeOrderOK : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Query q = new Query(VwOrderInfoForSaler.Schema);
        q.AddWhere("PNKID", Request["pnkid"]);
        q.AddWhere("statusID", 1);
        q.AddWhere("userID", Cookies.getCookies("cUid"));
        q.AddWhere("orderType", 2);
        IDataReader dr = q.ExecuteReader();
        if(q.GetRecordCount()>0)
        {
            dr.Read();
            litUserName.Text = (string) dr["username"];
            litPriceNow.Text = ((decimal) dr["pricenow"]).ToString("F2");
            litAccountNums.Text = (string) dr["pAccountnums"];
            litOrderInTime.Text = (string) dr["orderintime"];
            hyLinkpTitle.Text = (string) dr["pTitle"];
            hyLinkpTitle.NavigateUrl = "~/ProductDetails.aspx?pnkid=" + dr["pnkid"];
            litGameName.Text = (string) dr["gamename"];
            litServerName.Text = (string) dr["servername"];
            litTimeLeft.Text = Tools.TimeLeft((string) dr["pTimeEnd"]);
            litAccountNums2.Text = litAccountNums.Text;
            litPriceNow2.Text = litPriceNow.Text;
            litPriceTop.Text = ((decimal) dr["pPriceTop"]).ToString("F2");
            litPNKID.Text = Request["pnkid"];
            litOrderNumber.Text = (string) dr["ordernumber"];
            litOrderinTime2.Text = litOrderInTime.Text;
            imgOrderTypeStatus.ImageUrl = Dictionary.orderTypeImage((int) dr["ordertype"]);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int i =
            new Update(GOrderInfo.Schema).Set(GOrderInfo.OrderTypeColumn).EqualTo(3).Where(GOrderInfo.PnkidColumn).
                IsEqualTo(Request["pnkid"]).Where(GOrderInfo.OrderTypeColumn).IsEqualTo(2).Execute();
        int t =
            new Update(GProduct.Schema).Set(GProduct.StatusIDColumn).EqualTo(2).Where(GOrderInfo.PnkidColumn).IsEqualTo(
                Request["pnkid"]).Execute();

        Response.Redirect("~/");

    }
}
