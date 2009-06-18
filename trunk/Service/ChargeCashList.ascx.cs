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

public partial class Service_ChargeCashList : System.Web.UI.UserControl
{
    protected static int pagesize = 40;
    protected static int currentpage = 1;
    protected SqlQuery sq = new SqlQuery();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Tools.FillDropDownList(sel_type, "syspricetype", "0", "全部");
            Tools.FillDropDownList(sel_channel, "syspricechannel", "0", "全部");
            Tools.FillDropDownList(sel_status, "syschargecashstatus", "0", "全部");

            BindSource("all");
        }

    }

    /// <summary>
    /// 绑定datalist，处理数据源
    /// </summary>
    /// <param name="CommandName">传递的命令参数</param>
    protected void BindSource(string CommandName)
    {
        SqlQuery sqdef = new Select(GAccountForOut.IdColumn.ColumnName, "*").From(GAccountForOut.Schema).InnerJoin(GUserInfo.UIDColumn, GAccountForOut.UserIDColumn).InnerJoin(AdminInfo.CustomerServiceIDColumn, GAccountForOut.ServiceIDColumn).InnerJoin(SysPriceType.IdColumn, GAccountForOut.PriceTypeIDColumn).InnerJoin(SysPriceChannel.PriceChannelIDColumn, GAccountForOut.PriceChannelIDColumn);
        if (CommandName == "all")
        {
            //全部list
            sq = sqdef.And("isstatus").In(1,2);
        }
        else if (CommandName == "doing")
        {
            //待处理的list
            object sqtemp = 1;
            sq = sqdef.And("isstatus").IsEqualTo(sqtemp);
        }
        else if (CommandName == "search")
        {
            //查询结果list
            if (tbStart.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("starttime").IsGreaterThanOrEqualTo(tbStart.Text);
            }
            if (tbEnd.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("starttime").IsLessThanOrEqualTo(tbEnd.Text);
            }
            if (tbStart.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("fintime").IsGreaterThanOrEqualTo(tcStart.Text);
            }
            if (tcEnd.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("fintime").IsLessThanOrEqualTo(tcStart.Text);
            }
            if (sel_channel.SelectedIndex > 0)
            {
                sqdef = sqdef.And("pricechannelid").IsEqualTo(sel_channel.SelectedValue);
            }
            if (sel_status.SelectedIndex > 0)
            {
                sqdef = sqdef.And("isstatus").IsEqualTo(sel_status.SelectedValue);
            }
            if (sel_type.SelectedIndex > 0)
            {
                sqdef = sqdef.And("pricetypeid").IsEqualTo(sel_type.SelectedValue); 
            }
            if (txt_ordernum.Text != string.Empty)
            {
                sqdef = sqdef.And("runningid").IsEqualTo(txt_ordernum.Text);
            }
            if (txt_runningnum.Text != string.Empty)
            {
                sqdef = sqdef.And("runningnum").IsEqualTo(txt_runningnum.Text);
            }
            if (taLow.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("applyprice").IsGreaterThanOrEqualTo(taLow.Text);
            }
            if (taHigh.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("applyprice").IsLessThanOrEqualTo(taHigh.Text);
            }
            if (tfLow.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("operateprice").IsGreaterThanOrEqualTo(tfLow.Text);
            }
            if (tfHigh.Text.Trim() != string.Empty)
            {
                sqdef = sqdef.And("operateprice").IsLessThanOrEqualTo(tfHigh.Text);
            }

            if (txt_username.Text != string.Empty)
            {
                sqdef = sqdef.And("username").IsEqualTo(txt_username.Text);
            }
            if (txt_servicename.Text != string.Empty)
            {
                sqdef = sqdef.And("username1").IsEqualTo(txt_servicename.Text);
            }
            sq = sqdef.And("isstatus").In(1, 2);
        }

        sq = sq.OrderDesc(GAccountForOut.StartTimeColumn.QualifiedName);
        currentpage = 1;
        BindList();
    }

    /// <summary>
    /// 绑定datalist
    /// </summary>
    protected void BindList()
    {
        sq = sq.Paged(currentpage, pagesize);
        MyOrderList1.DataSource = sq.ExecuteDataSet().Tables[0].DefaultView;
        MyOrderList1.DataBind();
    }

    protected void MyOrderList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataRowView drv = (DataRowView)e.Item.DataItem;
        if (e.Item.ItemType == ListItemType.Header)
        {
            //
        }
        else if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
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
            HyperLink link_view = (HyperLink)e.Item.FindControl("link_view");
            if (drv["pricetypeid"].ToString() == "3")
                link_view.NavigateUrl = "ChargeView.aspx";
            else
                link_view.NavigateUrl = "CashView.aspx";
            link_view.NavigateUrl += "?runningid="+link_view.Text;
        }
        else if (e.Item.ItemType == ListItemType.Footer)
        {
            int pc = Tools.GetPageCount(sq.GetRecordCount(), pagesize);
            Label txt_listcount = (Label)e.Item.FindControl("txt_listcount");
            txt_listcount.Text = "物品信息总数：" + sq.GetRecordCount();
            txt_listcount.Text += "    显示总页数：";
            txt_listcount.Text += pc.ToString();

            ImageButton btn_prepage = (ImageButton)e.Item.FindControl("btn_prepage");
            if (currentpage == 1)
                btn_prepage.Enabled = false;
            ImageButton btn_nextpage = (ImageButton)e.Item.FindControl("btn_nextpage");
            if (currentpage == pc)
                btn_nextpage.Enabled = false;

            Panel btnpanel = (Panel)e.Item.FindControl("btnpanel");
            for (int i = currentpage - 3; i <= currentpage + 3; i++)
            {
                if (i < 1)
                    continue;
                else if (i > pc)
                    break;
                Button btn_page = new Button();
                btn_page.ID = "btn_page" + i.ToString();
                btn_page.Text = i.ToString();
                btn_page.CommandName = i.ToString();
                if (i == currentpage)
                {
                    btn_page.CssClass = "focus";
                    btn_page.Enabled = false;
                }
                btn_page.Click += new EventHandler(btn_page_Click);
                btnpanel.Controls.Add(btn_page);
            }
        }
    }

    protected void btn_search_do_Click(object sender, EventArgs e)
    {
        currentpage = 1;
        BindSource("doing");
    }
    
    protected void btn_search_Click(object sender, EventArgs e)
    {
        currentpage = 1;
        BindSource("search");
    }

    protected void btn_page_Click(object sender, EventArgs e)
    {
        //需要修改
        currentpage = 1;
        BindList();
    }
}

