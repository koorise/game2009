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

public partial class AccountControl_AccountAddDone : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink1.Text = Request["pID"];
    }
}
