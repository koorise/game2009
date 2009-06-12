<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Charge_ICBC.ascx.cs" Inherits="ChargeAndCash_Charge_ICBC" %>
<dd id="wydd">
<asp:Wizard ID="ChargeWizard" DisplaySideBar="False" runat="server" OnNextButtonClick="ChargeWizard_NextButtonClick"
    OnActiveStepChanged="ChargeWizard_ActiveStepChanged">
    <WizardSteps>
        <asp:WizardStep ID="InputOrder2" runat="server" StepType="Start" Title="填写金额">
            <div class="step">
							<ul>
								<li class="focus"><img src="images/cz_10.gif" width="22" height="22" hspace="10" align="absmiddle" />选择银行填写金额</li>
								<li><img src="images/cz_2.gif" width="22" height="22" hspace="10" align="absmiddle" />确认充值信息</li>
								<li><img src="images/cz_3.gif" width="22" height="22" hspace="10" align="absmiddle" />进入网银充值页面充值</li>
								<li style="border:none;"><img src="images/cz_4.gif" width="22" height="22" hspace="10" align="absmiddle" />联系客服确认成功</li>
							</ul>
					  </div>
					  <div class="cont">
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td width="150" height="40">&nbsp;</td>
                            <td valign="bottom">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">选择网上银行:</td>
                            <td><img src="images/icbc.gif" width="206" height="41" align="absmiddle" alt="" /> <img src="images/wsxf.gif" width="156" height="23" hspace="10" alt="" /></td>
                          </tr>
                          <tr>
                            <td height="40" align="right"><span class="f14">请输入充值金额：</span></td>
                            <td><span class="f14">
                              <asp:TextBox ID="txt_price2" Text="0" runat="server" />
                            <strong class="red">元</strong></span> （请填写正确的金额，最多2位小数） <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_price2" ErrorMessage="金额必须输入"></asp:RequiredFieldValidator></td>
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
                        </table></div>
        </asp:WizardStep>
        <asp:WizardStep ID="ConfirmOrder2" runat="server" StepType="Step" Title="确认充值信息">
            <div class="step">
							<ul>
								<li><img src="images/cz_1.gif" width="22" height="22" hspace="10" align="absmiddle" />选择银行填写金额</li>
								<li class="focus"><img src="images/cz_20.gif" width="22" height="22" hspace="10" align="absmiddle" />确认充值信息</li>
								<li><img src="images/cz_3.gif" width="22" height="22" hspace="10" align="absmiddle" />进入网银充值页面充值</li>
								<li style="border:none;"><img src="images/cz_4.gif" width="22" height="22" hspace="10" align="absmiddle" />联系客服确认成功</li>
							</ul>
					  </div>
					  <div class="cont">
            <table width="85%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td align="right" class="f14">&nbsp;</td>
                            <td align="left" class="f14">&nbsp;</td>
                          </tr>
                          <tr>
                            <td width="25%" height="40" align="right" class="f14">充值金额：</td>
                            <td width="75%" height="40" align="left" class="f14">  <asp:Label ID="txt_price22" runat="server" CssClass="money" /> 元</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">实际支付：</td>
                            <td height="40" align="left" class="f14"><asp:Label ID="txt_price222" runat="server" CssClass="money" /> 元</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">选择支付方式：</td>
                            <td height="40" align="left" class="f14"><img src="images/icbc.gif" width="206" height="41" alt="" /></td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">工行账号：</td>
                            <td height="40" class="f14"><asp:Label ID="txt_icbcnum" runat="server" /> <img src="images/wsxf.gif" width="156" height="23" align="absmiddle" alt="" /></td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">账户户名：</td>
                            <td height="40" class="f14"><asp:Label ID="txt_icbcname" runat="server" /></td>
                          </tr>
                          <tr>
                            <td height="40">&nbsp;</td>
                            <td height="40"><a href="http://www.icbc.com.cn" target="_blank"><img src="images/gotopay.gif" width="166" height="29" alt="" /></a><asp:ImageButton ID="StepNextButton" runat="server" CommandName="MoveNext" ImageUrl="~/images/sp2svc.gif" width="224" height="29" border="0" /></td>
                          </tr>
                          <tr>
                            <td height="40" colspan="2"><div class="tips"><strong>易站小贴士：</strong>请务必确认汇款成功后再通知客服，否则您的充值订单审核可能会失败，您还需要重新进行充值操作</div></td>
                          </tr>
                          
                          <tr>
                            <td height="40" colspan="2">&nbsp;</td>
                          </tr>
                        </table></div>
        </asp:WizardStep>
        <asp:WizardStep ID="FinishOrder2" runat="server" StepType="Complete" Title="充值成功">
            <div class="step">
							<ul>
								<li><img src="images/cz_1.gif" width="22" height="22" hspace="10" align="absmiddle" />选择银行填写金额</li>
								<li><img src="images/cz_2.gif" width="22" height="22" hspace="10" align="absmiddle" />确认充值信息</li>
								<li><img src="images/cz_3.gif" width="22" height="22" hspace="10" align="absmiddle" />进入网银充值页面充值</li>
								<li class="focus" style="border:none;"><img src="images/cz_40.gif" width="22" height="22" hspace="10" align="absmiddle" />联系客服确认成功</li>
							</ul>
					  </div>
					  <div class="cont">
            <table width="75%" border="0" align="center" cellpadding="0" cellspacing="6">
                          <tr>
                            <td width="100" height="4" align="right">&nbsp;</td>
                            <td width="467" height="4">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="40" align="right" class="f14">选择支付方式：</td>
                            <td height="40" align="left" class="f14"><img src="images/icbc.gif" width="206" height="41" alt="" /></td>
                          </tr>
                          <tr>
                            <td height="40" align="center" class="money">&nbsp;</td>
                            <td height="40" align="left" class="money">充值申请提交成功！</td>
                          </tr>
                          <tr>
                            <td height="40" colspan="2" class="greenbox"><label><img src="images/ico_ok.gif" width="27" height="27" hspace="10" align="absmiddle" alt="" /><strong>客服已收到通知，15分钟内为您核实并处理充值事务。</strong></label></td>
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
                                <td bgcolor="#FFFFFF"><asp:Label ID="txt_servicename" runat="server" /></td>
                                <td bgcolor="#FFFFFF"><asp:Label ID="txt_servicenum" runat="server" />    <a href="#" onclick="copyToClip()">[复制]</a></td>
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
                        </table></div>
        </asp:WizardStep>
    </WizardSteps>
    <StartNavigationTemplate></StartNavigationTemplate>
    <StepNavigationTemplate></StepNavigationTemplate>
    <FinishNavigationTemplate></FinishNavigationTemplate>
</asp:Wizard>
</dd>