<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Saler_Order.ascx.cs" Inherits="AccountControl_Saler_Order" %>
<div class="cont">
				<h1>(仍)未成交的</h1>
				<div class="center">
                    <asp:Panel ID="pnl_0_1"  ToolTip="竞价中" runat="server">
                    <div class="orgbox">
					  <strong>当前订单状态：</strong> 
					  <span class="red"><strong>竞价中 </strong></span>
                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/tqcj1.gif" ImageAlign="AbsMiddle" runat="server" /> 
                        <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/cxdd1.gif" ImageAlign="AbsMiddle" runat="server" /></div>
                    </asp:Panel>
                    <asp:Panel ID="pnl_0_2" ToolTip="等待买家付款" runat="server">
                    <div class="orgbox">
					  <strong>当前订单状态：</strong> 
					  <span class="red"><strong>等待付款</strong></span><asp:ImageButton ID="ImageButton3" ImageAlign="AbsMiddle" ImageUrl="~/images/btn_chexiao.gif"
                          runat="server" /></div>
                    </asp:Panel>
                    <asp:Panel ID="pnl_0_3"  ToolTip="等待交货" runat="server">
                    <div class="orgbox">
					  <strong>当前订单状态：</strong> 
					  <span class="red"><strong>等待交货</strong></span><asp:ImageButton ID="ImageButton4" ImageAlign="AbsMiddle" ImageUrl="~/images/btn_ddjiaohuo.gif"
                          runat="server" /><asp:ImageButton ID="ImageButton5" ImageAlign="AbsMiddle" ImageUrl="~/images/btn_chexiao.gif"
                          runat="server" /></div>
                    </asp:Panel>
                    <asp:Panel ID="pnl_0_4" oolTip="移交中" runat="server">
                       <div class="orgbox"> <strong>当前订单状态：</strong> <span class="red"><strong>移交中</strong></span></div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnl_0_5" oolTip="成功" runat="server">
                       <div class="orgbox"> <strong>当前订单状态：</strong> <span class="red"><strong>成功</strong></span></div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnl_0_6" oolTip="失败" runat="server">
                       <div class="orgbox"> <strong>当前订单状态：</strong> <span class="red"><strong>失败</strong></span><asp:ImageButton ID="ImageButton6" ImageAlign="AbsMiddle" ImageUrl="~/images/btn_shibai.gif"
                          runat="server" /></div>
                    </asp:Panel>
                    <asp:Panel ID="pnl_0_7" oolTip="撤销" runat="server">
                       <div class="orgbox"> <strong>当前订单状态：</strong> <span class="red"><strong>撤销</strong></span></div>
                    </asp:Panel>
                    <asp:Panel ID="pnl_1_1" runat="server">
                    <div class="view">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                          <td class="bluebox"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
                              <tr>
                                <td width="75" align="center" nowrap="nowrap" bgcolor="#F5F5F5" class="viewtd2">领先人<br /></td>
                                <td align="center" bgcolor="#F5F5F5" class="viewtd2">                  领先价格                </td>
                                <td align="center" bgcolor="#F5F5F5" class="viewtd2">件数              </td>
                                <td align="center" bgcolor="#F5F5F5" class="viewtd2">出价时间 </td>
                              </tr>
                              <tr>
                                <td align="center" nowrap="nowrap" class="viewtd2"><p>
                                <asp:HyperLink 
                                        ID="hyLink_lingXian" runat="server"></asp:HyperLink>
                                    <br />
                                </p></td>
                                <td align="center" class="viewtd2">                  <span class="red"><strong>
                                    <asp:Literal ID="litMoney" runat="server"></asp:Literal></strong></span>元               </td>
                                <td align="center" class="viewtd2">
                                    <asp:Literal ID="litAccountNums" runat="server"></asp:Literal>件           </td>
                                <td align="center" class="viewtd2">
                                    <asp:Literal ID="litOrderinTIme" runat="server"></asp:Literal></td>
                              </tr>

                          </table></td>
                        </tr>
                      </table>
				  </div>
                    </asp:Panel>
                    <asp:Panel ID="pnl_OrderDetail" runat="server">
                    <div class="view">
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
								<td width="75" align="right" nowrap="nowrap">物品标题：                                                       </td>
								<td colspan="3">
                                    <asp:HyperLink ID="hyProductDetails" runat="server"></asp:HyperLink></td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap" class="viewtd1">游戏区服：</td>
								<td width="165" class="viewtd1">
                                    <asp:Literal ID="litGame" runat="server"></asp:Literal>/<asp:Literal ID="litServer"
                                        runat="server"></asp:Literal></td>
								<td align="right" nowrap="nowrap" class="viewtd1">交易行为：</td>
								<td width="186" class="viewtd1">
                                    购买</td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap" class="viewtd1">物品种类： </td>
								<td class="viewtd1">帐号</td>
								<td align="right" nowrap="nowrap" class="viewtd1">交易方式：</td>
								<td class="viewtd1"><asp:Literal ID="litSaleType" runat="server"></asp:Literal></td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap" class="viewtd1">买家：</td>
								<td class="viewtd1">
                                    <asp:HyperLink ID="hyBuyersUsername" runat="server"></asp:HyperLink> <img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /><img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /><img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /></td>
								<td align="right" nowrap="nowrap" class="viewtd1">交易属性：</td>
								<td class="viewtd1">
								<img src="images/ico_pei.gif" width="18" height="19" align="absmiddle" /> <img src="images/ico_dan.gif" width="18" height="19" align="absmiddle" /> <img src="images/ico_zheng.gif" width="18" height="19" align="absmiddle" /> <img src="images/ico_zhong.gif" width="18" height="19" align="absmiddle" /> <a href="#">说明</a></td>
							  </tr>
							  <tr>
                                <td align="right" nowrap="nowrap" class="viewtd2"><p>剩余时间： </p></td>
							    <td class="viewtd2">
                                    <asp:Literal ID="litTimeLeft" runat="server"></asp:Literal></td>
							    <td align="right" class="viewtd2">该账号出售次数：</td>
							    <td class="viewtd2">未验证</td>
						      </tr>
							  <tr>
								<td align="right" nowrap="nowrap" class="viewtd2"><p>详情描述：</p>                              </td>
								<td colspan="3" class="viewtd2">
                                    <asp:Literal ID="litProductDetails" runat="server"></asp:Literal></td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap"><p>售后承诺：</p>                              </td>
								<td colspan="3">
                                    <asp:Literal ID="litProductPromise" runat="server"></asp:Literal></td>
							  </tr>
 
							  <tr>
								<td align="right" nowrap="nowrap" class="viewtd1">密保资料：</td>
								<td class="viewtd1"><span class="red">
                                    <asp:Literal ID="litPassPort" runat="server"></asp:Literal></span></td>
								<td align="right" nowrap="nowrap" class="viewtd1">注册时间：</td>
								<td class="viewtd1">
                                    <asp:Literal ID="litTimeReg" runat="server"></asp:Literal></td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap" class="viewtd1">注册邮箱：</td>
								<td class="viewtd1"><span class="red">
                                    <asp:Literal ID="litmail" runat="server"></asp:Literal></span></td>
								<td align="right" nowrap="nowrap" class="viewtd1">到期时间：</td>
								<td class="viewtd1">
                                    <asp:Literal ID="litTimeEnd" runat="server"></asp:Literal></td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap" class="viewtd1">注册黄图：</td>
								<td class="viewtd1"><span>
                                    <asp:Literal ID="litYellowPage" runat="server"></asp:Literal></span></td>
								<td align="right" nowrap="nowrap" class="viewtd1">最后登录：</td>
								<td class="viewtd1">
                                    <asp:Literal ID="litTimeLastLogin" runat="server"></asp:Literal></td>
							  </tr>

							  <tr>
								<td align="right" nowrap="nowrap" class="viewtd2">购买件数：</td>
								<td colspan="3" class="viewtd2">
                                    <asp:Literal ID="litAccountNums2" runat="server"></asp:Literal>件</td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap">单价：</td>
								<td><span class="red"><strong>
                                    <asp:Literal ID="litPricePer" runat="server"></asp:Literal></strong></span>元</td>
								<td align="right" nowrap="nowrap">&nbsp;</td>
								<td>&nbsp;</td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap" class="viewtd2">总额：</td>
								<td colspan="3" class="viewtd2"><span class="red"><strong>
                                    <asp:Literal ID="litPriceNow" runat="server"></asp:Literal></strong></span>元 <a href="#">点此查看全部竞价历史</a></td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap">订单编号：                              </td>
								<td colspan="3">
                                    <asp:Literal ID="litOrderNumber" runat="server"></asp:Literal></td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap">物品编号：</td>
								<td colspan="3">
                                    <asp:Literal ID="litPNKID" runat="server"></asp:Literal></td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap">创建时间：<br /></td>
								<td colspan="3">
                                    <asp:Literal ID="litOrderInTime2" runat="server"></asp:Literal></td>
							  </tr>
							  <tr>
								<td align="right" nowrap="nowrap">订单状态：</td>
								<td colspan="3"><strong class="red">
                                    <asp:Image ID="imgOrderType" runat="server" />
                                    <asp:ImageButton ID="ImageButton7" ImageAlign="AbsMiddle" ImageUrl="~/images/tqcj1.gif" runat="server" /> 
                                    <asp:ImageButton ID="ImageButton8" ImageAlign="AbsMiddle" ImageUrl="~/images/cxdd1.gif" runat="server" /></strong></td>
							  </tr>
							</table>                          
							  <p>&nbsp;</p>
							</td>
						  </tr>
					  </table>
					</div>
                    </asp:Panel>
                    <asp:Panel ID="pnl_2_1" runat="server">
                    <div class="view">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
                              <tr>
                                <td width="1%" align="left"><img src="images/view_dd_tt_left.gif" width="6" height="30" /></td>
                                <td width="98%" class="blue"><strong>&nbsp; 审核结果</strong></td>
                                <td width="1%" align="right"><img src="images/view_dd_tt_right.gif" width="6" height="30" /></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td class="bluebox"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">


                              <tr>
                                <td align="right" nowrap="nowrap" class="viewtd2">通知客服：</td>
                                <td class="viewtd2">账号客服01    李名凯</td>
                                <td class="viewtd2">通知时间：<br /></td>
                                <td class="viewtd2">2009-03-15 12:12:21</td>
                              </tr>
                              <tr>
                                <td width="75" align="right" nowrap="nowrap" class="viewtd2"><p> 接手交易员：<br />
                                </p></td>
                                <td width="180" class="viewtd2">账号交易员01  张光才</td>
                                <td width="75" class="viewtd2">验证时间：</td>
                                <td class="viewtd2">2009-03-15 12:12:21</td>
                              </tr>
                              <tr>
                                <td align="right" valign="top" nowrap="nowrap">                                审核结果：</td>
                                <td colspan="3" class="red">去不正确的上看见风开始的疯狂数据分类数据分类；撒酒疯立刻精神分裂吉林省 <br />
                                  垃圾；狂来说剑肥佬教授离开房间；事了看见发了设计费两所看见发 极乐世界<br />
                                法律上</td>
                              </tr>

                            </table>
                          </td>
                        </tr>
                      </table>
				  </div>
                    </asp:Panel>
                    <asp:Panel ID="pnl_2_2" runat="server">
                    <div class="view">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
                              <tr>
                                <td width="1%" align="left"><img src="images/view_dd_tt_left.gif" width="6" height="30" /></td>
                                <td width="98%" class="blue"><strong>&nbsp; 失败原因</strong></td>
                                <td width="1%" align="right"><img src="images/view_dd_tt_right.gif" width="6" height="30" /></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td class="bluebox"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
                              <tr>
                                <td width="75" align="right" nowrap="nowrap" class="viewtd2">处理客服：<br /></td>
                                <td class="viewtd2">账号客服01 </td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap" class="viewtd2">处理时间：<br /></td>
                                <td class="viewtd2">2009-03-15 12:12:21</td>
                              </tr>
                              <tr class="info">
                                <td align="right" class="viewtd2">责任归咎：</td>
                                <td class="viewtd2">无责</td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap" class="viewtd2">暂封卖家：<br /></td>
                                <td class="viewtd2">否 </td>
                              </tr>
                              <tr>
                                <td align="right" nowrap="nowrap">失败详情：</td>
                                <td class="red">账号密码审核错误，交易失败</td>
                              </tr>

                          </table></td>
                        </tr>
                      </table>
				  </div>
                    </asp:Panel>
					<div class="backlist">
					  <input name="Submit" type="submit" class="btn" value="返回订单列表" />
					</div>
				</div>
    <asp:Panel ID="pnl_Svr" runat="server">
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
    </asp:Panel>
				
            </div>