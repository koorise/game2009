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

public partial class BianJieTuiGuang_FormatStr : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        foreach (ListItem li in ListBox1.Items)
        {
            if(li.Selected)
            {
                ListItem _li=new ListItem(li.Text,li.Value);
                ListBox2.Items.Add(_li);
            }
        }
        //for (int i = 0; i < ListBox1.Items.Count; i++)
        //{
        //    if(ListBox1.Items[i].Selected)
        //    {
        //        ListBox1.Items.RemoveAt(i);
                
        //    }
        //}
        template();
        ListBox1.SelectedIndex = -1;
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        foreach (ListItem li in ListBox2.Items)
        {
            if (li.Selected)
            {
                ListItem _li = new ListItem(li.Text, li.Value);
                ListBox1.Items.Add(_li);
            }
        }
        for (int i = 0; i < ListBox2.Items.Count; i++)
        {
            if (ListBox2.Items[i].Selected)
            {
                ListBox2.Items.RemoveAt(i);
            }
        }
        template();
        ListBox2.SelectedIndex = -1;
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        if((ListBox2.SelectedIndex!=-1)&&(ListBox2.SelectedIndex!=0))
        {
            ListItem li=new ListItem();
            li.Text = ListBox2.SelectedItem.Text;
            li.Value = ListBox2.SelectedValue;
            int sel = ListBox2.SelectedIndex;
            int prv = ListBox2.SelectedIndex - 1;
            ListBox2.Items.RemoveAt(ListBox2.SelectedIndex);
            ListBox2.Items.Insert(prv,li);
            ListBox2.SelectedIndex = prv;
        }
        ListBox2.SelectedIndex = -1;
        template();
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        if ((ListBox2.SelectedIndex != -1) && (ListBox2.SelectedIndex != ListBox2.Items.Count-1))
        {
            ListItem li = new ListItem();
            li.Text = ListBox2.SelectedItem.Text;
            li.Value = ListBox2.SelectedValue;
            int sel = ListBox2.SelectedIndex;
            int next = ListBox2.SelectedIndex + 1;
            ListBox2.Items.RemoveAt(ListBox2.SelectedIndex);
            ListBox2.Items.Insert(next, li);
            ListBox2.SelectedIndex = next;
        }
        ListBox2.SelectedIndex = -1;
        template();
    }
    public void template()
    {
        Literal1.Text = "";
        foreach (ListItem li in ListBox2.Items)
        {
            if(li.Value == "$Br$")
            {
                Literal1.Text = Literal1.Text + "<br>";
            }
            else
            {
                Literal1.Text = Literal1.Text + li.Text;
            }
        }
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        string s = "' '";
        string txt = "";
        foreach (ListItem li in ListBox2.Items)
        {
            switch (li.Value)
            {
                case "$Br$":
                    s = s + "+'<br>'";
                    break;
                case "$TXT1$":
                    s = s + "+'"+ TextBox1.Text +"'";
                    break;
                case "$TXT2$":
                    s = s + "+'" + TextBox2.Text + "'";
                    break;
                case "$Url":
                    s = s + "'http://www.uc1z.com/productdetails.aspx?pnkid='+convert(varchar(20),PNKID)";
                    break;
                default :
                    s = s + "+" + li.Text ;
                    txt = txt + li.Text + "+";
                    break;
            }
            s = s + " as CopyInfo";
        }
        Cookies.addCookies("cFormatStr",s,0);
        Cookies.addCookies("cFormatStr1",TextBox1.Text,0);
        Cookies.addCookies("cFormatStr2",TextBox2.Text,0);
        Cookies.addCookies("cFormatStr3",txt,0);
        Response.Redirect("~/");
    }
}
