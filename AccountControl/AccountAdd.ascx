<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountAdd.ascx.cs" Inherits="AccountControl_AccountAdd" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<div class="cont">
				<h1>
                    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
                    </asp:ScriptManagerProxy>
                    出售账号（拍卖）编号：<asp:Label ID="lblPNKID" runat="server"></asp:Label>
                </h1>
				<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" class="bluebox">
                  <tr>
                    <td colspan="2" align="left" nowrap="nowrap" bgcolor="#DCEDFC" class="viewtd2"><strong>账号基本信息</strong></td>
                  </tr>
                  <tr>
                    <td width="111" align="right" nowrap="nowrap"><span class="red">*</span> <span class="blue">出售模式：</span></td>
                    <td width="634">
                        <asp:RadioButtonList ID="rdBtnSaleType" runat="server" AutoPostBack="True" 
                            RepeatDirection="Horizontal" 
                            onselectedindexchanged="rdBtnSaleType_SelectedIndexChanged">
                            <asp:ListItem Value="1">单个出售</asp:ListItem>
                            <asp:ListItem Value="2">批量出售</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap">
                        
                        <span class="red">*</span> <span class="blue">请选择：</span></td>
                    <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                        <asp:DropDownList ID="ddlGame" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlGame_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlServer" runat="server">
                            <asp:ListItem Value="0">服务器</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlJob" runat="server">
                            <asp:ListItem Value="0">职业</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlLevel" runat="server">
                            <asp:ListItem Value="0">等级</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlRace" runat="server">
                            <asp:ListItem Value="0">种族</asp:ListItem>
                        </asp:DropDownList>  
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlGame" 
                                EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    </td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap"><span class="red">* </span><span class="blue">信息标题：</span></td>
                    <td>
                        <asp:TextBox ID="tbTitle" runat="server" MaxLength="30" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="tbTitle" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                        <span class="msg">不得超过30个字</span></td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap"><span class="red">*</span> <span class="blue">交易类型：</span><br /></td>
                    <td><label>
                        <asp:RadioButtonList ID="rdBtnSaleMethod" runat="server" AutoPostBack="True" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Value="2">担保</asp:ListItem>
                            <asp:ListItem Value="1">寄售</asp:ListItem>
                            <asp:ListItem Value="3">中介</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                  </tr>
                  <tr>
                    <td align="right" valign="top" nowrap="nowrap"><span class="red">* </span><span class="blue">详细说明：</span></td>
                    <td align="left" nowrap="nowrap">
                        <asp:TextBox ID="tbProductDetail" runat="server" Columns="50" Rows="5" 
                            TextMode="MultiLine"></asp:TextBox>
                        <strong>
                      &nbsp;</strong><asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                            runat="server" ControlToValidate="tbProductDetail" ErrorMessage="*" 
                            ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap"><span class="msg">已输入0字 还可以输入500字</span></td>
                  </tr>
                    
                  <tr>
                    <td colspan="2" align="center" nowrap="nowrap">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                    <asp:Panel ID="PanelZhongJie" Visible="false" runat="server">
                    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" colspan="2">
                    <tr>
                    <td width="111" align="right" nowrap="nowrap">
                    <p><span class="red">* </span>交易密码：<a href="#" onmouseover="showTip()" onmouseout="$('.popmsg').hide();"><img src="images/ico_qu.gif" width="14" height="14" border="0" align="absmiddle" /></a></p>
                    </td>
                    <td width="634"  align="left"><asp:TextBox ID="tbFastKey1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="tbFastKey1" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                      <span class="msg">6-12个数字、字母</span></td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left">将这个交易密码和发布完成后的交易链接，发给买家，即可开始中介流程</td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap" ><span class="red">*</span> 确认交易密码：</td>
                    <td width="634"  align="left" >
                        <asp:TextBox ID="tbFastKey2" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" 
                            ControlToCompare="tbFastKey1" ControlToValidate="tbFastKey2" ErrorMessage="*" 
                            ValidationGroup="A"></asp:CompareValidator>
                      </td>
                  </tr>
                  </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelisNum" Visible="false" runat="server">
                   <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" colspan="2">
                    <tr>
                    <td width="111" align="right" nowrap="nowrap">
                    <p><span class="red">* </span>数量：</p>
                    </td>
                    <td width="634"  align="left">
                    <asp:TextBox ID="tbisNum" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="tbisNum" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="tbisNum" ErrorMessage="*" 
                            ValidationExpression="^[0-9]*[1-9][0-9]*$" ValidationGroup="A"></asp:RegularExpressionValidator>
                        </td>
                  </tr>
                  </table>
                   </asp:Panel>
                        <asp:Panel ID="PanelSingleDanBao" Visible="False" runat="server">
                        <table width="90%" border="0" cellspacing="0" cellpadding="5">
                       <tr>
        <td width="27%" align="right" class="td1 blue"><span class="red">*</span> 是否有密码保护资料：<br /></td>
        <td width="73%" align="left" class="td1">
            <asp:RadioButtonList ID="rBTNAccountPassPort1" runat="server" 
                RepeatDirection="Horizontal">
                <asp:ListItem Value="true">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="false">否</asp:ListItem>
            </asp:RadioButtonList>
          </td>
      </tr>
      <tr>
        <td align="right" class="td1 blue"><span class="red">*</span> 是否有邮箱资料：<br /></td>
        <td align="left" class="td1">
            <asp:RadioButtonList ID="rBTNAccountMail1" runat="server" 
                RepeatDirection="Horizontal">
                <asp:ListItem Value="true">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="false">否</asp:ListItem>
            </asp:RadioButtonList>
          </td>
      </tr>
      <tr>
        <td align="right" class="td1 blue">是否有注册黄图：<br /></td>
        <td align="left"  class="td1">
            <asp:RadioButtonList ID="rBTNAccountYellowPage1" runat="server" 
                RepeatDirection="Horizontal">
                <asp:ListItem Value="true">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="false">否</asp:ListItem>
            </asp:RadioButtonList>
          </td>
      </tr>
      <tr>
        <td align="right" class="td1 blue" nowrap="nowrap">加入易站账号交易次数验证系统： </td>
        <td align="left" class="td1">
            <asp:RadioButtonList ID="rBTNAccountIsDisplay" runat="server" 
                RepeatDirection="Horizontal">
                <asp:ListItem Value="true">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="false">否</asp:ListItem>
            </asp:RadioButtonList>
          </td>
      </tr>
      <tr>
        <td align="right" class="td2 blue" nowrap="nowrap">验证系统：</td>
        <td align="left" class="td2">
            <strong>请输入游戏账号登录名 
            <asp:TextBox ID="tbAccountName1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                ControlToValidate="tbAccountName1" ErrorMessage="*" ValidationGroup="D"></asp:RequiredFieldValidator>
            &nbsp;</strong><asp:Label ID="lblChkResult1" runat="server" ForeColor="#CC3300"></asp:Label>
          </td>
      </tr>
      <tr>
        <td align="right" class="td2">&nbsp;</td>
        <td align="left" class="td2">
            <asp:Button ID="btnAccountDisplayChk" runat="server" Text="检测" 
                ValidationGroup="D" />
            <strong>&nbsp;</strong><span class="blue">首次出售的物品更容易在易站成交</span></td>
      </tr>
                        <tr>
                          <td align="left" class="td2" colspan="2">
                              <p>
                                  注：必须输入真实的登录名，成交后卖家在提交账号资料页面该登录名为默认游戏登录名，且不可修改。由于<br />
                                  填写虚假登录名而导致交易失败的，责任将归咎于卖家。</p>
                            </td>
                        </tr>
                        <tr>
                          <td align="right" class="td1"><span class="blue">注册时间：</span></td>
                          <td align="left" class="td1">
                              <asp:TextBox ID="tbAccountTimeReg1" runat="server"></asp:TextBox>
                              <strong>&nbsp;</strong><cc1:MaskedEditExtender ID="MaskedEditExtender1" 
                                  runat="server" Mask="9999-99-99 99:99" MaskType="DateTime" 
                                  TargetControlID="tbAccountTimeReg1" UserDateFormat="YearMonthDay" 
                                  UserTimeFormat="TwentyFourHour">
                              </cc1:MaskedEditExtender>
                            </td>
                        </tr>
                        <tr>
                          <td align="right" class="td1"><span class="blue">到期时间：</span></td>
                          <td align="left" class="td1">
                              <asp:TextBox ID="tbAccountTimeEnd1" runat="server"></asp:TextBox>
                              <strong>
                            &nbsp;<cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" 
                                  Mask="9999-99-99 99:99" MaskType="DateTime" TargetControlID="tbAccountTimeEnd1" 
                                  UserDateFormat="YearMonthDay" UserTimeFormat="TwentyFourHour">
                              </cc1:MaskedEditExtender>
                              </strong></td>
                        </tr>
                        <tr>
                          <td align="right" class="td1"><span class="blue">最后到期：</span></td>
                            <td align="left" class="td1">
                                <asp:TextBox ID="tbAccountTimeLastLogin1" runat="server"></asp:TextBox>
                                <strong>&nbsp;<strong><cc1:MaskedEditExtender ID="MaskedEditExtender3" 
                                    runat="server" Mask="9999-99-99 99:99" MaskType="DateTime" 
                                    TargetControlID="tbAccountTimeLastLogin1" UserDateFormat="YearMonthDay" 
                                    UserTimeFormat="TwentyFourHour">
                                </cc1:MaskedEditExtender>
                                </strong></strong></td>
                        </tr>
                    </table>
                        </asp:Panel>

                           
                        <asp:Panel ID="PanelSingleJiShou" Visible="false" runat="server">
                        <table width="90%" border="0" cellpadding="0" cellspacing="0" class="pminfo">
  <tr>
    <th>基本信息</th>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="5">
      <tr>
        <td width="27%" align="right" class="blue"><span class="red">*</span> 游戏账号： </td>
        <td width="73%" align="left">
            <asp:TextBox ID="tbAccountName2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="tbAccountName2" ErrorMessage="*" ValidationGroup="B"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tbAccountName2" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
          </td>
      </tr>
      <tr>
        <td align="right" class="blue"><span class="red">*</span> 确认游戏账号：</td>
        <td align="left">
            <asp:TextBox ID="tbAccountName22" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                ControlToCompare="tbAccountName2" ControlToValidate="tbAccountName22" 
                ErrorMessage="*" ValidationGroup="B"></asp:CompareValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="tbAccountName2" ControlToValidate="tbAccountName22" 
                ErrorMessage="*" ValidationGroup="A"></asp:CompareValidator>
            &nbsp;<asp:Button ID="btnAccountDisplayChk2" runat="server" Text="检测" ValidationGroup="B" 
                onclick="btnAccountDisplayChk2_Click" />
          </td>
      </tr>
      <tr>
        <td align="right" class="blue">&nbsp;</td>
        <td align="left" class="red">
            <asp:Label ID="lblChkResult2" runat="server"></asp:Label>
          </td>
      </tr>
      <tr>
        <td align="right" class="blue">&nbsp;</td>
        <td align="left" class="orange">
		<div class="tips" style="width:300px; float:left;">
		<strong>易站小贴士：</strong>首次出售的物品更容易在易站成交
		</div>
		</td>
      </tr>
        <asp:Panel ID="PanelPassWD" runat="server">
      <tr>
        <td align="right" class="blue"><span class="red">*</span> 游戏密码： </td>
        <td align="left">
            <asp:TextBox ID="tbAccountPassWD2" runat="server"></asp:TextBox>
          </td>
      </tr>
      <tr>
        <td align="right" class="blue"><span class="red">*</span> 确认游戏密码： </td>
        <td align="left">
            <asp:TextBox ID="tbAccountPassWD22" runat="server"></asp:TextBox>
          </td>
      </tr>
      <tr>
        <td align="right" class="blue"><span class="red">*</span> 游戏角色名： </td>
        <td align="left">
            <asp:TextBox ID="tbAccountRoleName2" runat="server"></asp:TextBox>
          </td>
      </tr>
      <tr>
        <td align="right" class="blue"><span class="red">*</span> 确认游戏角色名： </td>
        <td align="left">
            <asp:TextBox ID="tbAccountRoleName22" runat="server"></asp:TextBox>
          </td>
      </tr>
      </asp:Panel>
      <tr>
        <td align="right" class="blue">注册时间：</td>
        <td align="left">
            <asp:TextBox ID="tbAccountTimeReg2" runat="server"></asp:TextBox>
            <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" 
                Mask="9999-99-99 99:99" MaskType="DateTime" TargetControlID="tbAccountTimeReg2" 
                UserDateFormat="YearMonthDay" UserTimeFormat="TwentyFourHour">
            </cc1:MaskedEditExtender>
          </td>
      </tr>
      <tr>
        <td align="right" class="blue">到期时间：</td>
        <td align="left">
            <asp:TextBox ID="tbAccountTimeEnd2" runat="server"></asp:TextBox>
            <cc1:MaskedEditExtender ID="MaskedEditExtender5" runat="server" 
                Mask="9999-99-99 99:99" MaskType="DateTime" TargetControlID="tbAccountTimeEnd2" 
                UserDateFormat="YearMonthDay" UserTimeFormat="TwentyFourHour">
            </cc1:MaskedEditExtender>
          </td>
      </tr>
      <tr>
        <td align="right" class="blue">最后登录：</td>
        <td align="left">
            <asp:TextBox ID="tbAccountTimeLastLogin2" runat="server"></asp:TextBox>
            <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" 
                Mask="9999-99-99 99:99" MaskType="DateTime" 
                TargetControlID="tbAccountTimeLastLogin2" UserDateFormat="YearMonthDay" 
                UserTimeFormat="TwentyFourHour">
            </cc1:MaskedEditExtender>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <th>安全资料</th>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
      <tr>
        <td width="27%" align="right" class="blue"><span class="red">*</span> 是否有密码保护资料：<br /></td>
        <td width="73%" align="left">
            <asp:RadioButtonList ID="rBTNAccountPassPort2" runat="server" 
                RepeatDirection="Horizontal" AutoPostBack="True" 
                onselectedindexchanged="rBTNAccountPassPort2_SelectedIndexChanged">
                <asp:ListItem Value="true">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="false">否</asp:ListItem>
            </asp:RadioButtonList>
          </td>
      </tr>
      <asp:Panel ID="PanelAccountPassPort" Visible="false" runat="server">
      <tr>
        <td align="right" class="b1 blue"><span class="red">*</span> 密码保护问题：<br /></td>
        <td align="left" class="b1">
            <asp:TextBox ID="tbAccountPassPortQuestion2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="A" ControlToValidate="tbAccountPassPortQuestion2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
          </td>
      </tr>
      <tr>
        <td align="right" class="b1 blue"><span class="red">*</span> 密码保护答案：<br /></td>
        <td align="left" class="b1">
            <asp:TextBox ID="tbAccountPassPortAnswer2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="A" ControlToValidate="tbAccountPassPortAnswer2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>

          </td>
      </tr>
      <tr>
        <td align="right" class="b1 blue"><span class="red">*</span> 确认密码保护答案：<br /></td>
        <td align="left" class="b1">
            <asp:TextBox ID="tbAccountPassPortAnswer22" runat="server"></asp:TextBox>
            <asp:CompareValidator
                ID="CompareValidator4" runat="server" ErrorMessage="*" ValidationGroup="A" ControlToCompare="tbAccountPassPortAnswer2" ControlToValidate="tbAccountPassPortAnswer22"></asp:CompareValidator>
          </td>
      </tr>
      </asp:Panel>
      <tr>
        <td align="right" class="blue"><span class="red">*</span> 是否有邮箱资料：<br /></td>
        <td align="left">
            <asp:RadioButtonList ID="rBTNAccountMail2" runat="server" 
                RepeatDirection="Horizontal" AutoPostBack="True" 
                onselectedindexchanged="rBTNAccountMail2_SelectedIndexChanged">
                <asp:ListItem Value="true">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="false">否</asp:ListItem>
            </asp:RadioButtonList>
          </td>
      </tr>
        <asp:Panel ID="PanelAccountMail" Visible="false" runat="server">
      <tr>
        <td align="right" class="b1 blue"><span class="red">*</span> 邮箱地址：<br /></td>
        <td align="left" class="b1">
            <asp:TextBox ID="tbAccountMailAddress2" runat="server"></asp:TextBox>
          </td>
      </tr>
      <tr>
        <td align="right" class="b1 blue"><span class="red">*</span> 邮箱密码：</td>
        <td align="left" class="b1">
            <asp:TextBox ID="tbAccountMailPassWD2" runat="server"></asp:TextBox>
          </td>
      </tr>
      <tr>
        <td align="right" class="b1 blue"><span class="red">*</span> 邮箱资料：<br /></td>
        <td align="left" class="b1">
            <asp:TextBox ID="tbAccountMailInfo2" runat="server"></asp:TextBox>
          </td>
      </tr>
      </asp:Panel>
      <tr>
        <td align="right" class="blue">是否有注册黄图</td>
        <td align="left">
            <asp:RadioButtonList ID="rBTNAccountYellowPage2" runat="server" 
                RepeatDirection="Horizontal" AutoPostBack="True" 
                onselectedindexchanged="rBTNAccountYellowPage2_SelectedIndexChanged">
                <asp:ListItem Value="true">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="false">否</asp:ListItem>
            </asp:RadioButtonList></td>
      </tr>
        <asp:Panel ID="PanelAccountYellowPage" Visible="false" runat="server">
          <tr>
            <td align="right" class="blue">&nbsp;</td>
            <td align="left">
                <asp:FileUpload ID="FileUpload2" runat="server" />
                </td>
          </tr>
     </asp:Panel>
    </table></td>
  </tr>
</table>
                        </asp:Panel>
                        <asp:Panel ID="PanelMulDanBao" Visible="false" runat="server">
                        </asp:Panel>
                        <asp:Panel ID="PanelMulJiShou" runat="server" Visible="False">
                        <table border="0" align="center" cellpadding="0" cellspacing="0" class="tips">
                      <tr>
                        <td><strong>易站小贴士：</strong>一次最多出售20个，最多提交30个，多出来的账号作为预备账号防止个别出错导 致交易失败。<br />
未交易的账号将被原封退回，并且游戏易站任何工作人员也不会知道密码信息，更不会向您询问 密码信息。</td>
                      </tr>
                    </table>  <br />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:GameDB %>" 
                                SelectCommand="SELECT [ID], [AccountName] FROM [gAccountInfo] WHERE ([PNKID] = @PNKID) ORDER BY [ID] asc">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblPNKID" Name="PNKID" PropertyName="Text" 
                                        Type="Decimal" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" 
                                DataSourceID="SqlDataSource1" HorizontalAlign="Center" RepeatColumns="4" 
                                Width="90%" RepeatDirection="Horizontal" 
                                onitemcommand="DataList1_ItemCommand">
                                <ItemStyle Width="25%" BorderColor="#ACD0F1" BorderWidth="1px" 
                                    CssClass="blue" />
                                <ItemTemplate>
                                <asp:Label ID="AccountNameLabel" runat="server" 
                                        Text='<%# Eval("AccountName") %>' />
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="ShanChu" CommandArgument='<%# Eval("ID") %>' 
                                        ImageUrl="~/images/Btn_del.gif" />
                                </ItemTemplate>
                            </asp:DataList>   
                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#ACD0F1">
                      <tr>
                        <td colspan="4" bgcolor="#FFFFFF">
                        <table width="90%" border="0" align="center" cellpadding="5" cellspacing="0">
                          <tr>
                            <td width="28%" height="24" align="right" class="blue">游戏账号：</td>
                            <td width="72%" class="blue" style="text-align:left;">
                                <asp:TextBox ID="tbAccountName3" runat="server" MaxLength="30"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="tbAccountName3" ErrorMessage="*" ValidationGroup="C"></asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                            <td height="24" align="right" class="blue">确认游戏账号：<br /></td>
                            <td class="blue" style="text-align:left;">
                                <asp:TextBox ID="tbAccountName33" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                    ControlToCompare="tbAccountName3" ControlToValidate="tbAccountName33" 
                                    ErrorMessage="*" ValidationGroup="C"></asp:CompareValidator>
                              </td>
                          </tr>
                          <tr>
                            <td height="24" align="right" class="blue">游戏密码：<br /></td>
                            <td class="blue" style="text-align:left;">
                                <asp:TextBox ID="tbAccountPassWD3" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="tbAccountPassWD3" ErrorMessage="*" ValidationGroup="C"></asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          
                          <tr>
                            <td height="24" align="right" class="blue">确认游戏密码：</td>
                            <td class="blue" style="text-align:left;">
                                <asp:TextBox ID="tbAccountPassWD33" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                    ControlToCompare="tbAccountPassWD3" ControlToValidate="tbAccountPassWD33" 
                                    ErrorMessage="*" ValidationGroup="C"></asp:CompareValidator>
                              </td>
                          </tr>
                          <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btnAddAccount" CssClass="btn2" runat="server" Text="添加帐号" 
                                    ValidationGroup="C" onclick="btnAddAccount_Click" /></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table>
                        </asp:Panel>
                        </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="rdBtnSaleMethod" 
                                    EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="rdBtnSaleType" 
                                    EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                  </tr>
                </table>
                     
                            
				<table width="100%" border="0" align="center" cellpadding="6" cellspacing="1" class="bluebox">
                  <tr>
                    <td colspan="2" align="left" nowrap="nowrap" bgcolor="#DCEDFC" class="viewtd2"><strong>交易选项
                  </tr>
                  <tr>
                    <td width="180" align="right" nowrap="nowrap">起价：</td>
                    <td width="568">
                        <asp:TextBox ID="tbPriceBase" runat="server">0</asp:TextBox>
                        <label>
                      &nbsp;元(选填) 
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="tbPriceBase" ErrorMessage="*" 
                            ValidationExpression="^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$" 
                            ValidationGroup="A"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator7" runat="server" 
                            ControlToValidate="tbPriceBase" ErrorMessage="*" Operator="LessThan" 
                            Type="Double" ValidationGroup="A" ValueToCompare="9999"></asp:CompareValidator>
                        <span class="msg">最多支持2位小数，不高于</span><asp:Label ID="Label2" runat="server" 
                            Text="9999"></asp:Label>
                        </label>
                      &nbsp;<label></label></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center" nowrap="nowrap">
					<div class="tips"><strong>易站小贴士：</strong>设置起价将允许多人竞拍，价高者得，系统允许您提前选择最高价成交，而无须等待到时效到期。</div></td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap"><span class="red">* </span>一口价：</td>
                    <td>
                        <asp:TextBox ID="tbPriceTop" runat="server">20</asp:TextBox>
                        <label>
                        &nbsp;元 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="tbPriceTop" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="tbPriceTop" 
                            ErrorMessage="*" Operator="LessThanEqual" Type="Double" ValidationGroup="A" 
                            ValueToCompare="9999"></asp:CompareValidator>
                            <asp:CompareValidator ID="CompareValidator9" runat="server" 
                            ControlToValidate="tbPriceTop" ErrorMessage="*" Operator="GreaterThanEqual" 
                            Type="Double" ValidationGroup="A" ValueToCompare="20"></asp:CompareValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ControlToValidate="tbPriceTop" ErrorMessage="*" 
                            ValidationExpression="^[0-9]*[1-9][0-9]*$" ValidationGroup="A"></asp:RegularExpressionValidator>
                        <span class="msg">最多支持2位小数，不低于20元，不高于9999</span></label></td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap">加价幅度：</td>
                    <td>
                        <asp:DropDownList ID="ddlPriceStep" runat="server">
                        </asp:DropDownList>
                            </td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap"><span class="red">* </span>有效时间：<br /></td>
                    <td>
                        <asp:TextBox ID="tbHours" runat="server" MaxLength="2"></asp:TextBox>
                        <label>
                      &nbsp;小时<asp:RequiredFieldValidator ID="RequiredFieldValidator13" 
                            runat="server" ControlToValidate="tbHours" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </label>&nbsp;<label><asp:CompareValidator ID="CompareValidator10" runat="server" ControlToValidate="tbHours" 
                            ErrorMessage="*" Operator="LessThanEqual" Type="Integer" ValidationGroup="A" 
                            ValueToCompare="72"></asp:CompareValidator>
                        <span class="msg">
                        <asp:CompareValidator ID="CompareValidator11" runat="server" 
                            ControlToValidate="tbHours" ErrorMessage="*" Operator="GreaterThanEqual" 
                            Type="Integer" ValidationGroup="A" ValueToCompare="1"></asp:CompareValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="tbHours" ErrorMessage="*" 
                            ValidationExpression="^[0-9]*[1-9][0-9]*$" ValidationGroup="A"></asp:RegularExpressionValidator>
                        </span></label></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="left" nowrap="nowrap" bgcolor="#DCEDFC" class="viewtd2"><strong>诚信推广计划</strong> <span class="blue">您尚未加入</span><span><a class="red" href="#">“诚信保障计划”</a></span><span class="blue">，建议立即加入，享受我们的优先服务</span></td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap"><p><span class="red">*</span> 是否加入诚信推广计划：</p>                    </td>
                    <td align="left" nowrap="nowrap">
            <asp:RadioButtonList ID="rdBtnChengXin" runat="server" 
                RepeatDirection="Horizontal">
                <asp:ListItem Value="true">是</asp:ListItem>
                <asp:ListItem Selected="True" Value="false">否</asp:ListItem>
            </asp:RadioButtonList>
                      </td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td align="left" nowrap="nowrap">您需要交纳 <span class="red">10.00 </span>元押金，您的物品将被优先显示在物品列表中免费推广，如果由于卖家的原因导致交易失<br />
                    败，押金将赔偿给买家</td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap"><span class="red">*</span> 出售协议：</td>
                    <td align="left" nowrap="nowrap"><label>
                        <asp:CheckBox ID="chkDeal" runat="server" />
&nbsp;我同意<a href="#">《游戏易站服务协议》</a></label></td>
                  </tr>
            </table>
		        <table width="100%" border="0" align="center" cellpadding="6" cellspacing="1" class="bluebox">
                  <tr>
                    <td colspan="2" align="left" nowrap="nowrap" bgcolor="#DCEDFC" class="viewtd2"><strong>售后承诺</strong> <span class="blue">易站小贴士：给予良好的售后服务承诺，非常有利于物品的顺利销售 </span></td>
                  </tr>
                  <tr>
                    <td width="100" align="right" valign="top" nowrap="nowrap">承诺内容：</td>
                    <td>
                        <asp:TextBox ID="tbPromise" runat="server" Columns="65" Rows="8" 
                            TextMode="MultiLine"></asp:TextBox>
                        <label>&nbsp;</label></td>
                  </tr>
                  
                  <tr>
                    <td align="right" nowrap="nowrap">&nbsp;</td>
                    <td class="msg">已输入0字 还可以输入500字</td>
                  </tr>
                  <tr>
                    <td align="right" nowrap="nowrap"><br /></td>
                    <td class="blue">重要提示：一诺千金。售后承诺是打消买家购买顾虑的主要因素，对物品销售有着显而易见的促进作用。同时，如果
                      收售后服务无法兑现，则是非常严重的欺诈行为，易站将针对售后承诺无法兑现的卖家，进行从重处罚。
                    易站将会定期为信誉优秀的卖家进行免费推荐！</td>
                  </tr>
                </table>
				
				<div align="center">
                    <asp:Button ID="btnSub" CssClass="btn" runat="server" 
                        Text="确认以上全部信息并提交" ValidationGroup="A" onclick="btnSub_Click" />
				</div>
		  </div>

