<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TO_Saler.ascx.cs" Inherits="Appraise_TO_Saler" %>
<div class="cont">
				<h1>评价卖家</h1>
				<div class="notes">
					<img src="images/notes.gif" width="10" height="16" hspace="8" align="absmiddle" />
					<strong>评价须知：</strong>
					 <div class="ncont">					   1. 请根据此次交易给予真实评价，您的评价将对其他的会员起到参考作用，也将影响卖家的信用度，请客观仔细地评价。 <br />
					   2. 中评不计分，但会影响卖家的好评率，请慎重给予。 <br />
					   评价后30天内，中评或差评您可以有一次自行操作修改或删除的机会，评价只能修改为好评。					</div>
				</div>
				<div class="info">
				<br />
					<table width="553" border="0" cellpadding="5" cellspacing="0">
                      <tr>
                        <td width="6" rowspan="6">&nbsp;</td>
                        <td height="24" align="left">被评价人：<asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink></td>
                      </tr>
                      <tr>
                        <td height="24" align="left">相关物品：<asp:HyperLink ID="HyperLink2" runat="server">HyperLink</asp:HyperLink></td>
                      </tr>
                      <tr>
                        <td height="24" align="left">发表评论：（500字以内）</td>
                      </tr>
                      <tr>
                        <td height="24" align="left"><asp:TextBox ID="TextBox1"
                              TextMode="MultiLine" Columns="60" Rows="6"   runat="server"></asp:TextBox></td>
                      </tr>
                      
                      <tr>
                        <td height="100" align="center">
                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/ico_good.gif"  
                                runat="server" onclick="ImageButton1_Click" />
                            <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/btn_common.gif" 
                                runat="server" onclick="ImageButton2_Click" />
                            <asp:ImageButton ID="ImageButton3" ImageUrl="~/images/btn_bad.gif" 
                                runat="server" onclick="ImageButton3_Click" /></td>
                      </tr>
                    </table>
					<p>&nbsp;</p>
			  </div>
    </div>
    <div id="tip">
				<dl>
					<dt id="tipdt">5分 非常满意</dt>
					<dd id="tipdd">根本就不打算兑现承诺，简直就<br />
				    是赤裸裸的欺诈，还恶言相向</dd>
				</dl>
	</div>