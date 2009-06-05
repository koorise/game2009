<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Charge_ICBC.ascx.cs" Inherits="ChargeAndCash_Charge_ICBC" %>
<asp:Wizard ID="ChargeWizard" DisplaySideBar="False" runat="server" OnNextButtonClick="ChargeWizard_NextButtonClick"
    OnActiveStepChanged="ChargeWizard_ActiveStepChanged">
    <WizardSteps>
        <asp:WizardStep ID="InputOrder" runat="server" StepType="Start" Title="填写金额">
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td width="150" height="40">&nbsp;</td>
                            <td valign="bottom">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">选择网上银行:</td>
                            <td><img src="images/icbc.gif" width="206" height="41" align="absmiddle" /> <img src="images/wsxf.gif" width="156" height="23" hspace="10" /></td>
                          </tr>
                          <tr>
                            <td height="40" align="right"><span class="f14">请输入充值金额：</span></td>
                            <td><span class="f14">
                              <asp:TextBox ID="txt_price" runat="server" />
                            <strong class="red">元</strong></span> （请填写正确的金额，最多2位小数） <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_price" ErrorMessage="金额必须输入"></asp:RequiredFieldValidator></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td><label><asp:ImageButton ID="StartNextButton" runat="server" CommandName="MoveNext" ImageUrl="~/images/next-step.gif"
                                Width="95" Height="32" border="0" /></label></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                        </table>
        </asp:WizardStep>
        <asp:WizardStep ID="ConfirmOrder" runat="server" StepType="Step" Title="确认充值信息">
            <table width="85%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td align="right" class="f14">&nbsp;</td>
                            <td align="left" class="f14">&nbsp;</td>
                          </tr>
                          <tr>
                            <td width="25%" height="40" align="right" class="f14">充值金额：</td>
                            <td width="75%" height="40" align="left" class="f14">  <asp:Label ID="txt_price2" runat="server" CssClass="money" /> 元</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">实际支付：</td>
                            <td height="40" align="left" class="f14"><asp:Label ID="txt_price3" runat="server" CssClass="money" /> 元</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">选择支付方式：</td>
                            <td height="40" align="left" class="f14"><img src="images/icbc.gif" width="206" height="41" /></td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">工行账号：</td>
                            <td height="40" class="f14">4270208100091879 <img src="images/wsxf.gif" width="156" height="23" align="absmiddle" /></td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">账户户名：</td>
                            <td height="40" class="f14"> 齐治嘉</td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td height="40"><asp:ImageButton ID="StepNextButton" runat="server" CommandName="MoveNext" ImageUrl="~/images/gotopay.gif"
                            Width="202" Height="35" border="0" /><asp:ImageButton ID="btn_notifyservice" runat="server" ImageUrl="~/images/sp2svc.gif" width="224" height="29" border="0" /></td>
                          </tr>
                          <tr>
                            <td height="40" colspan="2"><div class="tips"><strong>易站小贴士：</strong>请务必确认汇款成功后再通知客服，否则您的充值订单审核可能会失败，您还需要重新进行充值操作</div></td>
                          </tr>
                          
                          <tr>
                            <td height="40" colspan="2">&nbsp;</td>
                          </tr>
                        </table>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep1" runat="server" StepType="Finish" Title="填写金额">
            <table width="75%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td width="100" height="4" align="right">&nbsp;</td>
                            <td width="467" height="4">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">选择支付方式：</td>
                            <td height="40" align="left" class="f14"><img src="images/icbc.gif" width="206" height="41" /></td>
                          </tr>
                          <tr>
                            <td height="40" align="center" class="money">&nbsp;</td>
                            <td height="40" align="left" class="money">充值申请提交成功！</td>
                          </tr>
                          <tr>
                            <td height="40" colspan="2" class="greenbox"><label><img src="images/ico_ok.gif" width="27" height="27" hspace="10" align="absmiddle" /><strong>客服已收到通知，15分钟内为您核实并处理充值事务。</strong></label></td>
                          </tr>
                          <tr>
                            <td height="40" colspan="2" class="blue">您也可以通过下面的方式联系到充值客服为您进行处理。</td>
                          </tr>
                          <tr>
                            <td height="40" colspan="2"><table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="#C5E0F8">
                              <tr>
                                <td width="30%" bgcolor="#F0F8FF">客服名称</td>
                                <td width="70%" bgcolor="#F0F8FF">QQ号码</td>
                              </tr>
                              <tr>
                                <td bgcolor="#FFFFFF">用户资料客服/充值/提现</td>
                                <td bgcolor="#FFFFFF">22050616    <a href="#">[复制]</a></td>
                              </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td align="right">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td align="right">&nbsp;</td>
                          </tr>
                        </table>
        </asp:WizardStep>
    </WizardSteps>
</asp:Wizard>
