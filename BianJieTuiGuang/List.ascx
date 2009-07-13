<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List.ascx.cs" Inherits="BianJieTuiGuang_List" %>
    <link rel="stylesheet" href="http://static.jquery.com/ui/css/base2.css" type="text/css" media="all" /><link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/ui-lightness/jquery-ui.css" type="text/css" media="all" /><link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css" type="text/css" media="all" />
		<!--js--->	
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
			<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js" type="text/javascript"></script>

 
		
<STYLE type=text/css>
	#sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
	#sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
	#sortable li span { position: absolute; margin-left: -1.3em; }
	.content{float:right;padding-left:200px;}
input{margin-right:50px;}
	</STYLE>
<SCRIPT type=text/javascript>
    $(function() {
        $("#sortable").sortable();
        $('#sortable').bind('sortstop', function() { send(); });

        $("#sortable").disableSelection();
        $('#sendout').click(function() {
            send();
        });
        $('#sortable input').click(function() {
            send();
        });

    });
function send()
{
 var i = 0;
            var str = "";
            $('input:checked').each(function() {
                i++;
                str += "NO" + i + ":  ";
                str += $(this).next().next().html();
                str += "\r\n";

            });
            $('#textarea1').val(str);
}
	</SCRIPT>
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
        <!-- 开始 -->
        <DIV id=demo>
            <UL id=sortable>
        <asp:Repeater ID="Repeater1" runat="server">
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
                        <span class="content"><asp:Literal ID="Literal3" Text='<%# Eval("copyinfo") %>' runat="server"></asp:Literal></p></span>            
                    <p>&nbsp;</p>
                    <p><img id="Img1" src="~/images/copy.gif" runat="server" width="117" height="24" /></p></td>
                  </tr>
                </table> 
        </ItemTemplate>
        </asp:Repeater>
        </UL></DIV>
<input type="button" id="sendout" value="输出"/>
&nbsp;<table width="100%" border="0" cellpadding="0" cellspacing="10" class="contab">
          <tr>
            <td width="8%" align="left" valign="top">
            <p>
                <asp:CheckBox ID="CheckBox2" Text="全选" runat="server" 
                     />
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