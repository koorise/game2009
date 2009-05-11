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

public partial class UserControl_CustomerService : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPage();
        }
    }

    protected void BindPage()
    {
        object pnkid = GOrderInfo.Query().WHERE("OrderNumber=" + decimal.Parse(Request["ordernum"])).SetSelectList("pnkid").ExecuteScalar();
        object serviceid = GProduct.Query().WHERE("pnkid", pnkid).SetSelectList("CustomerServiceID").ExecuteScalar();
        Query q = AdminInfo.Query().WHERE("CustomerServiceID",serviceid);

        //判断客服白班夜班显示对应qq 未实现
        //
        txt_csname.Text = q.SetSelectList("UserName").ExecuteScalar().ToString();
        txt_dayqq.Text = q.WHERE("DayorNight=day").SetSelectList("qq").ExecuteScalar().ToString();
        txt_nightqq.Text = q.WHERE("DayorNight=night").SetSelectList("qq").ExecuteScalar().ToString();
    }
}
