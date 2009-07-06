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
public partial class CMSUserControl_helplist : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Query q = new Query(VwCMSHelpList.Schema);
        if(Request["BID"]!=null)
        {
            q.AddWhere(VwCMSHelpList.Columns.CMSBigClassID, Request["bid"]);
        }
        else
        {
            if(Request["sid"]!=null)
            {
                q.AddWhere(VwCMSHelpList.Columns.CMSClassID, Request["sid"]);
            }
        }
        q.SetSelectList("title,unid");
        if(q.GetRecordCount()>0)
        {
            DataList1.DataSource = q.ExecuteDataSet();
            DataList1.DataBind();
        }
    }
    protected void ImgBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/helpSearch.aspx?p=1&s=" + TextBox1.Text);
    }
}
