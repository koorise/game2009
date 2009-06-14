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

public partial class Service_ChargeView : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //初始化
            //订单list初始化
            SqlQuery sqdef = new Select(GAccountForOut.IdColumn.ColumnName, "*").From(GAccountForOut.Schema).InnerJoin(GUserInfo.UIDColumn, GAccountForOut.UserIDColumn).InnerJoin(AdminInfo.CustomerServiceIDColumn, GAccountForOut.ServiceIDColumn).InnerJoin(SysPriceType.IdColumn, GAccountForOut.PriceTypeIDColumn).InnerJoin(SysPriceChannel.PriceChannelIDColumn, GAccountForOut.PriceChannelIDColumn).Where("runningid").IsEqualTo(Request["runningid"]);
            MyOrderList1.DataSource = sqdef.ExecuteDataSet().Tables[0].DefaultView;
            MyOrderList1.DataBind();
            
            Query qc = GAccountForOut.Query().WHERE("runningid=" + Request["runningid"]);

            //订单信息初始化
            object pricechannel = qc.SetSelectList("pricechannel").ExecuteScalar();
            txt_pricechannel.Text = SysPriceChannel.Query().SetSelectList("pricechannelname").WHERE("pricechannelid",pricechannel).ExecuteScalar().ToString();
            txt_aprice.Text = string.Format("{0:C}",qc.SetSelectList("applyprice").ExecuteScalar());
            txt_oprice.Text = string.Format("{0:C}",qc.SetSelectList("operateprice").ExecuteScalar());
            object userid = qc.SetSelectList("userid").ExecuteScalar();
            txt_phone.Text = GUserInfo.Query().SetSelectList("telphone").WHERE("uid", userid).ExecuteScalar().ToString();
            txt_qq.Text = GUserInfo.Query().SetSelectList("qq").WHERE("uid", userid).ExecuteScalar().ToString();

            //账户信息初始化
            object idx = GAccountRecord.Query().WHERE("UserID", userid).GetMax("id");
            txt_cprice.Text = string.Format("{0:C}", GAccountRecord.Query().SetSelectList("cPrice").WHERE("id", idx).ExecuteScalar());
            //edit

            //处理结果初始化
            object pricestatus = qc.SetSelectList("isstatus").ExecuteScalar();
            if (pricestatus.ToString() == "1")
            {
                //未处理的显示
                MultiView1.ActiveViewIndex = 1;
                btn_apply.Visible = true;
                btn_back.Visible = false;
                txt_price.Text = string.Format("{0:C}", qc.SetSelectList("operateprice").ExecuteScalar());
            }
            else
            {
                //已处理的显示
                MultiView1.ActiveViewIndex = 0;
                btn_apply.Visible = false;
                btn_back.Visible = true;
                txt_fstatus.Text = "";
                txt_fprice.Text = "";
                txt_frunningnum.Text = "";
                txt_fbak.Text = "";
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
                if (Convert.ToDecimal(drv["operateprice"]) > 0)
                    txt_status.Text = "处理完毕";
                else
                    txt_status.Text = "失败";
            }
            else if (drv["isstatus"].ToString() == "3")
            {
                txt_status.Text = "已撤销";
            }
            else
            {
                txt_status.Text = "等待支付";
            }
        }
    }


    protected void btn_apply_Click(object sender, EventArgs e)
    {
        Query q = GAccountForOut.Query().WHERE("runningid='" + Request["runningid"] + "'");
        q.AddUpdateSetting("runningnum", txt_runningnum.Text);
        if (sel_fin.SelectedValue == "success")
        {
            q.AddUpdateSetting("operateprice", txt_operateprice.Text);
        }
        else
        {
            q.AddUpdateSetting("operateprice", 0);
        }
        q.AddUpdateSetting("fintime", DateTime.Now);
        q.AddUpdateSetting("isstatus", 2).Execute();    //状态更新 -- 完毕
        //状态更新完毕
    }

    protected void btn_back_Click(object sender, EventArgs e)
    {
        Tools.jsRedirect("ChargeCashList.aspx");
    }

}
