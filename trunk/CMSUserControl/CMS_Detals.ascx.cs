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
public partial class CMSUserControl_CMS_Detals : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["UNID"]!=null)
        {
            Query q = new Query(VwCMSHelpList.Schema);
            q.AddWhere(VwCMSHelpList.Columns.Unid, Request["Unid"]);
            IDataReader dr = q.ExecuteReader();
            if(dr.Read())
            {
                HyperLink_BigClass.Text = (string) dr["bigclass"];
                HyperLink_BigClass.NavigateUrl = "~/HelpList.aspx?BID=" + dr["cmsBigclassID"];
                HyperLink_SmallClass.Text = (string) dr["smallclass"];
                HyperLink_SmallClass.NavigateUrl = "~/HelpList.aspx?BID=" + dr["cmsClassID"];
                Literal_title.Text = (string) dr["title"];
                Literal_title2.Text = Literal_title.Text;
                Literal_inTime.Text = ((DateTime) dr["intime"]).ToString("C");
                Literal_Hits.Text = (string) dr["hits"];
                Label_Content.Text = (string) dr["content"];

                CmsHelpList c=new CmsHelpList("unid",Request["unid"]);
                c.Hits = c.Hits + 1;
                c.Save();
            }
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}
