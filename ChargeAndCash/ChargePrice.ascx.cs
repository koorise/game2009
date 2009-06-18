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

public partial class ChargeAndCash_ChargePrice : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //初始化

        //根据参数变更当前tab
        if (Request["out_trade_no"] != null)
        {
            Tabs.ActiveTabIndex = 0;
        }
        else if (Request["v_pmode"] != null)
        {
            Tabs.ActiveTabIndex = 2;
        }
        else if (Request["step"] == "confirm")
        {
            string uid = Cookies.getCookies("cUID");
            string pricechannel = GAccountForOut.Query().SetSelectList("pricechannelid").WHERE("runningid='" + Request["runningnum"] + "'").WHERE("userid=" + uid).ExecuteScalar().ToString();
            if (pricechannel == "1")
            {
                Tabs.ActiveTabIndex = 0;
            }
            else if (pricechannel == "2")
            {
                Tabs.ActiveTabIndex = 2;
            }
            else if (pricechannel == "3")
            {
                Tabs.ActiveTabIndex = 1;
            }
        }

        //使非当前tab验证不触发
        //for (int i = 0; i < Tabs.Tabs.Count; i++)
        //{
        //    if (i != Tabs.ActiveTabIndex)
        //    {
        //        Wizard w = (Wizard)Tabs.Tabs[i].Controls[0].Controls[1].FindControl("ChargeWizard");
        //        if (w != null)
        //            w.Enabled = false;
        //    }
        //}
    }

    protected void Tabs_ActiveTabChanged(object sender, EventArgs e)
    {
        //
    }

}
