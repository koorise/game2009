<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SvcPingJia.ascx.cs" Inherits="Appraise_SvcPingJia" %>
<style type="text/css">
    .style1
    {
        height: 19px;
    }
</style>
<div class="cont">
				<h1>给客服评价</h1>
				
				
				<p>&nbsp;</p>
				<table width="100%" border="0" cellpadding="20" cellspacing="1" class="list">

                  <tr>
                    <td align="center"><table border="0" cellpadding="4" cellspacing="1" class="conttable2">
                      <tr>
                        <th scope="col"><strong>对白班客服进行评价：</strong>(如果他没有参与交易请勿评价)</th>
                      </tr>
                      <tr>
                        <td><table border="0" cellpadding="0" cellspacing="0" class="fen">

                          <tr>
                            <td align="center">&nbsp;</td>
                            <td align="center"><img src="images/4fen.gif" width="39" height="39" vspace="4" /></td>
                            <td align="center"><img src="images/3fen.gif" width="39" height="39" vspace="4" /></td>
                            <td align="center"><img src="images/2fen.gif" width="39" height="39" vspace="4" /></td>
                            <td align="center"><img src="images/1fen.gif" width="39" height="39" vspace="4" /></td>
                            <td class="orange">没有介入交易</td>
                          </tr>
                          <tr>
                            <td width="40" align="center" class="style1"></td>
                            <td width="120" align="center" class="style1">非常满意</td>
                            <td width="120" align="center" class="style1">满意</td>
                            <td width="120" align="center" class="style1">一般</td>
                            <td width="120" align="center" class="style1">不满意</td>
                            <td width="120" class="style1">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="center" valign="middle">&nbsp;</td>
                            <td align="center" valign="middle" colspan="5">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                    RepeatDirection="Horizontal" Width="80%">
                                    <asp:ListItem Value="4">非常满意</asp:ListItem>
                                    <asp:ListItem Value="3">满意</asp:ListItem>
                                    <asp:ListItem Value="2">一般</asp:ListItem>
                                    <asp:ListItem Value="1">不满意</asp:ListItem>
                                    <asp:ListItem Value="0">不评价</asp:ListItem>
                                </asp:RadioButtonList>
                                                    </td>
                          </tr>
                          
                        </table></td>
                      </tr>
                      <tr>
                        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="fen">

                          <tr>
                            <td width="60" valign="top"><strong>内容</strong></td>
                            <td align="left" class="cont1"><p>
                                <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </p>
                            <p class="hui">已输入<span class="red">0</span>字 还可以输入<span class="red">500</span>字</p>
                            <p>如果不是非常满意，必须填写内容，至少10个字 </p></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <th><strong>对夜班客服进行评价：</strong>(如果他没有参与交易请勿评价)</th>
                      </tr>
                      <tr>
                        <td><table border="0" cellpadding="0" cellspacing="0" class="fen">
                          <tr>
                            <td align="center">&nbsp;</td>
                            <td align="center"><img src="images/4fen.gif" width="39" height="39" vspace="4" /></td>
                            <td align="center"><img src="images/3fen.gif" width="39" height="39" vspace="4" /></td>
                            <td align="center"><img src="images/2fen.gif" width="39" height="39" vspace="4" /></td>
                            <td align="center"><img src="images/1fen.gif" width="39" height="39" vspace="4" /></td>
                            <td class="orange">没有介入交易</td>
                          </tr>
                          <tr>
                            <td width="40" align="center" class="orange">&nbsp;</td>
                            <td width="120" align="center" class="orange">非常满意</td>
                            <td width="120" align="center" class="orange">满意</td>
                            <td width="120" align="center" class="orange">一般</td>
                            <td width="120" align="center" class="orange">不满意</td>
                            <td width="120" class="orange">不评价</td>
                          </tr>
                          <tr>
                            <td align="center" valign="middle">&nbsp;</td>
                            <td align="center" valign="middle" colspan="5">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                    RepeatDirection="Horizontal" Width="80%">
                                    <asp:ListItem Value="4">非常满意</asp:ListItem>
                                    <asp:ListItem Value="3">满意</asp:ListItem>
                                    <asp:ListItem Value="2">一般</asp:ListItem>
                                    <asp:ListItem Value="1">不满意</asp:ListItem>
                                    <asp:ListItem Value="0">不评价</asp:ListItem>
                                </asp:RadioButtonList>
                                                    </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="fen">
                          <tr>
                            <td width="60" valign="top"><strong>内容</strong></td>
                            <td align="left" class="cont1"><p>
                                <asp:TextBox ID="TextBox2" TextMode="MultiLine" runat="server"></asp:TextBox>
                              </p>
                                <p class="hui">已输入<span class="red">0</span>字 还可以输入<span class="red">500</span>字</p>
                              <p>如果不是非常满意，必须填写内容，至少10个字 </p></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <th><strong>对交易员进行评价：</strong>(交易速度，交易专业性等做出评分)</th>
                      </tr>
                      <tr>
                        <td><table border="0" cellpadding="0" cellspacing="0" class="fen">
                          <tr>
                            <td align="center">&nbsp;</td>
                            <td align="center"><img src="images/4fen.gif" width="39" height="39" vspace="4" /></td>
                            <td align="center"><img src="images/3fen.gif" width="39" height="39" vspace="4" /></td>
                            <td align="center"><img src="images/2fen.gif" width="39" height="39" vspace="4" /></td>
                            <td align="center"><img src="images/1fen.gif" width="39" height="39" vspace="4" /></td>
                          </tr>
                          <tr>
                            <td width="40" align="center" class="orange">&nbsp;</td>
                            <td width="120" align="center" class="orange">非常满意</td>
                            <td width="120" align="center" class="orange">满意</td>
                            <td width="120" align="center" class="orange">一般</td>
                            <td width="120" align="center" class="orange">不满意</td>
                          </tr>
                          <tr>
                            <td align="center" valign="middle">&nbsp;</td>
                            <td align="center" valign="middle" colspan="4">
                                <asp:RadioButtonList ID="RadioButtonList3" runat="server" 
                                    RepeatDirection="Horizontal" Width="80%">
                                    <asp:ListItem Value="4">非常满意</asp:ListItem>
                                    <asp:ListItem Value="3">满意</asp:ListItem>
                                    <asp:ListItem Value="2">一般</asp:ListItem>
                                    <asp:ListItem Value="1">不满意</asp:ListItem>
                                </asp:RadioButtonList>
                                                    </td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="fen">
                          <tr>
                            <td width="60" valign="top"><strong>内容</strong></td>
                            <td align="left" class="cont1"><p>
                                <asp:TextBox ID="TextBox3" TextMode="MultiLine" runat="server"></asp:TextBox>
                              </p>
                                <p class="hui">已输入<span class="red">0</span>字 还可以输入<span class="red">500</span>字</p>
                              <p>如果不是非常满意，必须填写内容，至少10个字 </p></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table>                    
                      <p>&nbsp;</p>
                      <p>&nbsp;</p>
                      <p>
                        <label>
                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/btn_querentijiao.gif" 
                              runat="server" onclick="ImageButton1_Click" />
                        </label>
                      </p>
                      <p>&nbsp;</p>
                    </td>
                  </tr>
                </table>
				
				</div>