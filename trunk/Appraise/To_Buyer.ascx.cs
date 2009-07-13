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
using GameDB;
using SubSonic;

public partial class Appraise_To_Buyer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Query q = new Query(VwAppaiseToSaler.Schema);
        q.SetSelectList("salername,ptitle,saleruserid");
        q.AddWhere(VwAppaiseToSaler.Columns.Pnkid, Request["PNKID"]);
        q.AddWhere(VwAppaiseToSaler.Columns.SalerUserID, Cookies.getCookies("cUid"));
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

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Query q = new Query(VwAppaiseToSaler.Schema);
        q.SetSelectList("ordernumber");
        q.AddWhere(VwAppaiseToSaler.Columns.Pnkid, Request["PNKID"]);
        q.AddWhere(VwAppaiseToSaler.Columns.SalerUserID, Cookies.getCookies("cUid"));
        if (AppraiseData.Add(decimal.Parse(q.ExecuteScalar().ToString()), 0, 1, TextBox1.Text, 1))
        {
            Response.Redirect("~/default.aspx");
        }
        else
        {
            Response.Redirect("~/Err.aspx");
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Query q = new Query(VwAppaiseToSaler.Schema);
        q.SetSelectList("ordernumber");
        q.AddWhere(VwAppaiseToSaler.Columns.Pnkid, Request["PNKID"]);
        q.AddWhere(VwAppaiseToSaler.Columns.SalerUserID, Cookies.getCookies("cUid"));
        if (AppraiseData.Add(decimal.Parse(q.ExecuteScalar().ToString()), 0, 0, TextBox1.Text, 1))
        {
            Response.Redirect("~/default.aspx");
        }
        else
        {
            Response.Redirect("~/Err.aspx");
        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Query q = new Query(VwAppaiseToSaler.Schema);
        q.SetSelectList("ordernumber");
        q.AddWhere(VwAppaiseToSaler.Columns.Pnkid, Request["PNKID"]);
        q.AddWhere(VwAppaiseToSaler.Columns.SalerUserID, Cookies.getCookies("cUid"));
        if (AppraiseData.Add(decimal.Parse(q.ExecuteScalar().ToString()), 0, -1, TextBox1.Text, 1))
        {
            Response.Redirect("~/default.aspx");
        }
        else
        {
            Response.Redirect("~/Err.aspx");
        }
    }
}
