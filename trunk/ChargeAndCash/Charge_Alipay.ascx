<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Charge_Alipay.ascx.cs" Inherits="ChargeAndCash_Charge_Alipay" %>
<asp:Wizard ID="ChargeWizard" DisplaySideBar="False" runat="server" OnNextButtonClick="ChargeWizard_NextButtonClick"
    OnActiveStepChanged="ChargeWizard_ActiveStepChanged">
    <WizardSteps>
        <asp:WizardStep ID="InputOrder" runat="server" StepType="Start" Title="填写金额">
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="6">
                <tr>
                    <td height="40" align="center">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="40" align="center">
                        :<img src="images/alipay.gif" width="125" height="41" />
                    </td>
                </tr>
                <tr>
                    <td height="40" align="center" class="hui">
                        游戏易站是支付宝的特约商家，合作者身份ID（partnerID）<asp:Label ID="txt_id" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="40" align="center">
                        <span class="f14">请输入充值金额：</span><span class="f14">
                            <asp:TextBox ID="txt_price" runat="server" />
                            <strong class="red">元</strong></span> （请填写正确的金额，最多2位小数） <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_price" ErrorMessage="金额必须输入"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td height="40" align="center">
                        <label>
                            <asp:ImageButton ID="StartNextButton" runat="server" CommandName="MoveNext" ImageUrl="~/images/next-step.gif"
                                Width="95" Height="32" border="0" /></label>
                    </td>
                </tr>
                <tr>
                    <td height="40">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="ConfirmOrder" runat="server" StepType="Step" Title="确认充值信息">
            <table width="85%" border="0" align="center" cellpadding="0" cellspacing="6">
                <tr>
                    <td align="right" class="f14">
                        &nbsp;
                    </td>
                    <td align="left" class="f14">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="25%" height="40" align="right" class="f14">
                        充值金额：
                    </td>
                    <td width="75%" height="40" align="left" class="f14">
                        <asp:Label ID="txt_price2" runat="server" CssClass="money" /> 元
                    </td>
                </tr>
                <tr>
                    <td height="40" align="right" class="f14">
                        选择支付方式：
                    </td>
                    <td height="40" align="left" class="f14">
                        <img src="images/alipay.gif" width="125" height="41" />
                    </td>
                </tr>
                <tr>
                    <td height="40">
                        &nbsp;
                    </td>
                    <td height="40">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="40">
                        &nbsp;
                    </td>
                    <td height="40">
                        <asp:ImageButton ID="StepNextButton" runat="server" CommandName="MoveNext" ImageUrl="~/images/webpay.gif"
                            Width="202" Height="35" border="0" />
                    </td>
                </tr>
                <tr>
                    <td height="40" colspan="2">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep1" runat="server" StepType="Finish" Title="填写金额">
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td height="40" align="right">&nbsp;</td>
                            <td width="508">&nbsp;</td>
                          </tr>
                          <tr>
                            <td width="90" height="40" align="left">选择支付方式：</td>
                            <td><img src="images/alipay.gif" width="125" height="41" /></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td align="center"><img src="images/czcg.gif" width="112" height="28" /></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td align="center"><label><a href="wangyin-step1 .html"><img src="images/back.gif" width="158" height="29" border="0" /></a></label></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td align="right">&nbsp;</td>
                          </tr>
                        </table>
        </asp:WizardStep>
    </WizardSteps>
</asp:Wizard>
