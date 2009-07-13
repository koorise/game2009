<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GetPassWord.ascx.cs" Inherits="userInfo_GetPassWord" %>
		<div class="pos">
		您的位置：<a href="#">首页</a> >> <a href="#">游戏易站登录</a> >> <a href="#">重置密码</a> </div>
		<!--start body-->
		<div class="main">
			<dl class="getpass">
				<dt><img src="images/getpass_top.gif" /></dt>
				<dd>
					<h1>找回密码</h1>
					<div class="frm">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="160" height="160" align="center"><img src="images/pass.gif" width="97" height="143" /></td>
                            <td colspan="2" valign="middle"><table width="390" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="126" height="30" align="right" class="lable">登 录 名：</td>
                                <td width="264"><asp:TextBox  CssClass="txt" 
                                        ID="TextBox1" runat="server"></asp:TextBox>
                                                </td>
                              </tr>
                              <tr>
                                <td height="30" align="right" class="lable">注册邮箱：</td>
                                <td><asp:TextBox ID="TextBox2"  CssClass="txt"
                                        runat="server"></asp:TextBox>
                                                </td>
                              </tr>
                              <tr>
                                <td height="30" align="right" class="lable">验 证 码：</td>
                                <td><asp:TextBox ID="TextBox3"  CssClass="txt"
                                        runat="server"></asp:TextBox>
                                                <asp:Image ID="Image1" ImageAlign="AbsMiddle" height="22"  
                                        width="66" ImageUrl="~/CheckCode.aspx?sName=pwCode" runat="server" /></td>
                              </tr>
                              <tr>
                                <td height="40" colspan="2" align="center"><label>
                                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/btn_getpass.gif" 
                                        runat="server" onclick="ImageButton1_Click" />
                                </label></td>
                              </tr>
                            </table></td>
                          </tr>
                          
                          <tr>
                            <td height="24" colspan="3"><strong>提示：</strong></td>
                          </tr>
                          <tr>
                            <td colspan="3"><p>如果该电子邮箱地址不正确，或者您已经忘记注册时填写的邮箱地址，那我们无法帮您找回密码。你可以点击<br />
                            这里<a href="#">重新进行注册</a>。</p>
                            <p>如果您需要修改注册邮箱，请登录后自行<a href="#">修改注册邮箱</a>，或登录后<a href="#">申诉</a></p></td>
                          </tr>
                          <tr>
                            <td height="30" colspan="3">&nbsp;</td>
                          </tr>
                        </table>
					</div>
					<div style="clear:both;"></div>
				</dd>
				<div style="clear:both;"></div>
				
			</dl>
  </div>
		<!--end body-->
		