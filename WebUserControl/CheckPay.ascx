<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CheckPay.ascx.cs" Inherits="WebUserControl_CheckPay" %>
<%@ Register Src="CustomerService.ascx" TagName="CustomerService" TagPrefix="uc1" %>
<asp:Wizard ID="CheckPayWizard" DisplaySideBar="False" runat="server" OnActiveStepChanged="CheckPayWizard_ActiveStepChanged"
    OnNextButtonClick="CheckPayWizard_NextButtonClick">
    <WizardSteps>
        <asp:WizardStep ID="InputOrder" runat="server" StepType="Start" Title="填写订单">
            <div class="main">
                <dl class="paybox">
                    <dt>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/pay_title1.gif">
                            <tr>
                                <td width="6%">
                                    &nbsp;
                                </td>
                                <td width="26%" align="center" class="un">
                                    1.填写订单
                                </td>
                                <td width="32%" align="center">
                                    2.支付订单
                                </td>
                                <td width="28%" align="center">
                                    3. 取货
                                </td>
                                <td width="8%">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </dt>
                    <dd>
                        <ul>
                            <li><span class="lable">商品信息：</span>
                                <asp:HyperLink ID="GameName1" runat="server"></asp:HyperLink><asp:Label ID="GameType1"
                                    CssClass="red" runat="server"></asp:Label>
                            </li>
                            <li><span class="lable">商品价格：</span>
                                <asp:Label ID="PayValue1" runat="server"></asp:Label>
                            </li>
                            <li><span class="lable">QQ：</span>
                                <asp:TextBox ID="txtQQ" runat="server"></asp:TextBox>请填写客服可以联系到您的QQ号码 </li>
                            <li class="noboder"><span class="lable">电话：</span>
                                <asp:TextBox ID="txtTele" runat="server"></asp:TextBox>建议填写手机号，固话小灵通请加区号，如：0471-8888888
                            </li>
                        </ul>
                    </dd>
                </dl>
            </div>
            <div id="pop" class="pop">
                <div class="win">
                    <div class="title">
                        <img src="images/ico_alert.gif" width="17" height="17" align="absmiddle" /><strong>
                            游戏易站账号交易提醒</strong> -<span style="color: #FF0000"> 账号交易买家购买协议</span></div>
                    <div class="cont">
                        <p>
                            游戏易站账号交易免责声明：</p>
                        <p>
                            1.由于账号的特殊性，游戏易站只能确保账号成功交易，不能保证账号交易完毕后的安全性，所以凡通过游戏易<br />
                            站网站购买的账号，即表示买家同意游戏易站《账号交易买家购买协议》，将接受购买完毕后可能存在的风险，<br />
                            如被盗、卖家恶意找回等</p>
                        <p>
                            &nbsp;</p>
                        <p>
                            2.此协议是游戏易站处理账号交易纠纷的凭证。请买家购买前仔细阅读，若不认同此协议请勿购买，以免导致不<br />
                            必要的纠纷。</p>
                        <p>
                            &nbsp;</p>
                        <p>
                            3.交易成功后，游戏易站将向买家提供卖家注册资料中的联系方式，购买账号后若出现任何问题，请买家直接联<br />
                            系卖家解决。</p>
                        <p>
                            &nbsp;</p>
                        <p>
                            4.游戏易站推举购买卖家自己练成的成号，安全性将大大提高<br />
                        </p>
                        <div align="center">
                            <label class="">
                                <span id="readTime"></span>我已阅读以上协议</label></div>
                        <div align="center">
                            <asp:Button ID="btnApply" Style="background-position: center center; background-image: url(images/btn_accept.gif);
                                background-repeat: no-repeat" runat="server" Width="182" Height="31" hspace="5"
                                vspace="5" />
                            <asp:Button ID="btnCancel" Style="background-position: center center; background-image: url(images/btn_unaccept.gif);
                                background-repeat: no-repeat" runat="server" Width="182" Height="31" hspace="5"
                                vspace="5" /></div>
                    </div>
                </div>
            </div>
        </asp:WizardStep>
        <asp:WizardStep ID="PayOrder" runat="server" StepType="Step" Title="支付订单">
            <div class="main">
                <dl class="paybox">
                    <dt>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/pay_title2.gif">
                            <tr>
                                <td width="6%">
                                    &nbsp;
                                </td>
                                <td width="26%" align="center" class="done">
                                    1.填写订单
                                </td>
                                <td width="32%" align="center" class="un">
                                    2.支付订单
                                </td>
                                <td width="28%" align="center">
                                    3. 取货
                                </td>
                                <td width="8%">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </dt>
                    <dd>
                        <ul>
                            <li><span class="lable">商品信息：</span>
                                <asp:HyperLink ID="GameName2" runat="server"></asp:HyperLink><asp:Label ID="GameType2"
                                    CssClass="red" runat="server"></asp:Label>
                            </li>
                            <li><span class="lable">您的易站帐户余额：</span>
                                <asp:Label ID="UserValue" runat="server"></asp:Label>
                            </li>
                            <li><span class="lable">需支付：</span>
                                <asp:Label ID="PayValue2" runat="server"></asp:Label>
                            </li>
                            <li><span class="lable">请选择密保问题：</span>
                                <asp:DropDownList ID="dropQuestion" runat="server">
                                </asp:DropDownList>
                            </li>
                            <li class="noboder"><span class="lable">请输入您的答案：</span>
                                <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
                            </li>
                        </ul>
                    </dd>
                </dl>
            </div>
        </asp:WizardStep>
        <asp:WizardStep ID="GetGoods" runat="server" StepType="Finish" Title="取货" AllowReturn="false">
            <div class="main">
                <dl class="paybox">
                    <dt>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/pay_title3.gif">
                            <tr>
                                <td width="6%">
                                    &nbsp;
                                </td>
                                <td width="26%" align="center" class="done">
                                    1.填写订单
                                </td>
                                <td width="32%" align="center" class="done">
                                    2.支付订单
                                </td>
                                <td width="28%" align="center" class="un">
                                    3. 取货
                                </td>
                                <td width="8%">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </dt>
                    <dd>
                        <table width="800" border="0" align="center" cellpadding="20" cellspacing="8" style="margin: 0px auto;">
                            <tr>
                                <td valign="top" class="bluebox">
                                    <div>
                                        帐号信息
                                    </div>
                                </td>
                                <td width="200" rowspan="2" valign="top" style="padding: 0px;">
                                    <uc1:CustomerService runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="tips">
                                    游戏易站工作人员任何情况下都不会向您索要您的易站账号密码，密保问题，答案，注册邮箱<br />
                                    等个人信息，谨防受骗
                                </td>
                            </tr>
                        </table>
                    </dd>
                </dl>
            </div>
        </asp:WizardStep>
    </WizardSteps>
    <StartNavigationTemplate>
        <div align="center">
            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Style="background-position: center center;
                background-image: url(images/btn_confirmpay.gif); background-repeat: no-repeat"
                Width="101" Height="30" vspace="10" /></div>
    </StartNavigationTemplate>
    <StepNavigationTemplate>
        <div align="center">
            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Style="background-position: center center;
                background-image: url(images/btn_qdzf.gif); background-repeat: no-repeat" Width="101"
                Height="30" vspace="10" /></div>
    </StepNavigationTemplate>
    <FinishNavigationTemplate>
    </FinishNavigationTemplate>
</asp:Wizard>
