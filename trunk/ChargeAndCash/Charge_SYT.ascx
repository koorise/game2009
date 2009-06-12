<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Charge_SYT.ascx.cs" Inherits="ChargeAndCash_Charge_SYT" %>
<dd id="wydd">
<asp:Wizard ID="ChargeWizard" DisplaySideBar="False" runat="server" OnNextButtonClick="ChargeWizard_NextButtonClick"
    OnActiveStepChanged="ChargeWizard_ActiveStepChanged">
    <WizardSteps>
        <asp:WizardStep ID="InputOrder3" runat="server" StepType="Start" Title="填写金额">
            <div class="step">
							<ul>
								<li class="focus"><img src="images/cz_10.gif" width="22" height="22" hspace="10" align="absmiddle" />填写金额</li>
								<li><img src="images/cz_2.gif" width="22" height="22" hspace="10" align="absmiddle" />确认充值信息</li>
								<li><img src="images/cz_3.gif" width="22" height="22" hspace="10" align="absmiddle" />进入首信易支付页面充值</li>
								<li style="border:none;"><img src="images/cz_4.gif" width="22" height="22" hspace="10" align="absmiddle" />充值成功</li>
							</ul>
					  </div>
					  <div class="cont">
            <table width="60%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td height="40" >&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="40" ><img src="images/bank-logo.gif" width="167" height="51" alt="" /></td>
                          </tr>
                          <tr>
                            <td height="40">游戏易站是首信易支付的特约商家，支持<span class="blue">多达22家网上银行</span>支付。方便快捷</td>
                          </tr>
                          <tr>
                            <td height="40"><span class="f14">请输入充值金额：              
                            <asp:TextBox ID="txt_price3" Text="0" runat="server" />
                              <strong class="red">元</strong></span>（请输入正确的充值金额，必须是整数） <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_price3" ErrorMessage="金额必须输入"></asp:RequiredFieldValidator></td>
                          </tr>
                          <tr>
                            <td height="40"><label><asp:ImageButton ID="StartNextButton" runat="server" CommandName="MoveNext" ImageUrl="~/images/next-step.gif"
                                Width="95" Height="32" border="0" /></label></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                          </tr>
                        </table></div>
        </asp:WizardStep>
        <asp:WizardStep ID="ConfirmOrder3" runat="server" StepType="Step" Title="确认充值信息">
            <div class="step">
							<ul>
								<li><img src="images/cz_1.gif" width="22" height="22" hspace="10" align="absmiddle" />填写金额</li>
								<li class="focus"><img src="images/cz_20.gif" width="22" height="22" hspace="10" align="absmiddle" />确认充值信息</li>
								<li><img src="images/cz_3.gif" width="22" height="22" hspace="10" align="absmiddle" />进入首信易支付页面充值</li>
								<li style="border:none;"><img src="images/cz_4.gif" width="22" height="22" hspace="10" align="absmiddle" />充值成功</li>
							</ul>
					  </div>
					  <div class="cont">
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td width="25%" height="40" align="right" class="f14">&nbsp;</td>
                            <td width="75%" height="40" align="left" class="f14">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">充值金额：</td>
                            <td height="40" align="left" class="f14"><asp:Label ID="txt_price33" runat="server" CssClass="money" /> 元</td>
                          </tr>
                          <tr>
                            <td height="40" align="right">选择支付方式：</td>
                            <td height="40" align="left"><img src="images/bank-logo.gif" width="167" height="51" alt="" /></td>
                          </tr>
                          <tr>
                            <td height="80">&nbsp;</td>
                            <td><asp:ImageButton ID="StepNextButton" runat="server" CommandName="MoveNext" ImageUrl="~/images/qrzf.gif"
                            Width="202" Height="35" border="0" /></td>
                          </tr>
                          <tr>
                            <td height="40" colspan="2"><div class="tips"><strong>易站小贴士：</strong>请点击确认支付后，在下一个页面选择支付银行并支付。</div></td>
                          </tr>
                        </table></div>
        </asp:WizardStep>
        <asp:WizardStep ID="FinishOrder3" runat="server" StepType="Complete" Title="充值成功">
            <div class="step">
							<ul>
								<li><img src="images/cz_1.gif" width="22" height="22" hspace="10" align="absmiddle" />填写金额</li>
								<li><img src="images/cz_2.gif" width="22" height="22" hspace="10" align="absmiddle" />确认充值信息</li>
								<li><img src="images/cz_3.gif" width="22" height="22" hspace="10" align="absmiddle" />进入首信易支付页面充值</li>
								<li class="focus" style="border:none;"><img src="images/cz_40.gif" width="22" height="22" hspace="10" align="absmiddle" />充值成功</li>
							</ul>
					  </div>
					  <div class="cont">
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td height="40" align="right">&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td width="150" height="40" align="right">选择支付方式：</td>
                            <td><img src="images/bank-logo.gif" width="167" height="51" alt="" /></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td><img src="images/czcg.gif" width="112" height="28" alt="" /></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td align="right"><label><a href="#"><img src="images/back.gif" width="158" height="29" border="0" alt="" /></a></label></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td align="right">&nbsp;</td>
                          </tr>
                        </table></div>
        </asp:WizardStep>
    </WizardSteps>
    <StartNavigationTemplate></StartNavigationTemplate>
    <StepNavigationTemplate></StepNavigationTemplate>
    <FinishNavigationTemplate></FinishNavigationTemplate>
</asp:Wizard>
</dd>