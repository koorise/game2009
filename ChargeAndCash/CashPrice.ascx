<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CashPrice.ascx.cs" Inherits="ChargeAndCash_CashPrice" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<link href="style/money.css" rel="stylesheet" type="text/css" />
<div class="cont">
    <h1>
        提现</h1>
    <asp:Wizard ID="CashWizard" DisplaySideBar="False" runat="server" OnNextButtonClick="CashWizard_NextButtonClick"
        OnActiveStepChanged="CashWizard_ActiveStepChanged">
        <WizardSteps>
            <asp:WizardStep ID="CheckUser" runat="server" StepType="Start" Title="身份验证">
                <div>
                    <br />
                    <br />
                    <table width="600" border="0" align="center" cellpadding="5" cellspacing="0" class="box2">
                        <tr>
                            <td bgcolor="#DAF0FF">
                                <img src="images/ico_info.gif" width="23" height="22" hspace="10" align="absmiddle"
                                    alt="" /><span class="f14 blue"><strong>为了保障您的账户安全，请输入以下信息！</strong></span>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" bgcolor="#FFFFFF">
                                &nbsp;&nbsp;&nbsp;
                                <table width="100%" border="0" cellspacing="1" cellpadding="8">
                                    <tr>
                                        <td width="34%" align="right" class="f14">
                                            密码提示问题：
                                        </td>
                                        <td width="66%">
                                            <asp:DropDownList ID="dropQuestion" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="f14">
                                            密码提示问题答案
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAnswer" ErrorMessage="密保答案必须输入"></asp:RequiredFieldValidator>
                                            <asp:Label ID="txtAlert" ForeColor="Red" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:HyperLink ID="link_forget" runat="server" Target="_blank" Text="忘记了密码提示问题？"></asp:HyperLink>&nbsp;<asp:HyperLink
                                                ID="link_mail" runat="server" Target="_blank" Text="找回注册邮箱"></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <p>
                        &nbsp;</p>
                    <p>
                        &nbsp;</p>
                    <p align="center">
                        <asp:ImageButton ID="StepNextButton1" runat="server" CommandName="MoveNext" ImageUrl="~/images/btn_submit.gif"
                            Width="79" Height="26" /></p>
                </div>
            </asp:WizardStep>
            <asp:WizardStep ID="ChooseChannel" runat="server" StepType="Step" Title="选择渠道">
                <div class="tabsdd">
                    <div class="step">
                        <ul>
                            <li class="focus">
                                <img src="images/cz_10.gif" width="22" height="22" hspace="10" align="absmiddle"
                                    alt="" />选择提现渠道</li>
                            <li>
                                <img src="images/cz_2.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />填写提现信息</li>
                            <li>
                                <img src="images/cz_3.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />提交成功</li>
                            <li style="border: none;">
                                <img src="images/cz_4.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />提现申请成功，请耐心等候到账</li>
                        </ul>
                    </div>
                    <div class="stepcont">
                        <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="13%" height="30">
                                    &nbsp;
                                </td>
                                <td width="29%" valign="middle">
                                    账户余额为：<asp:Label ID="txt_leftprice2" runat="server" CssClass="red" />元
                                </td>
                                <td width="33%" valign="middle">
                                    <a href="#"><img src="images/btn_zjmx.gif" width="109" height="23" alt="" /></a>
                                </td>
                                <td width="25%">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="30">
                                    &nbsp;
                                </td>
                                <td>
                                    可提现余额为：<asp:Label ID="txt_enableprice2" runat="server" CssClass="red" />元
                                </td>
                                <td>
                                    <a href="#"><img src="images/btn_txmx.gif" width="109" height="23" alt="" /></a>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="20" class="dotline">
                                    &nbsp;
                                </td>
                                <td class="dotline">
                                    &nbsp;
                                </td>
                                <td class="dotline">
                                    &nbsp;
                                </td>
                                <td class="dotline">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="20">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="24">
                                    &nbsp;
                                </td>
                                <td colspan="2" class="f14">
                                    提现到：<asp:RadioButtonList ID="sel_channel" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="工商银行" Value="icbc"></asp:ListItem>
                                        <asp:ListItem Text="支付宝" Value="alipay"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <br />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="24">
                                    &nbsp;
                                </td>
                                <td colspan="2" class="blue">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工行：提现手续费0.9%,最低0.9元最高45元
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="20">
                                    &nbsp;
                                </td>
                                <td colspan="2" class="blue">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;支付宝：提现手续费0.8%,无上下限
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="40">
                                    &nbsp;
                                </td>
                                <td colspan="2" class="greenbox">
                                    <img src="images/ico_pers.gif" width="20" height="26" hspace="10" align="absmiddle"
                                        alt="" />您提交提现申请后，我们会在<span class="red"><strong>15</strong></span>分钟内为您办妥
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="20">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td colspan="2" align="center">
                                    <asp:ImageButton ID="StepNextButton2" runat="server" CommandName="MoveNext" ImageUrl="~/images/btn_nextstep.gif"
                                        Width="79" Height="26" border="0" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="40">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:WizardStep>
            <asp:WizardStep ID="InputOrder" runat="server" StepType="Step" Title="填写信息">
                <div class="tabsdd">
                    <div class="step">
                        <ul>
                            <li>
                                <img src="images/cz_1.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />选择提现渠道</li>
                            <li class="focus">
                                <img src="images/cz_20.gif" width="22" height="22" hspace="10" align="absmiddle"
                                    alt="" />填写提现信息</li>
                            <li>
                                <img src="images/cz_3.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />提交成功</li>
                            <li style="border: none;">
                                <img src="images/cz_4.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />提现申请成功，请耐心等候到账</li>
                        </ul>
                    </div>
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View11" runat="server">
                            <div class="stepcont">
                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="13%" height="30">
                                            &nbsp;
                                        </td>
                                        <td width="29%" valign="middle">
                                            账户余额为：<asp:Label ID="txt_leftprice31" runat="server" CssClass="red" />元
                                        </td>
                                        <td width="33%" valign="middle">
                                            <a href="#"><img src="images/btn_zjmx.gif" width="109" height="23" alt="" /></a>
                                        </td>
                                        <td width="25%">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            &nbsp;
                                        </td>
                                        <td>
                                            可提现余额为：<asp:Label ID="txt_enableprice31" runat="server" CssClass="red" />元
                                        </td>
                                        <td>
                                            <a href="#"><img src="images/btn_txmx.gif" width="109" height="23" alt="" /></a>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20" class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="24" colspan="4">
                                            <table width="100%" border="0" cellspacing="4" cellpadding="0">
                                                <tr>
                                                    <td width="37%" height="30" align="right" class="f14">
                                                        提现金额：
                                                    </td>
                                                    <td width="63%">
                                                        <asp:TextBox ID="txt_price31" runat="server" />
                                                        元
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" class="f14">
                                                        真实姓名：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txt_accountname31" runat="server" />
                                                        <a href="#">修改开户人户名</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" class="f14">
                                                        银行名称：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txt_channel31" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" class="f14">
                                                        银行卡号：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txt_accountnum31" runat="server" />
                                                        <a href="#">设置提现银行账号</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" class="f14">
                                                        密码提示问题：
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="dropQuestion31" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" class="f14">
                                                        密码提示问题答案：
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtAnswer31" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAnswer31" ErrorMessage="密保答案必须输入"></asp:RequiredFieldValidator>
                                                        <asp:Label ID="txtAlert31" ForeColor="Red" runat="server"></asp:Label><br />
                                                        <asp:HyperLink ID="link_forget31" runat="server" Target="_blank" Text="忘记了密码提示问题？"></asp:HyperLink>&nbsp;<asp:HyperLink
                                                            ID="link_mail31" runat="server" Target="_blank" Text="找回注册邮箱"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td colspan="2" align="center">
                                            <asp:ImageButton ID="StepNextButton31" runat="server" CommandName="MoveNext" ImageUrl="~/images/btn_nextstep.gif"
                                                Width="79" Height="26" border="0" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View12" runat="server">
                            <div class="stepcont">
                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="13%" height="30">
                                            &nbsp;
                                        </td>
                                        <td width="29%" valign="middle">
                                            账户余额为：<asp:Label ID="txt_leftprice32" runat="server" CssClass="red" />元
                                        </td>
                                        <td width="33%" valign="middle">
                                            <a href="#"><img src="images/btn_zjmx.gif" width="109" height="23" alt="" /></a>
                                        </td>
                                        <td width="25%">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            &nbsp;
                                        </td>
                                        <td>
                                            可提现余额为：<asp:Label ID="txt_enableprice32" runat="server" CssClass="red" />元
                                        </td>
                                        <td>
                                            <a href="#"><img src="images/btn_txmx.gif" width="109" height="23" alt="" /></a>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20" class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="24" colspan="4">
                                            <table width="100%" border="0" cellspacing="4" cellpadding="0">
                                                <tr>
                                                    <td width="37%" height="30" align="right" class="f14">
                                                        提现金额：
                                                    </td>
                                                    <td width="63%">
                                                        <asp:TextBox ID="txt_price32" runat="server" />
                                                        元
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" class="f14">
                                                        真实姓名：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txt_accountname32" runat="server" />
                                                        <a href="#">修改支付宝户主名</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" class="f14">
                                                        支付宝账号：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txt_accountnum32" runat="server" />
                                                        <a href="#">修改支付宝账号</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" class="f14">
                                                        密码提示问题：
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="dropQuestion32" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" class="f14">
                                                        密码提示问题答案：
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtAnswer32" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAnswer32" ErrorMessage="密保答案必须输入"></asp:RequiredFieldValidator>
                                                        <asp:Label ID="txtAlert32" ForeColor="Red" runat="server"></asp:Label><br />
                                                        <asp:HyperLink ID="link_forget32" runat="server" Target="_blank" Text="忘记了密码提示问题？"></asp:HyperLink>&nbsp;<asp:HyperLink
                                                            ID="link_mail32" runat="server" Target="_blank" Text="找回注册邮箱"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td colspan="2" align="center">
                                            <asp:ImageButton ID="StepNextButton32" runat="server" CommandName="MoveNext" ImageUrl="~/images/btn_nextstep.gif"
                                                Width="79" Height="26" border="0" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </asp:WizardStep>
            <asp:WizardStep ID="ConfirmOrder" runat="server" StepType="Step" Title="确认信息">
                <div class="tabsdd">
                    <div class="step">
                        <ul>
                            <li>
                                <img src="images/cz_1.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />选择提现渠道</li>
                            <li>
                                <img src="images/cz_2.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />填写提现信息</li>
                            <li class="focus">
                                <img src="images/cz_30.gif" width="22" height="22" hspace="10" align="absmiddle"
                                    alt="" />提交成功</li>
                            <li style="border: none;">
                                <img src="images/cz_4.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />提现申请成功，请耐心等候到账</li>
                        </ul>
                    </div>
                    <asp:MultiView ID="MultiView2" runat="server">
                        <asp:View ID="View21" runat="server">
                            <div class="stepcont">
                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td valign="bottom">
                                            &nbsp;
                                        </td>
                                        <td valign="bottom">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13%" height="30">
                                            &nbsp;
                                        </td>
                                        <td width="29%" valign="middle">
                                            账户余额为：<asp:Label ID="txt_leftprice41" runat="server" CssClass="red" />元
                                        </td>
                                        <td width="33%" valign="middle">
                                            <a href="#"><img src="images/btn_zjmx.gif" width="109" height="23" alt="" /></a>
                                        </td>
                                        <td width="25%">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            &nbsp;
                                        </td>
                                        <td>
                                            可提现余额为：<asp:Label ID="txt_enableprice41" runat="server" CssClass="red" />元
                                        </td>
                                        <td>
                                            <a href="#"><img src="images/btn_txmx.gif" width="109" height="23" alt="" /></a>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20" class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="60">
                                            &nbsp;
                                        </td>
                                        <td colspan="2">
                                            选择支付方式：<img src="images/icbc.gif" width="206" height="41" align="absmiddle" alt="" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table width="600" border="0" align="center" cellpadding="0" cellspacing="8" class="box1">
                                                <tr>
                                                    <td width="90" align="right" class="f14">
                                                        真实姓名：
                                                    </td>
                                                    <td width="484">
                                                        <asp:Label ID="txt_accountname41" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="f14">
                                                        银行名称：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txt_channel41" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="f14">
                                                        银行卡号：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txt_accountnum41" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="f14">
                                                        提现金额：
                                                    </td>
                                                    <td>
                                                        <strong>
                                                            <asp:Label ID="txt_price41" runat="server" CssClass="red" /></strong>元 实际到账金额：<strong><asp:Label
                                                                ID="txt_oprice41" runat="server" CssClass="red" /></strong>元 提现服务费：<strong><asp:Label
                                                                    ID="txt_sprice41" runat="server" CssClass="red" /></strong>元 [<a href="#">提现服务费标准</a>]
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td colspan="2" align="center">
                                            <asp:ImageButton ID="StepNextButton41" runat="server" CommandName="MoveNext" ImageUrl="~/images/btn_qdtx.gif"
                                                Width="79" Height="26" border="0" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View22" runat="server">
                            <div class="stepcont">
                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td valign="bottom">
                                            &nbsp;
                                        </td>
                                        <td valign="bottom">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13%" height="30">
                                            &nbsp;
                                        </td>
                                        <td width="29%" valign="middle">
                                            账户余额为：<asp:Label ID="txt_leftprice42" runat="server" CssClass="red" />元
                                        </td>
                                        <td width="33%" valign="middle">
                                            <a href="#"><img src="images/btn_zjmx.gif" width="109" height="23" alt="" /></a>
                                        </td>
                                        <td width="25%">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            &nbsp;
                                        </td>
                                        <td>
                                            可提现余额为：<asp:Label ID="txt_enableprice42" runat="server" CssClass="red" />元
                                        </td>
                                        <td>
                                            <a href="#"><img src="images/btn_txmx.gif" width="109" height="23" alt="" /></a>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20" class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                        <td class="dotline">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="60">
                                            &nbsp;
                                        </td>
                                        <td colspan="2">
                                            选择支付方式：<img src="images/alipay.gif" width="125" height="41" align="absmiddle" alt="" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table width="600" border="0" align="center" cellpadding="0" cellspacing="8" class="box1">
                                                <tr>
                                                    <td width="90" align="right" class="f14">
                                                        真实姓名：
                                                    </td>
                                                    <td width="484">
                                                        <asp:Label ID="txt_accountname42" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="f14">
                                                        提现渠道：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txt_channel42" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="f14">
                                                        支付宝帐号：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txt_accountnum42" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="f14">
                                                        提现金额：
                                                    </td>
                                                    <td>
                                                        <strong>
                                                            <asp:Label ID="txt_price42" runat="server" CssClass="red" /></strong>元 实际到账金额：<strong><asp:Label
                                                                ID="txt_oprice42" runat="server" CssClass="red" /></strong>元 提现服务费：<strong><asp:Label
                                                                    ID="txt_sprice42" runat="server" CssClass="red" /></strong>元 [<a href="#">提现服务费标准</a>]
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td colspan="2" align="center">
                                            <asp:ImageButton ID="StepNextButton42" runat="server" CommandName="MoveNext" ImageUrl="~/images/btn_qdtx.gif"
                                                Width="79" Height="26" border="0" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </asp:WizardStep>
            <asp:WizardStep ID="FinishOrder" runat="server" StepType="Complete" Title="提交成功">
                <div class="tabsdd">
                    <div class="step">
                        <ul>
                            <li>
                                <img src="images/cz_1.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />选择提现渠道</li>
                            <li>
                                <img src="images/cz_2.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />填写提现信息</li>
                            <li>
                                <img src="images/cz_3.gif" width="22" height="22" hspace="10" align="absmiddle" alt="" />提交成功</li>
                            <li class="focus" style="border: none;">
                                <img src="images/cz_40.gif" width="22" height="22" hspace="10" align="absmiddle"
                                    alt="" />提现申请成功，请耐心等候到账</li>
                        </ul>
                    </div>
                    <asp:MultiView ID="MultiView3" runat="server">
                        <asp:View ID="View31" runat="server">
                            <div class="stepcont">
                                <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="13%" height="60">
                                            &nbsp;
                                        </td>
                                        <td colspan="2">
                                            选择支付方式：<img src="images/icbc.gif" width="206" height="41" align="absmiddle" alt="" />
                                        </td>
                                        <td width="25%">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40">
                                            &nbsp;
                                        </td>
                                        <td colspan="2" class="txcg">
                                            提现申请交成功！
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td width="29%">
                                            &nbsp;
                                        </td>
                                        <td width="33%">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="bluebox">
                                            <table width="100%" border="0" cellspacing="10" cellpadding="0">
                                                <tr>
                                                    <td width="38%" height="20">
                                                        银行名称：<asp:Label ID="txt_channel51" runat="server" />
                                                    </td>
                                                    <td width="62%">
                                                        提现金额：<strong><asp:Label ID="txt_price51" runat="server" CssClass="red" /></strong>元
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="20">
                                                        银行卡号：<asp:Label ID="txt_accountnum51" runat="server" />
                                                    </td>
                                                    <td>
                                                        实际到账：<strong><asp:Label ID="txt_oprice51" runat="server" CssClass="red" /></strong>元
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="20" class="blue">
                                                        <a href="#">[查看提现明细]</a>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td colspan="2" align="center">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="greenbox">
                                            <img src="images/ico_ok.gif" width="27" height="27" hspace="10" vspace="3" align="absmiddle"
                                                alt="" /><strong>客服已收到通知，15分钟内为您核实并处理充值事务。</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" colspan="4" class="blue">
                                            &nbsp;&nbsp;&nbsp;您也可以通过下面的方式联系到充值客服为您进行处理。
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#C5E0F8">
                                                <tr>
                                                    <td width="33%" height="30" bgcolor="#F0F8FF">
                                                        &nbsp;&nbsp;客服名称
                                                    </td>
                                                    <td width="67%" bgcolor="#F0F8FF">
                                                        &nbsp;&nbsp;QQ号码
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" bgcolor="#FFFFFF">
                                                        &nbsp;&nbsp;<asp:Label ID="txt_servicename1" runat="server" />
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        &nbsp;&nbsp;<asp:Label ID="txt_servicenum1" runat="server" /> <a href="#" onclick="copyToClip()">[复制]</a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td colspan="2" align="center">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View32" runat="server">
                            <div class="stepcont">
                                <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="13%" height="60">
                                            &nbsp;
                                        </td>
                                        <td colspan="2">
                                            选择支付方式：<img src="images/alipay.gif" width="125" height="41" align="absmiddle" alt="" />
                                        </td>
                                        <td width="25%">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40">
                                            &nbsp;
                                        </td>
                                        <td colspan="2" class="txcg">
                                            提现申请交成功！
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td width="29%">
                                            &nbsp;
                                        </td>
                                        <td width="33%">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="bluebox">
                                            <table width="100%" border="0" cellspacing="10" cellpadding="0">
                                                <tr>
                                                    <td width="38%" height="20">
                                                        提现渠道：<asp:Label ID="txt_channel52" runat="server" />
                                                    </td>
                                                    <td width="62%">
                                                        提现金额：<strong><asp:Label ID="txt_price52" runat="server" CssClass="red" /></strong>元
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="20">
                                                        支付宝账号：<asp:Label ID="txt_accountnum52" runat="server" />
                                                    </td>
                                                    <td>
                                                        实际到账：<strong><asp:Label ID="txt_oprice52" runat="server" CssClass="red" /></strong>元
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="20" class="blue">
                                                        <a href="#">[查看提现明细]</a>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20">
                                            &nbsp;
                                        </td>
                                        <td colspan="2" align="center">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="greenbox">
                                            <img src="images/ico_ok.gif" width="27" height="27" hspace="10" vspace="3" align="absmiddle"
                                                alt="" /><strong>客服已收到通知，15分钟内为您核实并处理充值事务。</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" colspan="4" class="blue">
                                            &nbsp;&nbsp;&nbsp;您也可以通过下面的方式联系到充值客服为您进行处理。
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#C5E0F8">
                                                <tr>
                                                    <td width="33%" height="30" bgcolor="#F0F8FF">
                                                        &nbsp;&nbsp;客服名称
                                                    </td>
                                                    <td width="67%" bgcolor="#F0F8FF">
                                                        &nbsp;&nbsp;QQ号码
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="30" bgcolor="#FFFFFF">
                                                        &nbsp;&nbsp;<asp:Label ID="txt_servicename2" runat="server" />
                                                    </td>
                                                    <td bgcolor="#FFFFFF">
                                                        &nbsp;&nbsp;<asp:Label ID="txt_servicenum2" runat="server" /> <a href="#" onclick="copyToClip()">[复制]</a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td colspan="2" align="center">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </asp:WizardStep>
        </WizardSteps>
        <StartNavigationTemplate>
        </StartNavigationTemplate>
        <StepNavigationTemplate>
        </StepNavigationTemplate>
        <FinishNavigationTemplate>
        </FinishNavigationTemplate>
    </asp:Wizard>
</div>
