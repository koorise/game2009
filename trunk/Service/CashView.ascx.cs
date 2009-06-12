﻿using System;
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

public partial class Service_CashView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //初始化
            SqlQuery sqdef = new Select(GAccountForOut.IdColumn.ColumnName, "*").From(GAccountForOut.Schema).InnerJoin(GUserInfo.UIDColumn, GAccountForOut.UserIDColumn).InnerJoin(AdminInfo.CustomerServiceIDColumn, GAccountForOut.ServiceIDColumn).InnerJoin(SysPriceType.IdColumn, GAccountForOut.PriceTypeIDColumn).InnerJoin(SysPriceChannel.PriceChannelIDColumn, GAccountForOut.PriceChannelIDColumn).Where("runningid").IsEqualTo(Request["runningid"]);
            MyOrderList1.DataSource = sqdef.ExecuteDataSet().Tables[0].DefaultView;
            MyOrderList1.DataBind();

            Query qc = GAccountForOut.Query().WHERE("runningid=" + Request["runningid"]);

            object pricechannel = qc.SetSelectList("pricechannel").ExecuteScalar();
            txt_pricechannel.Text = SysPriceChannel.Query().SetSelectList("pricechannelname").WHERE("pricechannelid", pricechannel).ExecuteScalar().ToString();
            txt_aprice.Text = string.Format("{0:C}", qc.SetSelectList("applyprice").ExecuteScalar());
            txt_oprice.Text = string.Format("{0:C}", qc.SetSelectList("operateprice").ExecuteScalar());
            txt_sprice.Text = decimal.Subtract(Convert.ToDecimal(qc.SetSelectList("operateprice").ExecuteScalar()), Convert.ToDecimal(qc.SetSelectList("applyprice").ExecuteScalar())).ToString("0.00");
            object userid = qc.SetSelectList("userid").ExecuteScalar();
            object idx = GAccountRecord.Query().WHERE("UserID", userid).GetMax("id");
            txt_cprice.Text = string.Format("{0:C}", GAccountRecord.Query().SetSelectList("cPrice").WHERE("id", idx).ExecuteScalar());
            object pricestatus = qc.SetSelectList("isstatus").ExecuteScalar();
            if (pricestatus.ToString() == "1")
            {
                MultiView1.ActiveViewIndex = 1;
                btn_apply.Visible = true;
                btn_back.Visible = false;
                txt_price.Text = string.Format("{0:C}", qc.SetSelectList("operateprice").ExecuteScalar());
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
                btn_apply.Visible = false;
                btn_back.Visible = true;
            }
        }
    }

    protected void MyOrderList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataRowView drv = (DataRowView)e.Item.DataItem;
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label txt_status = (Label)e.Item.FindControl("txt_status");
            if (drv["isstatus"].ToString() == "1")
            {
                txt_status.Text = "处理中";
            }
            else if (drv["isstatus"].ToString() == "2")
            {
                txt_status.Text = "处理完毕";
            }
            else if (drv["isstatus"].ToString() == "3")
            {
                txt_status.Text = "已撤销";
            }
            else
            {
                txt_status.Text = "已填单";
            }
            HyperLink link_view = (HyperLink)e.Item.FindControl("link_view");
            link_view.NavigateUrl = "CashView.aspx";
            link_view.NavigateUrl += "?runningid=" + link_view.Text;
        }
    }


    protected void btn_apply_Click(object sender, EventArgs e)
    {
        Query q = GAccountForOut.Query().WHERE("runningid='" + Request["runningid"] + "'");
        q.AddUpdateSetting("runningnum", txt_runningnum.Text);
        q.AddUpdateSetting("operateprice", txt_operateprice.Text);
        q.AddUpdateSetting("fintime", DateTime.Now);
        q.AddUpdateSetting("isstatus", 2).Execute();    //状态更新 -- 完毕
        //状态更新完毕
    }

    protected void btn_back_Click(object sender, EventArgs e)
    {
        Tools.jsRedirect("ChargeCashList.aspx");
    }

}