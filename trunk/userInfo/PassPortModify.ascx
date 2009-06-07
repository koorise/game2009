<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PassPortModify.ascx.cs" Inherits="userInfo_PassPortModify" %>
<div class="cont">
				<h1>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></h1>
				
				<p>&nbsp;</p>
				<table width="740" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FAD181">
                  <tr>
                    <td height="30" align="left" bgcolor="#FFF6CD" scope="row"><p class="ddh1"><img src="images/ddh.gif" width="14" height="14" /> <strong>编号：</strong><asp:Literal
                            ID="LitNumber" runat="server"></asp:Literal></p>                    </td>
                  </tr>
                </table>
				<p align="center" class="passform">&nbsp;</p>
				<p align="center" class="passform">&nbsp;</p>
				<table width="740" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#ACD0F1">
                  <tr>
                    <td height="30" colspan="4" bgcolor="#D5EBFF" class="title"><strong>联系信息</strong></td>
                  </tr>
                  <tr>
                    <td height="30" colspan="4" bgcolor="#FFFFFF" class="comm">
					<span class="red">*</span>您的姓名：<asp:TextBox ID="tbRealName" runat="server"></asp:TextBox>
						           	      
                    <span class="red">*</span>联系电话：<asp:TextBox ID="tbTEL" runat="server"></asp:TextBox>                  	         
                    <span class="red">*</span>联系用QQ：<asp:TextBox ID="tbQQ" runat="server"></asp:TextBox>
					</td>
                  </tr>
                  <tr>
                    <td height="30" colspan="4" bgcolor="#D5EBFF" class="title"><strong>身份验证</strong>  - 以下请全部填写您注册时的资料，资料正确我们才能为您进行相关申请的核实</td>
                  </tr>
                  <tr>
                    <td width="110" height="30" align="right" bgcolor="#F4F9FF"> 邮箱：</td>
                    <td width="260" bgcolor="#FFFFFF"><span class="comm">
                       &nbsp;
                        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                    </span></td>
                    <td width="110" align="right" bgcolor="#F4F9FF"> 手机：</td>
                    <td width="255" bgcolor="#FFFFFF"><span class="comm">
                       &nbsp;
                        <asp:TextBox ID="tbMobile" runat="server"></asp:TextBox>
                    </span></td>
                  </tr>
                  <tr>
                    <td height="30" align="right" bgcolor="#F4F9FF">QQ：</td>
                    <td bgcolor="#FFFFFF"><span class="comm">
                     &nbsp;
                        <asp:TextBox ID="tbQQOld" runat="server"></asp:TextBox>
                    </span></td>
                    <td align="right" bgcolor="#F4F9FF">座机：</td>
                    <td bgcolor="#FFFFFF"><span class="comm">
                      &nbsp;
                        <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
                    </span></td>
                  </tr>
                  <tr>
                    <td height="30" align="right" bgcolor="#F4F9FF">网银用户名：</td>
                    <td bgcolor="#FFFFFF"><span class="comm">
                       &nbsp;
                        <asp:TextBox ID="tbBankName" runat="server"></asp:TextBox>
                    </span></td>
                    <td align="right" bgcolor="#F4F9FF">支付宝用户名：</td>
                    <td bgcolor="#FFFFFF"><span class="comm">
                       &nbsp;
                        <asp:TextBox ID="tbAlipayName" runat="server"></asp:TextBox>
                    </span></td>
                  </tr>
                  <tr>
                    <td height="30" align="right" bgcolor="#F4F9FF">银行卡号：</td>
                    <td bgcolor="#FFFFFF"><span class="comm">
                     &nbsp;
                        <asp:TextBox ID="tbBankID" runat="server"></asp:TextBox>
                    </span></td>
                    <td align="right" bgcolor="#F4F9FF">支付宝账号：</td>
                    <td bgcolor="#FFFFFF"><span class="comm">
                      &nbsp;
                        <asp:TextBox ID="tbAlipayID" runat="server"></asp:TextBox>
                    </span></td>
                  </tr>
                  <tr>
                    <td height="30" colspan="4" bgcolor="#D5EBFF" class="title"><strong>申请修改内容</strong></td>
                  </tr>
                  <tr>
                    <td height="120" colspan="4" bgcolor="#FFFFFF" class="comm"><p align="left">写清原因为什么要清空密保问题答案</p>
                      <p>
                          <asp:TextBox ID="tbReason" TextMode=MultiLine Columns=96 Rows=8 runat="server"></asp:TextBox>
                      </p>
                    </td>
                  </tr>
                </table>
				<p>&nbsp;</p>
				<p align="center">&nbsp;</p>
				<p align="center">&nbsp;</p>
				<p align="center">
                    <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" />
				</p>
				<p>&nbsp;</p>
				<p align="center" class="passform">&nbsp;</p>
		  </div>