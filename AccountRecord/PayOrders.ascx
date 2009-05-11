<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PayOrders.ascx.cs" Inherits="AccountRecord_PayOrders" %>
<asp:Literal ID="litErr" runat="server"></asp:Literal>
<asp:Panel ID="Panel1" runat="server">
<div class="main">
			<dl class="paybox">
				<dt><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/pay_title1.gif">
				  <tr><td width="6%">&nbsp;</td>
				    <td width="26%" align="center" class="un">1.填写订单</td>
			      <td width="32%" align="center">2.支付订单</td><td width="28%" align="center">3. 取货</td>
			      <td width="8%">&nbsp;</td>
				  </tr></table>
				</dt>
				
				<dd>
					<ul>
						<li><span class="lable">
                            <asp:Literal ID="litProductBasic1" runat="server"></asp:Literal></span></li>
						<li><span class="lable">商品价格：</span> <strong class="red">
                            <asp:Literal ID="litPrice1" runat="server"></asp:Literal></strong>元</li>
						<li><span class="lable">QQ ：</span>  
                            <asp:TextBox ID="tbQQ" runat="server"></asp:TextBox> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="tbQQ" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                            请填写客服可以联系到您的QQ号码</li>
						<li class="noboder"><span class="lable">电话：</span>  
                            <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox> 
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="tbPhone" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
						建议填写手机号，固话小灵通请加区号，如：0471-8888888</li>
					</ul>
			        <div align="center">
			        <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/btn_confirmpay.gif"  
                            runat="server" onclick="ImageButton1_Click" ValidationGroup="A" /></div>
			  </dd>
			</dl>
  </div>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server">
<div class="main">
			<dl class="paybox">
				<dt><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/pay_title2.gif">
				  <tr><td width="6%">&nbsp;</td>
				    <td width="26%" align="center" class="done">1.填写订单</td>
			      <td width="32%" align="center" class="un">2.支付订单</td>
			      <td width="28%" align="center">3. 取货</td>
			      <td width="8%">&nbsp;</td>
				  </tr></table>
				</dt>
				<dd>
					<ul>
						<li><span class="lable">商品信息：</span> <asp:Literal ID="litProductBasic2" runat="server"></asp:Literal></span></li>
						<li><span class="lable">您的易站账户余额：</span> <strong class="red">
                            <asp:Literal ID="litMyMoney2" runat="server"></asp:Literal></strong>元</li>
						<li class="noboder"><span class="lable">需支付：</span>  <strong class="red">
                            <asp:Literal ID="litPrice2" runat="server"></asp:Literal></strong>元</li>
					</ul>
					<div align="center"> 
					<asp:ImageButton ID="ImageButton2" ImageUrl="~/images/btn_confirmpay.gif" 
                            AlternateText="确认支付" runat="server" onclick="ImageButton2_Click" />
					<asp:ImageButton ID="ImageButton22" ImageUrl="~/images/btn_pay_buzu.gif" 
                            AlternateText="余额不足" runat="server" onclick="ImageButton22_Click" />
					</div>
				</dd>
			</dl>
        </div>
</asp:Panel>
<asp:Panel ID="Panel3" runat="server">
<div class="main">
			<dl class="paybox">
				<dt><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/pay_title2.gif">
				  <tr><td width="6%">&nbsp;</td>
				    <td width="26%" align="center" class="done">1.填写订单</td>
			      <td width="32%" align="center" class="un">2.支付订单</td>
			      <td width="28%" align="center">3. 取货</td>
			      <td width="8%">&nbsp;</td>
				  </tr></table>
				</dt>
				<dd>
					<ul>
						<li><span class="lable">商品信息：</span> <asp:Literal ID="litProductBasic3" runat="server"></asp:Literal></li>
						<li><span class="lable">您的易站账户余额：</span> <strong class="red">
                            <asp:Literal ID="litMyMoney3" runat="server"></asp:Literal></strong>元</li>
						<li><span class="lable">需支付：</span> <strong class="red">
                            <asp:Literal ID="litPrice3" runat="server"></asp:Literal></strong>元</li>
						<li><span class="lable">选择密保问题：</span> 
                            <asp:DropDownList ID="ddlQuestion" runat="server">
                            </asp:DropDownList>
                        </li>
						<li class="noboder"><span class="lable">请输入您的答案：</span>  
                            <asp:TextBox ID="tbAnswer" runat="server"></asp:TextBox> 
						</li>
					</ul>
			        <div align="center">
                        <asp:ImageButton ID="ImageButton3" ImageUrl="~/images/btn_qdzf.gif" 
                            AlternateText="确认支付" runat="server" onclick="ImageButton3_Click" /></div>
			  </dd>
			</dl>
  </div>
</asp:Panel>
<asp:Panel ID="Panel4" runat="server">
<div class="main">
			<dl class="paybox">
				<dt><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/pay_title3.gif">
				  <tr><td width="6%">&nbsp;</td>
				    <td width="26%" align="center" class="done">1.填写订单</td>
			      <td width="32%" align="center" class="done">2.支付订单</td>
			      <td width="28%" align="center" class="un">3. 取货</td>
			      <td width="8%">&nbsp;</td>
				  </tr></table>
				</dt>
				
			  <dd>
			    <table width="800" border="0" align="center" cellpadding="20" cellspacing="8" style="margin:0px auto;">
                  <tr>
                    <td valign="top" class="bluebox"><p><span class="ptitle">恭喜您：您已经支付成功，请立刻联系以下客服领取物品</span><br />
                      请您尽快联系客服为您处理：<br />
                      商品订单号：<span class="red"><asp:Literal ID="litOrderNumber" runat="server"></asp:Literal></span><br />
                      成功后点击<strong><a href="#" class="red">我已买到的商品</a></strong>提取账号的详细资料 </p>
                        <p>&nbsp;</p>
                      <div align="center"><img src="images/btn_copy4ser.gif" width="149" height="24" vspace="10" /></div></td>
                    <td width="200" rowspan="2" valign="top" style="padding:0px;"><div class="service">
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
                                  <td height="24" align="center" class="viewtd-blue">客服名称：<asp:Literal 
                                          ID="litCustomerServiceName" runat="server"></asp:Literal>
&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="50" align="center" class="viewtd2"><p>白班QQ:<asp:Literal ID="litSvcDay" 
                                          runat="server"></asp:Literal>
&nbsp;<strong>8:30-23:20</strong></p></td>
                                </tr>
                                <tr>
                                  <td height="50" align="center"><p>夜班QQ:<asp:Literal ID="litSvcNight" runat="server"></asp:Literal>
&nbsp;<strong>8:30-23:20</strong></p></td>
                                </tr>
                                <tr>
                                  <td height="24" align="center" class="viewtd1">请在工作时间内联系对应客服</td>
                                </tr>
                            </table></td>
                          </tr>
                        </table>
                    </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="tips">游戏易站工作人员任何情况下都不会向您索要您的易站账号密码，密保问题，答案，注册邮箱<br />
                      等个人信息，谨防受骗</td>
                  </tr>
                </table>
			  </dd>
			</dl>
  </div>
</asp:Panel>
