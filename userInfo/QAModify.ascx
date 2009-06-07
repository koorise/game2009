<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QAModify.ascx.cs" Inherits="userInfo_QAModify" %>
<div class="cont">
				<h1>修改密码提示问题及答案</h1>
				<table border="0" cellspacing="1" cellpadding="0" class="form changequerytion">
				  <tr>
					<th align="left" scope="col">请输入原密码提示问题和答案：</th>
				  </tr>
				  <tr>
					<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">原密码提示问题：</th>
                        <td width="200" align="left">
                            <asp:DropDownList ID="ddlQuestion0" CssClass="sel" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td><p>&nbsp;</p>
                        </td>
                      </tr>
                    </table></td>
				  </tr>
				  <tr>
					<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">原密码提示问题答案：</th>
                        <td width="200">
                            <asp:TextBox ID="tbAnswer0"  CssClass="txt" runat="server"></asp:TextBox></td>
                        <td><a href="#">忘记了密码提示问题？</a>   <a href="#">找回注册邮箱</a></td>
                      </tr>
                    </table></td>
				  </tr>
				  <tr>
				    <th align="left">请输入新的密码提示问题和答案：</th>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">新密码提示问题：</th>
                        <td width="200"><asp:DropDownList ID="ddlQuestion1" CssClass="sel" runat="server">
                            </asp:DropDownList>
                        </select></td>
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">新密码提示问题答案：</th>
                        <td width="200"><asp:TextBox ID="tbAnswer1"  CssClass="txt" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="*" ValidationGroup="X"></asp:RequiredFieldValidator>
                                        </td>
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
			      </tr>
				  <tr>
				    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th scope="row">确认密保答案：</th>
                        <td width="200">
                            <asp:TextBox ID="tbAnswer2" CssClass="txt" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="tbAnswer1" ControlToValidate="tbAnswer2" ErrorMessage="*" 
                                ValidationGroup="X"></asp:CompareValidator>
                                        </td>
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
			      </tr>
			  </table>

		        
		        <p align="center" class="tips changequerytionttip">游戏易站小贴士：定期更换密码保护问题将让您的账户更加安全</p>
		        <p>&nbsp;</p>
	          <p>&nbsp;</p>
		        <p align="center" class="passform">
                    <asp:Button ID="Button1" runat="server" Text="提交" onclick="Button1_Click" 
                        ValidationGroup="X" />
		        </p>
		  </div>