<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MakeOrderOK.ascx.cs" Inherits="AccountControl_MakeOrderOK" %>
<div class="main">
			<div class="pos">您的位置：首页>>我的游戏易站>>(仍)未成交的</div>
			
			<div class="cont">
				<h1>(仍)未成交的</h1>
				<div class="box">

				  <div class="view">
						  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:8px;">
                            <tr>
                              <td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
                                  <tr>
                                    <td width="1%" align="left"><img src="images/view_dd_tt_left.gif" width="6" height="30" /></td>
                                    <td width="98%" class="blue"><strong>&nbsp; 当前领先</strong></td>
                                    <td width="1%" align="right"><img src="images/view_dd_tt_right.gif" width="6" height="30" /></td>
                                  </tr>
                              </table></td>
                            </tr>
                            <tr>
                              <td class="bluebox"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="24" align="center" bgcolor="#F5F5F5">领先人                  </td>
                                  <td align="center" bgcolor="#F5F5F5">领先价格                </td>
                                  <td align="center" bgcolor="#F5F5F5">件数              </td>
                                  <td align="center" bgcolor="#F5F5F5">出价时间 </td>
                                </tr>
                                <tr>
                                  <td height="30" align="center"><asp:Literal ID="litUserName" runat="server"></asp:Literal>
&nbsp;</td>
                                  <td align="center"><span class="red"><strong>
                                      <asp:Literal ID="litPriceNow" runat="server"></asp:Literal></strong></span>元</td>
                                  <td align="center"> 
                                      <asp:Literal ID="litAccountNums" runat="server"></asp:Literal>件           </td>
                                  <td align="center">
                                      <asp:Literal ID="litOrderInTime" runat="server"></asp:Literal></td>
                                </tr>
                              </table>
                              
                              </td>
                            </tr>
                          </table>
						  <table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
								<td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
								  <tr>
									<td width="1%" align="left"><img src="images/view_dd_tt_left.gif" width="6" height="30" /></td>
									<td width="98%" class="blue"><strong>&nbsp; 订单信息</strong></td>
									<td width="1%" align="right"><img src="images/view_dd_tt_right.gif" width="6" height="30" /></td>
								  </tr>
								</table></td>
							  </tr>
							  <tr>
								<td class="bluebox"><table border="0" align="center" cellpadding="5" cellspacing="0">
								  <tr>
									<td width="75" align="right" nowrap="nowrap" class="viewtd2">物品标题：                                                       </td>
									<td colspan="3" class="viewtd2">
                                        <asp:HyperLink ID="hyLinkpTitle" runat="server"></asp:HyperLink></td>
								  </tr>
								  <tr>
									<td align="right" nowrap="nowrap" class="viewtd2">游戏区服：</td>
									<td colspan="3" class="viewtd2">
                                        <asp:Literal ID="litGameName" runat="server"></asp:Literal>/<asp:Literal ID="litServerName"
                                            runat="server"></asp:Literal></td>
								  </tr>
								  <!--
								  <tr>
									<td align="right" nowrap="nowrap" class="viewtd2">卖家：</td>
									<td colspan="3" class="viewtd2"><a href="#">请勿吸烟123</a> <img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /><img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /><img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /></td>
								  </tr>
								  <tr>
								  -->
									<td align="right" nowrap="nowrap" class="viewtd2"><p>剩余时间：
									</p>                            </td>
									<td colspan="3" class="viewtd2">
                                        <asp:Literal ID="litTimeLeft" runat="server"></asp:Literal></td>
								  </tr>
								  <tr>
                                    <td align="right" nowrap="nowrap" class="viewtd2">购买件数：</td>
								    <td colspan="3" class="viewtd2">
                                        <asp:Literal ID="litAccountNums2" runat="server"></asp:Literal>件 </td>
							      </tr>
								  <tr>
									<td align="right" nowrap="nowrap" class="viewtd2"><p>当前价： </p>                              </td>
									<td width="166" class="viewtd2"><span class="red"><strong>
                                        <asp:Literal ID="litPriceNow2" runat="server"></asp:Literal></strong></span>元</td>
								    <td width="73" align="right" class="viewtd2"> 一口价：</td>
								    <td width="244" class="viewtd2"><span class="red"><strong>
                                        <asp:Literal ID="litPriceTop" runat="server"></asp:Literal></strong></span>元</td>
								  </tr>
								  <tr>
									<td align="right" nowrap="nowrap" class="viewtd1"><p>订单编号：<br />
									  物品编号：<br />
									  创建时间：<br />
								    订单状态：</p>                              </td>
									<td colspan="3" class="viewtd1"><p>
                                        <asp:Literal ID="litPNKID" runat="server"></asp:Literal><br />
                                        <asp:Literal ID="litOrderNumber" runat="server"></asp:Literal><br />
                                        <asp:Literal ID="litOrderinTime2" runat="server"></asp:Literal>
                                        <br />
								      <span class="red"><strong>
                                          <asp:Image ID="imgOrderTypeStatus" runat="server" /> </strong></span></p>								    </td>
								  </tr>
								</table>                          
								  <p>&nbsp;</p>								</td>
							  </tr>
						  </table>
					      <p align="center">&nbsp;</p>
					      <p align="center"><asp:Button ID="Button1" CssClass="btn" runat="server" 
                                  Text="确认提前成交" onclick="Button1_Click" />
					      </p>
				  </div>

					<div class="service">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
						  <td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
							  <tr>
								<td width="1%" align="left"><img src="images/view_dd_tt_left.gif" width="6" height="30" /></td>
								<td width="98%" class="blue"><strong>&nbsp; 接收客服</strong></td>
								<td width="1%" align="right"><img src="images/view_dd_tt_right.gif" width="6" height="30" /></td>
							  </tr>
						  </table></td>
						</tr>
						<tr>
						  <td class="bluebox"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
							  <td height="24" align="center" class="viewtd-blue">客服名称：账号客服001号                          </td>
							</tr>
							<tr>
							  <td height="50" align="center" class="viewtd2"><p>白班QQ:55446688 <a href="#">[复制]</a><br />
								  <strong>8:30-23:20</strong></p>
							  </td>
							</tr>
							<tr>
							  <td height="50" align="center"><p>夜班QQ:55446688 <a href="#">[复制]</a><br />
								  <strong>8:30-23:20</strong></p>
							  </td>
							</tr>
							<tr>
							  <td height="24" align="center" class="viewtd1">请在工作时间内联系对应客服</td>
							</tr>
						  </table>                      </td>
						</tr>
					  </table>
					</div>
					<div class="clear"></div>
					<div class="tips"><strong>易站小贴士：</strong>如果您对当前的价格满意，可以选择提前成交，则领先的买家将会竞得您的商品。 强烈建议您在提前成交操作之前，要求您<br />
				    的接手客服确认买家能够立刻付款，此举将大大提高销售成功率</div>
				</div>
				
            </div>
			<!-- end cont-->
		</div>