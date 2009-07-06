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

public partial class CMSUserControl_Left : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Query q = new Query(SysCmsClass.Schema);
        q.AddWhere("orderflag", 0);
        q.ORDER_BY("sortID desc");
        IDataReader dr = q.ExecuteReader();
        while (dr.Read())
        {
            Literal1.Text = Literal1.Text + "<li><a href='/Helplist.aspx?BID="+ dr["cmsClassID"] +"'>"+ dr["classname"] +"</a><ul>";
            Query _q = new Query(SysCmsClass.Schema);
            _q.AddWhere("orderflag",(int) dr["cmsclassID"]);
            _q.ORDER_BY("sortid desc");
            IDataReader _dr= _q.ExecuteReader();
            while (_dr.Read())
            {
                Literal1.Text = Literal1.Text +"<li><a href='/Helplist.aspx?SID'>交易流程</a></li>";
            }
            Literal1.Text = Literal1.Text + "</ul></li>";
        }

    }
}
