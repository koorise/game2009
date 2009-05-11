using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SubSonic;
using GameDB;

public partial class UserControl_Buyer_GetProduct : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Query q = GOrderInfo.Query().SetSelectList("OrderType").WHERE("uID=" + Cookies.getCookies("cUID")).WHERE("OrderNumber=" + decimal.Parse(Request["ordernum"]));
            string str = SysOrderType.Query().SetSelectList("OrderType").WHERE("OrderTypeID=" + int.Parse(q.ExecuteScalar().ToString())).ExecuteScalar().ToString();
            if (str != "成功")
                Tools.Error("订单状态已经改变，为保护您的帐户安全，当前操作已经取消，请返回列表刷新查看");
            else
                BindPage();
        }
    }

    /// <summary>
    /// 绑定页面元素
    /// </summary>
    protected void BindPage()
    {
        string uid = Cookies.getCookies("cUID");
        object pnkid = GOrderInfo.Query().SetSelectList("pnkid").WHERE("OrderNumber=" + decimal.Parse(Request["ordernum"])).ExecuteScalar();
        //关于卖家的部分
        object uidsells = GProduct.Query().SetSelectList("UserID").WHERE("pnkid",pnkid).ExecuteScalar();
        link_sells.Text = GUserInfo.Query().WHERE("uID", uidsells).SetSelectList("UserName").ExecuteScalar().ToString();
        link_sells.NavigateUrl = "#";
        txt_sellsqq.Text = GProduct.Query().SetSelectList("qq").WHERE("pnkid", pnkid).ExecuteScalar().ToString();
        txt_sellstele.Text = GProduct.Query().SetSelectList("phone").WHERE("pnkid", pnkid).ExecuteScalar().ToString();
        //根据卖方信誉度显示图标
        //GUserInfo.Query().WHERE("uID", uidsells).SetSelectList("isSalerScore").ExecuteScalar()
        string htmcode = "<img src=\"images/ico_lanzuan.gif\" width=\"15\" height=\"13\" align=\"absmiddle\" />";
        htmcode += "<img src=\"images/ico_lanzuan.gif\" width=\"15\" height=\"13\" align=\"absmiddle\" />";
        htmcode += "<img src=\"images/ico_lanzuan.gif\" width=\"15\" height=\"13\" align=\"absmiddle\" />";
        StringBuilder sb = new StringBuilder();
        sb.Append(htmcode);
        Literal lit1 = new Literal();
        lit1.Text = sb.ToString();
        PromisePanel.Controls.Add(lit1);

        //step0
        Tools.FillDropDownList(dropQuestion, "SysQuestion", "0", "请选择问题...");
        link_forget.NavigateUrl = "#";
        link_mail.NavigateUrl = "#";
    }

    protected void GetProductWizard_ActiveStepChanged(object sender, EventArgs e)
    {
        if (GetProductWizard.ActiveStepIndex == 1)
        {
            string uid = Cookies.getCookies("cUID");
            object productcount = GOrderInfo.Query().SetSelectList("ProductCount").WHERE("OrderNumber=" + decimal.Parse(Request["ordernum"])).ExecuteScalar();
            if (Convert.ToInt32(productcount) == 1)
            {
                FormView1.Visible = true;
                FormView2.Visible = false;

                SqlQuery sq = new Select(GOrderInfo.IdColumn.ColumnName, "*").From(GOrderInfo.Schema).InnerJoin(GProduct.Schema).InnerJoin(GAccountInfo.PnkidColumn, GOrderInfo.PnkidColumn);   //关联表
                sq = sq.InnerJoin(SysGame.GameIDColumn, GProduct.GameIDColumn).InnerJoin(SysServer.ServerIDColumn, GProduct.ServerIDColumn).InnerJoin(SysJob.JobIDColumn,GAccountInfo.JobIDColumn).InnerJoin(SysRace.RaceIDColumn,GAccountInfo.RaceIDColumn).InnerJoin(SysFlag.FlagIDColumn,GAccountInfo.FlagIDColumn);    //关联字典
                sq = sq.Where("uID").IsEqualTo(uid);    //条件：订单用户
                sq = sq.And("OrderNumber").IsEqualTo(Request["ordernum"]);  //条件：订单号

                FormView1.DataSource = sq.ExecuteDataSet().Tables[0].DefaultView;
                FormView1.DataBind();
            }
            else
            {
                FormView1.Visible = false;
                FormView2.Visible = true;

                SqlQuery sq = new Select(GOrderInfo.IdColumn.ColumnName, "*").From(GOrderInfo.Schema).InnerJoin(GProduct.Schema);   //关联表
                sq = sq.InnerJoin(SysGame.GameIDColumn, GProduct.GameIDColumn).InnerJoin(SysServer.ServerIDColumn, GProduct.ServerIDColumn).InnerJoin(SysJob.JobIDColumn, GAccountInfo.JobIDColumn).InnerJoin(SysRace.RaceIDColumn, GAccountInfo.RaceIDColumn).InnerJoin(SysFlag.FlagIDColumn, GAccountInfo.FlagIDColumn);    //关联字典
                sq = sq.Where("uID").IsEqualTo(uid);    //条件：订单用户
                sq = sq.And("OrderNumber").IsEqualTo(Request["ordernum"]);  //条件：订单号

                FormView2.DataSource = sq.ExecuteDataSet().Tables[0].DefaultView;
                FormView2.DataBind();
            }
        }
    }

    protected void GetProductWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 0)
        {
            //检查是否登录
            if (!Tools.ChkStatus())
                Tools.jsRedirect("~/Login.aspx");
            string uid = Cookies.getCookies("cUID"); ;
            if (!Tools.CheckQuestion(uid,dropQuestion.SelectedValue,txtAnswer.Text))
            {
                txtAlert.Text = "密保或答案输入错误";
                e.Cancel = true;
            }
        }
    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        DataRowView drv = (DataRowView)FormView1.DataItem;
        //
    }

    protected void FormView2_DataBound(object sender, EventArgs e)
    {
        DataRowView drv = (DataRowView)FormView2.DataItem;
        Query q = GAccountInfo.Query().WHERE("pnkid", drv["pnkid"]);
        DataTable dt = q.ExecuteDataSet().Tables[0].Copy();

        Panel ProductPanel = (Panel)FormView2.Row.FindControl("ProductPanel");                                        
        string htmcode = "<table width=\"100%\" border=\"0\" cellpadding=\"10\" cellspacing=\"1\" bgcolor=\"#A6E1FD\">";
        for (int i = 0; i < q.GetRecordCount(); i++)
        {
            htmcode += "<tr><td bgcolor=\"#D7ECFF\">"+i.ToString()+"号 "+dt.Rows[i]["AccountName"].ToString()+"</td></tr>";
            htmcode += "<tr><td bgcolor=\"#F6FBFF\" class=\"hui\">游戏账号： " + dt.Rows[i]["AccountName"].ToString() + Environment.NewLine + "游戏密码： " + dt.Rows[i]["AccountPassWD"].ToString() + Environment.NewLine +"处理结果： 正确</td></tr>";
        }
        htmcode += "</table>";
        StringBuilder sb = new StringBuilder();
        sb.Append(htmcode);
        Literal lit1 = new Literal();
        lit1.Text = sb.ToString();
        ProductPanel.Controls.Add(lit1);
    }

    protected void btn_backlist_Click(object sender, EventArgs e)
    {
        Tools.jsRedirect("~/Buyer_Fin.aspx");
    }

}
