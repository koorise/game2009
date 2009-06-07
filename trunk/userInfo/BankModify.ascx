<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BankModify.ascx.cs" Inherits="userInfo_BankModify" %>
<asp:Panel ID="Panel1" runat="server">
<div class="cont">
				<h1>修改个人与银行信息 – 身份验证</h1>
				
				<table border="0" cellspacing="1" cellpadding="0" class="form yazheng">
				  <tr>
					<th align="left" scope="col">
				    <p class="blue f12"><img src="images/ico_info.gif" width="20" height="20" vspace="4" align="absmiddle" /> 为了保障您的账户安全，请输入以下信息！</p></th>
				  </tr>
				  <tr>
				    <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">密码提示问题：</th>
                        <td width="200" align="left">
                            <asp:DropDownList ID="ddlQuestion" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td><p>&nbsp;</p></td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">密码提示问题答案：</th>
                        <td width="200"><asp:TextBox ID="tbAnswer" CssClass="txt" runat="server"></asp:TextBox></td>
                        <td><a href="#">忘记了密码提示问题？</a> <a href="#">找回注册邮箱</a></td>
                      </tr>
                    </table></td>
			      </tr>
			  </table>

		        
       <p align="center" class="passform">
           <asp:Button ID="Button2" runat="server" Text="提交" onclick="Button2_Click" />
		        </p>
		  </div>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server">
<div class="cont">
				<h1>修改个人与银行信息–修改用户信息</h1>
				
				<table border="0" cellspacing="1" cellpadding="0" class="form modyuserinfo">
				<caption class="red">
				<p>请如实填写您的联系信息，银行信息，我们在业务通知或者对您的提现进行处理时将严格按照登记信息进行，不会接受任何口头信息。</p>
				</caption>
				  <tr>
					<th align="left" scope="col">详细信息</th>
				  </tr>
				  <tr>
					<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">支付宝账户姓名：</th>
                        <td width="240" align="left">
                            <asp:TextBox ID="tbAlipayName" CssClass="txt" runat="server"></asp:TextBox></td>
                        <td class="lable"><p>汉字姓名</p>                        </td>
                      </tr>
                    </table></td>
				  </tr>
				  <tr>
					<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">支付宝账号：</th>
                        <td width="240"><asp:TextBox ID="tbAlipayID1" CssClass="txt" runat="server"></asp:TextBox>
                          <a href="#" class="red">[修改]</a></td>
                        <td class="lable">注册支付宝的手机号码或邮箱地址</td>
                      </tr>
                    </table></td>
				  </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">确认支付宝账号：</th>
                        <td width="240"><asp:TextBox ID="tbAlipayID2" CssClass="txt" runat="server"></asp:TextBox></td>
                        <td class="lable">【注意验证邮箱格式和手机格式】</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">开户银行名称：</th>
                        <td width="240">
                            <asp:DropDownList ID="ddlBankName" runat="server">
                            
                            </asp:DropDownList>
                        </td>
                        <td class="lable">请选择开户银行</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">开户银行省市：</th>
                        <td width="240" align="center">省：
                            <asp:DropDownList ID="ddlProvice" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="ddlProvice_SelectedIndexChanged">
                            </asp:DropDownList>
                        市：
                            <asp:DropDownList ID="ddlCity" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td class="lable">如列表中没有您的所在城市，请选择您所在地区的<br />
                        上一级城市</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">开户人户名：</th>
                        <td width="240"><asp:TextBox ID="tbBankManName" CssClass="txt" runat="server"></asp:TextBox>
                        <a href="#" class="red">[修改]</a></td>
                        <td class="lable">16或19位银行账号</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">个人银行卡号：</th>
                        <td width="240"><asp:TextBox ID="tbBankCardID1" CssClass="txt" runat="server"></asp:TextBox></td>
                        <td class="lable">&nbsp;</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">确认银行卡号：</th>
                        <td width="240"><asp:TextBox ID="tbBankCardID2" CssClass="txt" runat="server"></asp:TextBox></td>
                        <td class="lable">&nbsp;</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">QQ号码：</th>
                        <td width="240"><asp:TextBox ID="tbQQ" CssClass="txt" runat="server"></asp:TextBox></td>
                        <td class="lable">&nbsp;</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">固定电话号码：</th>
                        <td width="240">&nbsp;
						<asp:TextBox ID="tbPhone" CssClass="txt" runat="server"></asp:TextBox></td>
                        <td class="lable">【2个电话号码至少填写一个】</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">手机或小灵通：</th>
                        <td width="240"><asp:TextBox ID="tbMobile" CssClass="txt" runat="server"></asp:TextBox></td>
                        <td class="lable">小灵通格式如:02188888888<br />
                        手机格式如:13800138000)</td>
                      </tr>
                    </table></td>
			      </tr>
			  </table>

		        
		        <p>&nbsp;</p>
	          <p>&nbsp;</p>
		        <p align="center" class="passform">
                    <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" />
		        </p>
		  </div>
</asp:Panel>
