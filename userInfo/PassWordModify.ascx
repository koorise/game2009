<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PassWordModify.ascx.cs" Inherits="userInfo_PassWordModify" %>

<div class="cont">
				<h1>修改登录密码</h1>
				<table border="0" cellspacing="1" cellpadding="0" class="form passform">
				  <tr>
					<th align="left" scope="col">修改密码</th>
				  </tr>
				  <tr>
					<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">当前密码：</th>
                        <td width="200"><asp:TextBox 
                                ID="tbPassWord0" CssClass="txt" runat="server"></asp:TextBox>
                                        </td>
                        <td><a href="#">忘记了密码？</a></td>
                      </tr>
                    </table></td>
				  </tr>
				  <tr>
					<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">新密码：</th>
                        <td width="200"><asp:TextBox 
                                ID="tbPassWord1" CssClass="txt" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="tbPassWord1" ErrorMessage="*" ValidationGroup="X"></asp:RequiredFieldValidator>
                                        </td>
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
				  </tr>
				  <tr>
					<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">确认新密码：</th>
                        <td width="200"><asp:TextBox 
                                ID="tbPassWord2" CssClass="txt" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="tbPassWord1" ControlToValidate="tbPassWord2" 
                                Display="Dynamic" ErrorMessage="*" ValueToCompare="X"></asp:CompareValidator>
                                        </td>
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
				  </tr>
			  </table>

		        <p>&nbsp;</p>
	          <p>&nbsp;</p>
		        <p align="center" class="passform">
                    <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" 
                        ValidationGroup="X" />
		        </p>
		  </div>