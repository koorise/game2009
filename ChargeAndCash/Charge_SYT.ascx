<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Charge_SYT.ascx.cs" Inherits="ChargeAndCash_Charge_SYT" %>
<asp:Wizard ID="ChargeWizard" DisplaySideBar="False" runat="server" OnNextButtonClick="ChargeWizard_NextButtonClick"
    OnActiveStepChanged="ChargeWizard_ActiveStepChanged">
    <WizardSteps>
        <asp:WizardStep ID="InputOrder" runat="server" StepType="Start" Title="填写金额">
            <table width="60%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td height="40" >&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="40" ><img src="images/bank-logo.gif" width="167" height="51" /></td>
                          </tr>
                          <tr>
                            <td height="40">游戏易站是首信易支付的特约商家，支持<span class="blue">多达22家网上银行</span>支付。方便快捷</td>
                          </tr>
                          <tr>
                            <td height="40"><span class="f14">请输入充值金额：              
                            <asp:TextBox ID="txt_price" runat="server" />
                              <strong class="red">元</strong></span>（请输入正确的充值金额，必须是整数） <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_price" ErrorMessage="金额必须输入"></asp:RequiredFieldValidator></td>
                          </tr>
                          <tr>
                            <td height="40"><label><asp:ImageButton ID="StartNextButton" runat="server" CommandName="MoveNext" ImageUrl="~/images/next-step.gif"
                                Width="95" Height="32" border="0" /></label></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                          </tr>
                        </table>
        </asp:WizardStep>
        <asp:WizardStep ID="ConfirmOrder" runat="server" StepType="Step" Title="确认充值信息">
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td width="25%" height="40" align="right" class="f14">&nbsp;</td>
                            <td width="75%" height="40" align="left" class="f14">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">充值金额：</td>
                            <td height="40" align="left" class="f14"><asp:Label ID="txt_price2" runat="server" CssClass="money" /> 元</td>
                          </tr>
                          <tr>
                            <td height="40" align="right">选择支付方式：</td>
                            <td height="40" align="left"><img src="images/bank-logo.gif" width="167" height="51" /></td>
                          </tr>
                          <tr>
                            <td height="80">&nbsp;</td>
                            <td><asp:ImageButton ID="StepNextButton" runat="server" CommandName="MoveNext" ImageUrl="~/images/qrzf.gif"
                            Width="202" Height="35" border="0" /></td>
                          </tr>
                          <tr>
                            <td height="40" colspan="2"><div class="tips"><strong>易站小贴士：</strong>请点击确认支付后，在下一个页面选择支付银行并支付。</div></td>
                          </tr>
                        </table>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep1" runat="server" StepType="Finish" Title="填写金额">
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td height="40" align="right">&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td width="150" height="40" align="right">选择支付方式：</td>
                            <td><img src="images/bank-logo.gif" width="167" height="51" /></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td><img src="images/czcg.gif" width="112" height="28" /></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td align="right"><label><a href="#"><img src="images/back.gif" width="158" height="29" border="0" /></a></label></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td align="right">&nbsp;</td>
                          </tr>
                        </table>
        </asp:WizardStep>
    </WizardSteps>
</asp:Wizard>
