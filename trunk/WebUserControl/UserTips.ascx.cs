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

public partial class WebUserControl_UserTips : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Query _q = new Query(GUserInfo.Schema);
        //_q.SetSelectList("username");
        _q.AddWhere("uID", _uID);
        IDataReader uDr = _q.ExecuteReader();
        if (uDr.Read())
        {
            hyLinkUserName.Text = uDr["username"].ToString();
            hyLinkUserName.NavigateUrl = "~/" + _uID;

            litisBuyerPer.Text = string.Format("{0:0.00%}", decimal.Parse(uDr["isBuyerPer"].ToString()));
            litisBuyerScores.Text = uDr["isBuyerScores"].ToString();
            litisSalerPer.Text = string.Format("{0:0.00%}", decimal.Parse(uDr["isSalerper"].ToString()));
            litisSalerScores.Text = uDr["isSalerScores"].ToString();
            litInTime.Text = DateTime.Parse(uDr["inTime"].ToString()).ToShortDateString();
        }
    }

    private int _uID;
    public int uID
    { 
        get
       {
           return  _uID;
       }
        set
        {
            _uID = value;
        }
       
    }
}
