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
using GameDB;
using SubSonic;

public partial class AccountControl_AccountAdd : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            lblPNKID.Text = Tools.CreateNum().ToString();
            Tools.FillDropDownList(ddlGame, "sysGame", "", "请选择游戏");
            
            //加价幅度增加 1-50元
            ddlPriceStep.Items.Clear();
            for(int i=1;i<=50;i++)
            {
                ListItem li=new ListItem(i+"元",i.ToString());
                ddlPriceStep.Items.Add(li);
            }
        }
        PanelShow();
    }
    protected void PanelShow()
    {
        string saleType = rdBtnSaleType.SelectedValue.ToString();
        string saleMethod = rdBtnSaleMethod.SelectedValue.ToString();
        switch (saleType)
        {
             
            case "1": //单个出售
                switch (saleMethod)
                {
                    case "1"://寄售
                        PanelSingleJiShou.Visible = true;
                        PanelPassWD.Visible = true;
                        PanelZhongJie.Visible = false;
                        PanelSingleDanBao.Visible = false;
                        PanelisNum.Visible = false;
                        break;
                    case "2"://担保
                        PanelSingleJiShou.Visible = false;
                        PanelSingleDanBao.Visible = true;
                        PanelPassWD.Visible = false;
                        PanelZhongJie.Visible = false;
                        PanelisNum.Visible = false;
                        break;
                    case "3"://中介
                        PanelSingleJiShou.Visible = true;
                        PanelPassWD.Visible = true;
                        PanelZhongJie.Visible = true;
                        PanelSingleDanBao.Visible = false;
                        PanelisNum.Visible = false;
                        break;
                }
                PanelMulJiShou.Visible = false;
                break;
            case "2": //批量出售
                switch (saleMethod)
                {
                    case "1":
                        PanelSingleJiShou.Visible = false;
                        PanelPassWD.Visible = false;
                        PanelZhongJie.Visible = false;
                        PanelMulJiShou.Visible = true;
                        PanelSingleDanBao.Visible = false;
                        PanelisNum.Visible = false;
                        break;
                    case "2":
                        PanelSingleJiShou.Visible = false;
                        PanelPassWD.Visible = false;
                        PanelZhongJie.Visible = false;
                        PanelMulJiShou.Visible = false;
                        PanelSingleDanBao.Visible = false;
                        PanelisNum.Visible = true;
                        break;
                    case "3":
                        PanelSingleJiShou.Visible = false;
                        PanelPassWD.Visible = false;
                        PanelZhongJie.Visible = true;
                        PanelMulJiShou.Visible = true;
                        PanelSingleDanBao.Visible = false;
                        PanelisNum.Visible = false;
                        break;
                }
                break;
        }
    }
    protected void ddlGame_SelectedIndexChanged(object sender, EventArgs e)
    {
        Tools.FillDropDownList(ddlServer,"sysServer","","服务器","GameID",ddlGame.SelectedValue.ToString());
        Tools.FillDropDownList(ddlJob, "sysJob", "", "职业", "GameID", ddlGame.SelectedValue.ToString());
        Tools.FillDropDownList(ddlLevel, "sysFlag", "", "等级", "GameID", ddlGame.SelectedValue.ToString());
        Tools.FillDropDownList(ddlRace,"sysRace","","种族","GameID",ddlGame.SelectedValue.ToString());
    }
    protected void rBTNAccountPassPort2_SelectedIndexChanged(object sender, EventArgs e)
    {
        PanelAccountPassPort.Visible = rBTNAccountPassPort2.SelectedValue == "true";
    }
    protected void rBTNAccountMail2_SelectedIndexChanged(object sender, EventArgs e)
    {
        PanelAccountMail.Visible = rBTNAccountMail2.SelectedValue == "true";
    }
    protected void rBTNAccountYellowPage2_SelectedIndexChanged(object sender, EventArgs e)
    {
        PanelAccountYellowPage.Visible = rBTNAccountYellowPage2.SelectedValue=="true";
    }
    protected void btnAccountDisplayChk2_Click(object sender, EventArgs e)
    {
        lblChkResult2.Text = "OK";
    }
    protected void rdBtnSaleType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnAddAccount_Click(object sender, EventArgs e)
    {
        GAccountInfo g = new GAccountInfo();
        g.UserID = int.Parse(Cookies.getCookies("cUID"));
        g.Pnkid = decimal.Parse(lblPNKID.Text);
        g.AccountName = tbAccountName3.Text;
        g.AccountPassWD = tbAccountPassWD3.Text;
        g.AccountPassport = false;
        g.AccountMail = false;
        g.AccountYellowPage = false;
        g.AccountisDisplay = 0;
        g.Save();
        tbAccountName3.Text = "";
        tbAccountName33.Text = "";
        tbAccountPassWD3.Text = "";
        tbAccountPassWD33.Text = "";
        DataList1.DataBind();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName=="ShanChu")
        {
            GAccountInfo.Delete("ID", e.CommandArgument.ToString());
            DataList1.DataBind();
        }
    }
    protected void btnSub_Click(object sender, EventArgs e)
    {
        string saleType = rdBtnSaleType.SelectedValue.ToString();
        string saleMethod = rdBtnSaleMethod.SelectedValue.ToString();

        GProduct g = new GProduct();
        g.Pnkid = decimal.Parse(lblPNKID.Text);
        g.GameID = int.Parse(ddlGame.SelectedValue);
        g.ServerID = int.Parse(ddlServer.SelectedValue);
        g.JobID = int.Parse(ddlJob.SelectedValue);
        g.RaceID = int.Parse(ddlRace.SelectedValue);
        g.FlagID = int.Parse(ddlLevel.SelectedValue);
        g.UserID = int.Parse(Cookies.getCookies("cUID"));
        g.PTitle = tbTitle.Text;
        g.SaleMethodID = int.Parse(saleMethod);
        g.SaleTypeID = int.Parse(saleType);
        g.StatusID = 1;
        g.PDetails = tbProductDetail.Text;
        g.PTimeStart = DateTime.Now;
        g.PTimeEnd = DateTime.Now.AddHours(double.Parse(tbHours.Text));
        g.PPriceBase = decimal.Parse(tbPriceBase.Text);
        g.PPriceTop = decimal.Parse(tbPriceTop.Text);
        g.PPriceStep = int.Parse(ddlPriceStep.SelectedValue);
        g.PPriceNow = decimal.Parse(tbPriceBase.Text);
        g.PPromise = bool.Parse(rdBtnChengXin.Text);
        g.PFastKey = tbFastKey1.Text;
        g.CustomerServiceID = 0;
        g.IsHits = 0;
        g.ProductsPromise = tbPromise.Text;
        switch (saleType)
        {

            case "1": //单个出售
                g.PAccountNums = 1;
                GAccountInfo ga = new GAccountInfo();
                ga.UserID = int.Parse(Cookies.getCookies("cUID"));
                ga.Pnkid = decimal.Parse(lblPNKID.Text);
                ga.GameID = int.Parse(ddlGame.SelectedValue);
                ga.ServerID = int.Parse(ddlServer.SelectedValue);
                ga.JobID = int.Parse(ddlJob.SelectedValue);
                ga.RaceID = int.Parse(ddlRace.SelectedValue);
                ga.FlagID = int.Parse(ddlLevel.SelectedValue);
                switch (saleMethod)
                {
                    case "1"://寄售
                        ga.AccountName = tbAccountName2.Text;
                        ga.AccountPassWD = tbAccountPassWD2.Text;
                        ga.AccountRoleName = tbAccountRoleName2.Text;
                        ga.AccountTimeReg = DateTime.Parse(tbAccountTimeReg2.Text);
                        ga.AccountTimeEnd = DateTime.Parse(tbAccountTimeEnd2.Text);
                        ga.AccountTimeLastLogin = DateTime.Parse(tbAccountTimeLastLogin2.Text);
                        ga.AccountPassport = bool.Parse(rBTNAccountPassPort2.SelectedValue);
                        ga.AccountPassportQuestion = tbAccountPassPortQuestion2.Text;
                        ga.AccountPassportAnswer = tbAccountPassPortAnswer2.Text;
                        ga.AccountMail = bool.Parse(rBTNAccountMail2.SelectedValue);
                        ga.AccountMailAddress = tbAccountMailAddress2.Text;
                        ga.AccountMailPassWD = tbAccountMailPassWD2.Text;
                        ga.AccountMailInfo = tbAccountMailInfo2.Text;
                        ga.AccountYellowPage = bool.Parse(rBTNAccountYellowPage2.SelectedValue);
                        if (bool.Parse(rBTNAccountYellowPage2.SelectedValue))
                        {
                            ga.AccountYellowPageURL = Tools.UpLoadImagesURL(FileUpload2,"~/Upload/","jpg","gif","jpeg");
                        }
                        ga.AccountisDisplay = 0;
                        break;
                    case "2"://担保
                        ga.AccountTimeReg = DateTime.Parse(tbAccountTimeReg1.Text);
                        ga.AccountTimeEnd = DateTime.Parse(tbAccountTimeEnd1.Text);
                        ga.AccountTimeLastLogin = DateTime.Parse(tbAccountTimeLastLogin1.Text);
                        ga.AccountPassport = bool.Parse(rBTNAccountPassPort1.SelectedValue);
                        ga.AccountMail = bool.Parse(rBTNAccountMail1.SelectedValue);
                        ga.AccountYellowPage = bool.Parse(rBTNAccountYellowPage1.SelectedValue);

                        break;
                    case "3"://中介
                        ga.AccountName = tbAccountName2.Text;
                        ga.AccountPassWD = tbAccountPassWD2.Text;
                        ga.AccountRoleName = tbAccountRoleName2.Text;
                        ga.AccountTimeReg = DateTime.Parse(tbAccountTimeReg2.Text);
                        ga.AccountTimeEnd = DateTime.Parse(tbAccountTimeEnd2.Text);
                        ga.AccountTimeLastLogin = DateTime.Parse(tbAccountTimeLastLogin2.Text);
                        ga.AccountPassport = bool.Parse(rBTNAccountPassPort2.SelectedValue);
                        ga.AccountPassportQuestion = tbAccountPassPortQuestion2.Text;
                        ga.AccountPassportAnswer = tbAccountPassPortAnswer2.Text;
                        ga.AccountMail = bool.Parse(rBTNAccountMail2.SelectedValue);
                        ga.AccountMailAddress = tbAccountMailAddress2.Text;
                        ga.AccountMailPassWD = tbAccountMailPassWD2.Text;
                        ga.AccountMailInfo = tbAccountMailInfo2.Text;
                        ga.AccountYellowPage = bool.Parse(rBTNAccountYellowPage2.SelectedValue);
                        if (bool.Parse(rBTNAccountYellowPage2.SelectedValue))
                        {
                            ga.AccountYellowPageURL = Tools.UpLoadImagesURL(FileUpload2, "~/Upload/", "jpg", "gif", "jpeg");
                        }
                        ga.AccountisDisplay = 0;
                        break;
                }
                ga.Save();
                PanelMulJiShou.Visible = false;
                break;
            case "2": //批量出售
                switch (saleMethod)
                {
                    case "1"://寄售
                        Query q = new Query(GAccountInfo.Schema);
                        q.AddWhere("PNKID", lblPNKID.Text);
                        g.PAccountNums = q.GetRecordCount();
                        break;
                    case "2"://担保
                        g.PAccountNums = int.Parse(tbisNum.Text);
                        break;
                    case "3"://中介
                        Query _q = new Query(GAccountInfo.Schema);
                        _q.AddWhere("PNKID", lblPNKID.Text);
                        g.PAccountNums = _q.GetRecordCount();
                        break;
                }
                break;
        }
        g.Save();
        Response.Redirect("~/AccountAddDone.aspx?pNKID=" + lblPNKID.Text);
    }
}
