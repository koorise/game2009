<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List.ascx.cs" Inherits="BianJieTuiGuang_List" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<div class="main">
    <div class="top" style="margin:0px;">
	    <table width="100%" height="33" border="0" cellpadding="0" cellspacing="0" background="images/posbar_bg1.gif">
                <tr>
                  <td width="37" align="left"><img src="images/posbar_left1.gif" width="41" height="33" /></td>
                  <td width="220" align="center" nowrap="nowrap" background="images/posbar_bg01.gif"><strong>我正在出售的物品 - 便捷推广</strong></td>
                  <td align="left"><img src="images/posbar_middle1.gif" width="24" height="33" /></td>
                  <td align="right"><img src="images/posbar_right.gif" width="9" height="33" /></td>
                </tr>
        </table>
    </div>
	<div style="clear:both;">
			<table width="100%" height="80" border="0" cellpadding="0" cellspacing="0" bgcolor="#F6F6F6" class="btit">
          <tr>
            <td width="374" valign="top" style="border-right:1px solid #DFDFDF"><label>
                <asp:CheckBox ID="CheckBox1" Text="全选" runat="server" />
                <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/addtotuiguang.gif" runat="server" /></label></td>
            <td valign="top"><p>推广内容： <span class="orange">标题</span> + <span class="orange">账号详细说明</span> + <span class="orange">起价</span> + <span class="orange">一口价</span> + <span class="orange">链接地址</span></p>
            <p>&nbsp;</p>
            <p><img src="images/sztygs.gif" width="131" height="25" /> <img src="images/sxqbnr.gif" width="107" height="25" /></p></td>
          </tr>
        </table>
        <p>&nbsp;</p>
        <cc1:ReorderList ID="ReorderList1" runat="server"
            PostBackOnReorder="True" 
            DataKeyField="title" 
            DragHandleAlignment="Left"
            SortOrderField="PNKID" AllowReorder="True" 
                    onitemreorder="ReorderList1_ItemReorder">
            <ItemTemplate>
               <table width="100%" height="80" border="0" cellpadding="0" cellspacing="10" class="contab">
                  <tr>
                    <td width="20" align="center" valign="top">
                        <asp:CheckBox ID="CheckBox3" runat="server" /></td>
                    <th width="347" align="left" valign="top"><p>
                        <asp:HyperLink ID="HyperLink1" Text='<%# Eval("title") %>' NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"pnkid","~/Productdetails.aspx?pnkid={0}") %>' runat="server"></asp:HyperLink><br />
                      游戏区服:<asp:Literal ID="Literal1" Text='<%# Eval("gamename") %>' runat="server"></asp:Literal> 
                        <asp:Literal ID="Literal2" Text='<%# Eval("servername") %>' runat="server"></asp:Literal></p>
                      <p>&nbsp;</p>
                      <p></p>
                      <p><br />
                      </p></th>
                    <td width="552" valign="top"><p class="contdiv">
                        <asp:Literal ID="Literal3" Text='<%# Eval("copyinfo") %>' runat="server"></asp:Literal></p>            
                    <p>&nbsp;</p>
                    <p><img id="Img1" src="~/images/copy.gif" runat="server" width="117" height="24" /></p></td>
                  </tr>
                </table> 
            </ItemTemplate>
            <ReorderTemplate>
                <asp:Panel ID="Panel2" runat="server"  />
            </ReorderTemplate>
            <DragHandleTemplate>
                <asp:Label ID="Label1" runat="server" Text="拖"></asp:Label>
            </DragHandleTemplate>
                </cc1:ReorderList>
&nbsp;<table width="100%" border="0" cellpadding="0" cellspacing="10" class="contab">
          <tr>
            <td width="8%" align="left" valign="top">
            <p>
                <asp:CheckBox ID="CheckBox2" Text="全选" runat="server" 
                    oncheckedchanged="CheckBox2_CheckedChanged" />
            </p>              </td>
            <td width="92%" align="left" valign="top">
                <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/addtotuiguang.gif" runat="server" /></td>
          </tr>
        </table>
    
      <p>&nbsp;</p>
	    <h4>推广内容汇总</h4>
	    <p>&nbsp;</p>
	    <div class="editor">
	      <p><img src="images/editor.gif" width="890" height="310" /></p>
	    </div>
		
		<div>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p align="center">
            <asp:ImageButton ID="ImageButton5" ImageUrl="~/images/copy01.gif" runat="server" /></p>
	    <p>&nbsp;</p></div>
	</div>
			
			
			
  </div>