<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MakeOrderOK-end.ascx.cs" Inherits="AccountControl_MakeOrderOK_end" %>
<div class="main">
			<div class="pos">您的位置：首页>>我的游戏易站>>(仍)未成交的</div>
			
			<div class="cont">
				<h1>(仍)未成交的</h1>
				<div class="box">
				<div class="bsbox">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <th height="40" scope="col">提前成交成功！</th>
                    </tr>
                    <tr>
                      <td bgcolor="#F5F5F5" class="cont">订单编号：<asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink><br />
                        物品标题：<asp:HyperLink ID="HyperLink2" runat="server">HyperLink</asp:HyperLink><br />
                        获胜买家：<asp:HyperLink ID="HyperLink3" runat="server">HyperLink</asp:HyperLink><br />
                        购买件数：<asp:Literal ID="Literal1" runat="server"></asp:Literal>件<br />
                        成交价格：<span class="red"><strong><asp:Literal ID="Literal2" runat="server"></asp:Literal></strong></span>元<br />
                        订单状态：<asp:Image ID="Image1" runat="server" /><br />
                      请尽快联系客服进行处理 </td>
                    </tr>
                    <tr>
                      <td height="32" align="center"><img src="images/btn_copy4ser.gif" width="149" height="24" /></td>
                    </tr>
                   <asp:Panel ID="Panel1" runat="server">
                    <tr>
                      <td height="30" class="green">您的交易是担保交易，可以提前交货，买家付款后易站客服直接为您进行移交工作。休息不误生意! </td>
                    </tr>
                    <tr>
                      <td height="40" align="center">
                          <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/ljjh.gif" runat="server" /></td>
                    </tr>
                    <tr>
                      <td height="30">您还可以到 <a href="#">订单列表</a> 中查看其他订单，或 <a href="#">点此返回</a> 我的游戏易站</td>
                    </tr>
                    </asp:Panel>
                  </table>
				</div>
				<div class="service" style="margin-top:0px;">
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
				</div>
            </div>
			<!-- end cont-->
		</div>