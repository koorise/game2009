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

public partial class Appraise_SvcPingJia : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Query q = new Query(VwAppaiseToSaler.Schema);
        q.SetSelectList("ordernumber");
        q.AddWhere(VwAppaiseToSaler.Columns.Pnkid, Request["PNKID"]);
        q.AddWhere(VwAppaiseToSaler.Columns.SalerUserID, Cookies.getCookies("cUid"));
        if (q.GetRecordCount() > 0)
        {
            if (
                (AppraiseData.Add(decimal.Parse(q.ExecuteScalar().ToString()), 0,
                                  int.Parse(RadioButtonList1.SelectedValue), TextBox1.Text, 4)) &&
                (AppraiseData.Add(decimal.Parse(q.ExecuteScalar().ToString()), 0,
                                  int.Parse(RadioButtonList2.SelectedValue), TextBox2.Text, 5) &&
                 (AppraiseData.Add(decimal.Parse(q.ExecuteScalar().ToString()), 0,
                                   int.Parse(RadioButtonList3.SelectedValue), TextBox3.Text, 6))))
            {
                Response.Redirect("~/default.aspx");
            }
            else
            {
                Response.Redirect("~/Err.aspx");
            }
        }
        else
        {
            Query _q = new Query(VwAppaiseToSaler.Schema);
            _q.SetSelectList("ordernumber");
            _q.AddWhere(VwAppaiseToSaler.Columns.Pnkid, Request["PNKID"]);
            _q.AddWhere(VwAppaiseToSaler.Columns.UID, Cookies.getCookies("cUid"));
            if (_q.GetRecordCount() > 0)
            {
                if (
                    (AppraiseData.Add(decimal.Parse(_q.ExecuteScalar().ToString()), 1,
                                      int.Parse(RadioButtonList1.SelectedValue), TextBox1.Text, 4)) &&
                    (AppraiseData.Add(decimal.Parse(_q.ExecuteScalar().ToString()), 1,
                                      int.Parse(RadioButtonList2.SelectedValue), TextBox2.Text, 5) &&
                     (AppraiseData.Add(decimal.Parse(_q.ExecuteScalar().ToString()), 1,
                                       int.Parse(RadioButtonList3.SelectedValue), TextBox3.Text, 6))))
                {
                    Response.Redirect("~/default.aspx");
                }
                else
                {
                    Response.Redirect("~/Err.aspx");
                }
            }
        }
    }
}
