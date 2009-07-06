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

public partial class CMSUserControl_Search : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["s"]!=null)
        {
            Query q = new Query(CmsHelpList.Schema);
            q.AddWhere(CmsHelpList.TitleColumn.ToString(),
                       Comparison.Like, "%" + Request["s"] + "%").OR(CmsHelpList.ContentColumn.ToString(),
                                                                     Comparison.Like, "%" + Request["s"] + "%");
            q.SetSelectList("title,unid,content");
            int rdc = q.GetRecordCount();
            Label1.Text = rdc.ToString();
            if(rdc>0)
            {
                DataList1.DataSource = Tools.PageDST("spAll_returnrows",
                    q.GetSql(), (Request["p"] == null) ? "1" : Request["p"].ToString(), "10", "UNID", "UNID");
                DataList1.DataBind();
                for(int i=1;i<=rdc;i++)
                {
                    Literal2.Text = Literal2.Text + "<a href='/HelpList.aspx?p=" + i + "&s=" + Request["s"] +
                                    "' class='focus'><span>" + i + "</span></a>";
                }
            }
        }
        Query query = new Query(CmsHelpList.Schema);
        query.SetSelectList("unid,title");
        query.SetTop("10");
        query.ORDER_BY("hits desc");
        Repeater1.DataSource = query.ExecuteDataSet();
        Repeater1.DataBind();
    }
    public string KeyWords(string str)
    {
        return str.Replace(Request["s"], "<font color=red>" + Request["s"] + "</font>").Substring(1,300);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/helpSearch.aspx?p=1&s="+TextBox1.Text);
    }
}
