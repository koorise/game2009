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
using System.Data.SqlClient;
public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if(!IsPostBack)
         {
             bindRept(1);
             
         }
         for (int i = 1; i < 10; i++)
         {
             Button b = new Button();
             b.ID = i.ToString();
             b.Text = i.ToString();
             b.CommandArgument = i.ToString();
             b.CommandName = "page";
             b.Command += new CommandEventHandler(b_Command);
             PlaceHolder1.Controls.Add(b);
         }
         
        
    }

    void b_Command(object sender, CommandEventArgs e)
    {
        //Response.Write(e.CommandArgument.ToString());
        bindRept(int.Parse(e.CommandArgument.ToString()));
    }

    //protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
        
    //    if(e.Item.ItemType == ListItemType.Footer)
    //    {
    //        for(int i =1;i<10;i++)
    //        {
    //            Button b=new Button();
    //            b.ID = i.ToString();
    //            b.Text = i.ToString();
    //            b.CommandArgument = i.ToString();
    //            b.CommandName = "page";
    //            PlaceHolder pl = (PlaceHolder) e.Item.FindControl("PlaceHolder1");
    //            pl.Controls.Add(b);
    //        }
    //    }
        
    //}
    //protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    //{
    //    if(e.CommandName=="page")
    //    {
    //        bindRept(int.Parse(e.CommandArgument.ToString()));
    //       Response.Redirect("~/default.aspx");
    //    }
    //    else
    //    {
           
    //    }
    //}
    void bindRept(int p)
    {
        Repeater1.DataSource = Tools.PageDST("spAll_returnrows", "select * from sysProvince", p.ToString(), "3",
                                             "provinceID", "provinceID desc");
        Repeater1.DataBind();
    }
}
