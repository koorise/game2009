<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="WebUserControl_Login" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<div class="main">
		  <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
          </asp:ScriptManagerProxy>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/login_midd.gif">
            <tr>
              <td width="50" align="left" valign="top"><img src="images/login_left.gif" width="50" height="474" /></td>
              <td valign="top">
                <table width="250" border="0" align="center" cellpadding="0" cellspacing="0" class="loginform">
                  <tr>
                    <td height="24" &nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center"><img src="images/login_welc.gif" width="188" height="55" /></td>
                  </tr>
                  <tr>
                    <td width="67"  height="38" align="right">用户名：</td>
                    <td width="183" height="38"><asp:TextBox ID="tbUserName" Width="150px" 
                            CssClass="input" runat="server" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="tbUserName" Display="None" ErrorMessage="您的登录用户名是什么？" 
                            ValidationGroup="AA"></asp:RequiredFieldValidator>
                                  </td>
                  </tr>
                  <tr>
                    <td height="38" align="right">密码：</td>
                    <td height="38"><asp:TextBox ID="tbPassWD" MaxLength="16" Width="150px" CssClass="input" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="tbPassWD" Display="None" ErrorMessage="没有输入密码？" 
                            ValidationGroup="AA"></asp:RequiredFieldValidator>
                                  </td>
                  </tr>
                  <tr>
                    <td height="38" align="right">验证码：</td>
                    <td height="38"><asp:UpdatePanel ID="UpdatePanel1" runat="server" 
                            UpdateMode="Conditional">
                            <ContentTemplate><asp:TextBox ID="tbCode" runat="server" CssClass="input" MaxLength="4" 
                                    Width="50px"></asp:TextBox> 
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="tbCode" Display="None" ErrorMessage="没有输入验证码？" 
                                    ValidationGroup="AA"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" 
                                    HighlightCssClass="validatorCalloutHighlight" 
                                    TargetControlID="RequiredFieldValidator3">
                                </cc1:ValidatorCalloutExtender>
                                    <asp:Image ID="Image1" ImageAlign="AbsMiddle" height="22"  width="66" ImageUrl="~/CheckCode.aspx" runat="server" />
                               <asp:LinkButton ID="lBTNCode" runat="server" 
                            onclick="lBTNCode_Click">刷新</asp:LinkButton>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="lBTNCode" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="2" align="center" class="msg">
                        <asp:Label ID="lblErr" runat="server" ForeColor="Maroon" Text=""></asp:Label></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="2" align="center">
                        <asp:ImageButton ID="imgBtnLogin" ImageUrl="~/images/login_btn.gif" 
                            runat="server" onclick="imgBtnLogin_Click" ValidationGroup="AA" /></td>
                  </tr>  
                   <tr>
                    <td height="38" colspan="2" align="center"><label>
                      <asp:CheckBox 
                            ID="chkExp" Text="记住用户名和密码" runat="server" /> <a href="#">忘记密码了？</a>                    </label></td>
                  </tr>
                  <tr>
                    <td height="20" colspan="2" align="center"><img src="images/login_line.gif" width="246" height="2" /></td>
                  </tr>
                  <tr>
                    <td height="20" colspan="2" align="center">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="20" colspan="2" align="center">
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Reg.aspx"  runat="server">还没有游戏易站账号？</asp:HyperLink></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="2" align="center"><img src="images/login_qkreg.gif" width="125" height="33" /></td>
                  </tr>
                </table>
              </td>
              <td width="650" valign="top" background="images/login_right.gif"><table width="560" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="300">&nbsp;</td>
                </tr>
                <tr>
                  <td height="50" valign="top"><img src="images/login_so.gif" width="207" height="37" /></td>
                </tr>
                <tr>
                  <td class="logintext">游戏易站，专注于外服虚拟交易的国内业务。同行业唯一一家更加关注信誉的专业网站。<b致力于打造外服虚拟交易的小淘宝</td>
                </tr>
              </table></td>
            </tr>
          </table>
		  <br /><br />
		</div>
          <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" 
              HighlightCssClass="validatorCalloutHighlight" 
              TargetControlID="RequiredFieldValidator1">
          </cc1:ValidatorCalloutExtender>
          <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" 
              HighlightCssClass="validatorCalloutHighlight" 
              TargetControlID="RequiredFieldValidator2">
          </cc1:ValidatorCalloutExtender>
