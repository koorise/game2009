using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using GameDB;
using SubSonic;

public partial class Appraise_AfterSaled_Commit : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Query q = new Query(VwAppaiseToSaler.Schema);
        q.SetSelectList("salername,ptitle,saleruserid");
        q.AddWhere(VwAppaiseToSaler.Columns.Pnkid, Request["PNKID"]);
        q.AddWhere(VwAppaiseToSaler.Columns.UID, Cookies.getCookies("cUid"));
        if (q.GetRecordCount() > 0)
        {
            IDataReader dr = q.ExecuteReader();
            if (dr.Read())
            {
                HyperLink1.Text = dr[0].ToString();
                HyperLink1.NavigateUrl = "~/ProductDetails.aspx?Pnkid=" + Request["pnkid"];
                HyperLink2.Text = dr[1].ToString();
                HyperLink2.NavigateUrl = "~/UserInfo.aspx?uid=" + dr[2];

            }

        }
    }
    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        Thread.Sleep(400);
        e.CallbackResult = "Update done. Value = " + e.Value + " Tag = " + e.Tag;
    }
    protected void Rating2_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        Thread.Sleep(400);
        e.CallbackResult = "Update done. Value = " + e.Value + " Tag = " + e.Tag;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Query q = new Query(VwAppaiseToSaler.Schema);
        q.SetSelectList("ordernumber");
        q.AddWhere(VwAppaiseToSaler.Columns.Pnkid, Request["PNKID"]);
        q.AddWhere(VwAppaiseToSaler.Columns.UID, Cookies.getCookies("cUid"));
        if ((AppraiseData.Add(decimal.Parse(q.ExecuteScalar().ToString()), 1, int.Parse(Rating1.CurrentRating.ToString()), TextBox1.Text, 2)) && (AppraiseData.Add(decimal.Parse(q.ExecuteScalar().ToString()), 1, int.Parse(Rating2.CurrentRating.ToString()), TextBox1.Text, 3)))
        {
            Response.Redirect("~/default.aspx");
        }
        else
        {
            Response.Redirect("~/Err.aspx");
        }
    }
}
