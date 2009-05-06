<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountAddDone.ascx.cs" Inherits="AccountControl_AccountAddDone" %>
<asp:Panel ID="Panel1" runat="server">
<div class="main">
			<div class="pos"><strong>完善联系信息</strong></div>
			<p>&nbsp;</p>
			<table border="0" align="center" cellpadding="6" cellspacing="0" class="formtable">
			  <tr>
				<th width="158" height="30" align="right" class="border">QQ号码：</th>
				<td width="600" nowrap="nowrap" class="border"><label>
				    <asp:TextBox ID="tbQQ" runat="server"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tbQQ" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="tbQQ" ErrorMessage="*" 
                        ValidationExpression="[1-9][0-9]{4,11}" ValidationGroup="A"></asp:RegularExpressionValidator>
                    能联系到您的QQ号码
				</label></td>
			  </tr>
			  <tr>
				<th height="30" align="right">手机或小灵通：</th>
				<td>
                    <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tbPhone" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="tbPhone" ErrorMessage="*" 
                        ValidationExpression="^[0-9]{8,11}$" ValidationGroup="A"></asp:RegularExpressionValidator>
                    (小灵通格式如:02188888888),手机格式如:13800138000)</td>
			  </tr>
		  </table>
		    <div align="center">
		      <p class="red">客服在买家付款后会通过上述联系方式联系您交货或咨询，非常重要	          </p>
		      <p>&nbsp;</p>
		      <p>
		          <asp:Button ID="btnSub1" runat="server" onclick="btnSub1_Click" 
                      Text="确定以上信息并提交" ValidationGroup="A" />
&nbsp;</p>
		      <p>&nbsp;</p>
		      <p>&nbsp;</p>
		      <p>&nbsp;</p>
		      <p>&nbsp;</p>
		    </div>
		  
        </div>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server">
<div class="main">
			<div class="pos"><strong>选择您的接手客服</strong></div>
			<p>&nbsp;</p>
			<table border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
				<td width="120" height="30" align="right" valign="bottom" nowrap="nowrap"><label><img src="images/svc.gif" width="76" height="113" /></label></td>
			    <td align="center" nowrap="nowrap">
				<table width="500" border="0" align="center" cellspacing="0" style="margin:0px auto;">
                  <tr>
                    <td height="90" class="box"><div class="orange" style="font-size:14px;">选择您熟悉的接手客服，或者您认为服务比较好的客服，我们的客服在<br />
                      后台接到您的发布任务后，将会免费为您在各个QQ群里推广您的拍卖。<br />
                    交易成功后也将由其为您进行移交工作。</div></td>
                  </tr>
                </table></td>
			  </tr>
			  <tr>
				<td height="30" colspan="2" valign="top"><img src="images/select_svc_bot.gif" width="658" height="25" /></td>
		      </tr>
		  </table>
		    <div align="center">
		     
		     <p class="svc"><asp:LinkButton ID="LinkButton1" CssClass="focus" Text="账号客服01" runat="server"></asp:LinkButton>  </p>
		      <p>&nbsp;</p>
		      <p><img src="images/btn_svc_submit.gif" width="82" height="31" /></p>
		      <p>&nbsp;</p>
		      <p>&nbsp;</p>
		      <p>&nbsp;</p>
		    </div>
		  
        </div>
</asp:Panel>
<asp:Panel ID="Panel3" runat="server">
<div class="main">
			<div class="pos"><strong>恭喜您：您已经发布成功！</strong></div>
			<p>&nbsp;</p>
		  <div class="box">
		    <p><img src="images/mftg.gif" width="423" height="44" vspace="8" />	 </p>
		    <div class="service">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
                          <tr>
                            <td width="1%" align="left"><img src="images/view_dd_tt_left.gif" width="6" height="30" /></td>
                            <td width="98%" class="blue"><strong>&nbsp; 接收客服</strong></td>
                            <td width="1%" align="right"><img src="images/view_dd_tt_right.gif" width="6" height="30" /></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td class="bluebox"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="24" align="center" class="viewtd-blue">客服名称：账号客服001号                          </td>
                        </tr>
                        <tr>
                          <td height="50" align="center" class="viewtd2"><p>白班QQ:55446688 <a href="#">[复制]</a><br />
                              <strong>8:30-23:20</strong></p>
                          </td>
                        </tr>
                        <tr>
                          <td height="50" align="center"><p>夜班QQ:55446688 <a href="#">[复制]</a><br />
                              <strong>8:30-23:20</strong></p>
                          </td>
                        </tr>
                        <tr>
                          <td height="24" align="center" class="viewtd1">请在工作时间内联系对应客服</td>
                        </tr>
                      </table>                      </td>
                    </tr>
                  </table>
			</div>
			<div class="cont">
				<div class="txts1">
				  <p>物品编号：[<asp:HyperLink ID="HyperLink1" runat="server"></asp:HyperLink>]</p>
				  <p>到<a href="#">我正在出售的的订单</a>列表中查看详细情况。</p>
				  <p>&nbsp; </p>
				</div>
				<div class="tips">
				  <p><strong>易站小贴士：</strong>对您所有正在出售的物品，易站为您提供了免费便捷推广的功能，您在易站发布账号拍卖<br />
				  之后，不影响您在QQ群中继续推广您的商品。无需重新编辑销售信息，直接将您的所有出售信息按您需<br />
			    要的格式自动生成，您可以十分方便的复制到QQ群中进行销售推广。</p>
				  <p align="center"><img src="images/btn_tg.gif" width="199" height="26" vspace="5" /></p>
			    </div>
				
			</div>
			<div class="clear"></div>
			<br />
			<div align="center">
			<img src="images/btn_goon.gif" hspace="10" vspace="10" />
			<img src="images/btn_backlist.gif" hspace="10" vspace="10" />
			</div>
		  </div>
		  
        </div>
        </asp:Panel>