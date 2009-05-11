<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Buyer_GetProduct.ascx.cs" Inherits="UserControl_Buyer_GetProduct" %>
<%@ Register Src="CustomerService.ascx" TagName="CustomerService" TagPrefix="uc1" %>
<link href="style/pick.css" rel="stylesheet" type="text/css" />
<link href="style/ppick.css" rel="stylesheet" type="text/css" />
<div class="cont">
    <h1>
        已买到的</h1>
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <asp:Wizard ID="GetProductWizard" DisplaySideBar="False" runat="server" OnNextButtonClick="GetProductWizard_NextButtonClick"
        OnActiveStepChanged="GetProductWizard_ActiveStepChanged">
        <WizardSteps>
            <asp:WizardStep ID="CheckQuestion" runat="server" StepType="Start" Title="密保问题">
                <div><ul>
                    <li>为了保障您的账户安全，请输入以下信息！ </li>
                    <li><span class="lable">请选择密保问题：</span>
                        <asp:DropDownList ID="dropQuestion" runat="server">
                        </asp:DropDownList>
                    </li>
                    <li class="noboder"><span class="lable">请输入您的答案：</span>
                        <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAnswer" ErrorMessage="密保答案必须输入"></asp:RequiredFieldValidator>
                        <asp:Label ID="txtAlert" ForeColor="Red" runat="server"></asp:Label><br />
                        <asp:HyperLink ID="link_forget" runat="server" Target="_blank" Text="忘记了密码提示问题？"></asp:HyperLink>&nbsp;<asp:HyperLink
                            ID="link_mail" runat="server" Target="_blank" Text="找回注册邮箱"></asp:HyperLink>
                    </li>
                </ul></div>
                <div align="center">
                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="确定" /></div>
            </asp:WizardStep>
            <asp:WizardStep ID="ProductInfo" runat="server" StepType="Step" Title="商品信息">
                <div class="center">
                    <div class="orgbox">
                        <span class="red">您已经成功购买了该物品！请您及时复制并修改该帐号的相关信息</span></div>
                    <div class="view">
                        <asp:FormView ID="FormView1" OnDataBound="FormView1_DataBound" runat="server">
                <ItemTemplate>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
                                        <tr>
                                            <td width="1%" align="left">
                                                <img src="images/view_dd_tt_left.gif" width="6" height="30" />
                                            </td>
                                            <td width="98%" class="blue">
                                                <strong>&nbsp; 基本信息</strong>
                                            </td>
                                            <td width="1%" align="right">
                                                <img src="images/view_dd_tt_right.gif" width="6" height="30" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="bluebox">
                                    <table border="0" align="center" cellpadding="5" cellspacing="0">
                                        <tr>
                                            <td width="75" align="right" nowrap="nowrap" class="viewtd2">
                                                游戏区服：
                                            </td>
                                            <td colspan="3" class="viewtd2">
                                                <%# DataBinder.Eval(Container.DataItem, "GameName").ToString()%>/
                                                <%# DataBinder.Eval(Container.DataItem, "ServerName").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                职业/级别/种族：
                                            </td>
                                            <td colspan="3" class="viewtd2">
                                                <%# DataBinder.Eval(Container.DataItem, "JobName").ToString()%>/ <%# DataBinder.Eval(Container.DataItem, "flag").ToString()%>/ <%# DataBinder.Eval(Container.DataItem, "RaceName").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                信息标题：<br />
                                            </td>
                                            <td colspan="3" class="viewtd2">
                                                <a href='<%# "ProductDetails.aspx?pnkiD="+DataBinder.Eval(Container.DataItem, "PNKID").ToString()%>'
                                                    target="_blank">
                                                    <%# DataBinder.Eval(Container.DataItem, "pTitle").ToString()%></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd1">
                                                游戏账号：
                                            </td>
                                            <td width="165" class="viewtd1">
                                                <%# DataBinder.Eval(Container.DataItem, "AccountName").ToString()%>
                                            </td>
                                            <td align="right" nowrap="nowrap" class="viewtd1">
                                                注册时间：
                                            </td>
                                            <td width="186" class="viewtd1">
                                                <%# DataBinder.Eval(Container.DataItem, "AccountTimeReg").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd1">
                                                游戏密码：
                                                <td class="viewtd1">
                                                    <%# DataBinder.Eval(Container.DataItem, "AccountPassWD").ToString()%>
                                                </td>
                                                <td align="right" class="viewtd1">
                                                    到期时间：<br />
                                                </td>
                                                <td class="viewtd1">
                                                    <%# DataBinder.Eval(Container.DataItem, "AccountTimeEnd").ToString()%>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd1">
                                                游戏角色名：
                                            </td>
                                            <td class="viewtd1">
                                                <%# DataBinder.Eval(Container.DataItem, "AccountRoleName").ToString()%>
                                            </td>
                                            <td align="right" class="viewtd1">
                                                最后登录：
                                            </td>
                                            <td class="viewtd1">
                                                <%# DataBinder.Eval(Container.DataItem, "AccountTimeLastLogin").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap">
                                                详细说明：
                                            </td>
                                            <td colspan="3">
                                                <%# DataBinder.Eval(Container.DataItem, "pDetails").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" align="left" nowrap="nowrap" background="images/view_dd_tt_middle.gif"
                                                class="blue">
                                                <strong>安全信息：</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                密码保护问题：<br />
                                            </td>
                                            <td colspan="3" class="viewtd2">
                                                <%# DataBinder.Eval(Container.DataItem, "AccountPassportQuestion").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                密保问题答案：<br />
                                            </td>
                                            <td colspan="3" class="viewtd2">
                                                <%# DataBinder.Eval(Container.DataItem, "AccountPassportAnswer").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap">
                                                邮箱地址：
                                            </td>
                                            <td colspan="3">
                                                <%# DataBinder.Eval(Container.DataItem, "AccountMailAddress").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap">
                                                邮箱密码：
                                            </td>
                                            <td colspan="3">
                                                <%# DataBinder.Eval(Container.DataItem, "AccountMailPassWD").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap">
                                                邮箱资料：
                                            </td>
                                            <td colspan="3">
                                                <%# DataBinder.Eval(Container.DataItem, "AccountMailInfo").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap">
                                                注册黄图：
                                            </td>
                                            <td colspan="3">
                                                <a href='<%# DataBinder.Eval(Container.DataItem, "AccountYellowPageURL").ToString()%>' target="_blank"><img src="images/btn_view.gif" width="52" height="22" align="absmiddle" /></a>
                                            </td>
                                        </tr>
                                    </table>
                                    <p>
                                        &nbsp;</p>
                                </td>
                            </tr>
                        </table>
                        </ItemTemplate>
            </asp:FormView>
                    </div>
                    <div class="view">
                        <asp:FormView ID="FormView2" OnDataBound="FormView2_DataBound" runat="server">
                <ItemTemplate>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
                                        <tr>
                                            <td width="1%" align="left">
                                                <img src="images/view_dd_tt_left.gif" width="6" height="30" />
                                            </td>
                                            <td width="98%" class="blue">
                                                <strong>&nbsp; 基本信息</strong>
                                            </td>
                                            <td width="1%" align="right">
                                                <img src="images/view_dd_tt_right.gif" width="6" height="30" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="bluebox">
                                    <table border="0" align="center" cellpadding="5" cellspacing="0">
                                        <tr>
                                            <td width="75" align="right" nowrap="nowrap">
                                                游戏区服：
                                            </td>
                                            <td width="351">
                                                <%# DataBinder.Eval(Container.DataItem, "GameName").ToString()%>/
                                                <%# DataBinder.Eval(Container.DataItem, "ServerName").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                职业/级别/种族：
                                            </td>
                                            <td class="viewtd2">
                                                <%# DataBinder.Eval(Container.DataItem, "JobName").ToString()%>/ <%# DataBinder.Eval(Container.DataItem, "flag").ToString()%>/ <%# DataBinder.Eval(Container.DataItem, "RaceName").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                信息标题：<br />
                                            </td>
                                            <td class="viewtd2">
                                                <a href='<%# "ProductDetails.aspx?pnkiD="+DataBinder.Eval(Container.DataItem, "PNKID").ToString()%>'
                                                    target="_blank">
                                                    <%# DataBinder.Eval(Container.DataItem, "pTitle").ToString()%></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                详细说明：
                                            </td>
                                            <td class="viewtd2">
                                                <%# DataBinder.Eval(Container.DataItem, "pDetails").ToString()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                购买数量：
                                            </td>
                                            <td align="left" nowrap="nowrap" class="viewtd2">
                                                <%# DataBinder.Eval(Container.DataItem, "ProductCount").ToString()%>个
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                账号资料：<br />
                                            </td>
                                            <td class="viewtd2">
                                                <asp:Panel ID="ProductPanel" runat="server"></asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                    <p>
                                        &nbsp;</p>
                                </td>
                            </tr>
                        </table></ItemTemplate>
            </asp:FormView>
                    </div>
                    <div class="view">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
                                        <tr>
                                            <td width="1%" align="left">
                                                <img src="images/view_dd_tt_left.gif" width="6" height="30" />
                                            </td>
                                            <td width="98%" class="blue">
                                                <strong>&nbsp; 卖家联系信息 </strong>
                                            </td>
                                            <td width="1%" align="right">
                                                <img src="images/view_dd_tt_right.gif" width="6" height="30" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="bluebox">
                                    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
                                        <tr>
                                            <td width="75" align="right" nowrap="nowrap" class="viewtd2">
                                                卖家：
                                            </td>
                                            <td class="viewtd2">
                                                <asp:HyperLink ID="link_sells" Target="_blank" runat="server" />
                                                <asp:Panel ID="PromisePanel" runat="server">
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap" class="viewtd2">
                                                联系QQ：
                                            </td>
                                            <td class="viewtd2">
                                                <asp:Label ID="txt_sellsqq" runat="server" />
                                                <img src="images/ico_qq.gif" width="61" height="15" align="absmiddle" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" nowrap="nowrap">
                                                联系电话：
                                            </td>
                                            <td>
                                                <asp:Label ID="txt_sellstele" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    <div class="backlist">
        <asp:Button ID="btn_backlist" runat="server" CssClass="btn" Text="返回订单列表" OnClick="btn_backlist_Click" />
    </div>
    <uc1:CustomerService ID="CustomerService1" runat="server" />
</div>
