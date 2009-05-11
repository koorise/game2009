<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Buyer_UnFinView_Wait.ascx.cs" Inherits="UserControl_Buyer_UnFinView_Wait" %>
<%@ Register Src="CustomerService.ascx" TagName="CustomerService" TagPrefix="uc1" %>
<link href="style/unclosed-waitdeliver.css" rel="stylesheet" type="text/css" />
<div class="cont">
    <h1>
        (仍)未成交的</h1>
    <div class="center">
        <div class="orgbox">
            <strong>当前订单状态：
                <asp:Label ID="txt_orderstatus" runat="server" CssClass="red" /></strong>
        </div>
        <div class="view">
            <asp:FormView ID="FormView1" OnDataBound="FormView1_DataBound" runat="server">
                <ItemTemplate>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
                                    <tr>
                                        <td width="1%" align="left">
                                            <img src="images/view_dd_tt_left.gif" width="6" height="30" />
                                        </td>
                                        <td width="98%" class="blue">
                                            <strong>&nbsp; 订单信息</strong>
                                        </td>
                                        <td width="1%" align="right">
                                            <img src="images/view_dd_tt_right.gif" width="6" height="30" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="bluebox">
                                <table border="0" align="center" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td width="75" align="right" nowrap="nowrap">
                                            物品标题：
                                        </td>
                                        <td colspan="3">
                                            <a href='<%# "ProductDetails.aspx?pnkiD="+DataBinder.Eval(Container.DataItem, "PNKID").ToString()%>'
                                                target="_blank">
                                                <%# DataBinder.Eval(Container.DataItem, "pTitle").ToString()%></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            游戏区服：
                                        </td>
                                        <td width="165" class="viewtd1">
                                            <%# DataBinder.Eval(Container.DataItem, "GameName").ToString()%>
                                            /
                                            <%# DataBinder.Eval(Container.DataItem, "ServerName").ToString()%>
                                        </td>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            交易行为：
                                        </td>
                                        <td width="186" class="viewtd1">
                                            购买
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            卖家：
                                        </td>
                                        <td class="viewtd1">
                                            <a href="#">
                                                <%# DataBinder.Eval(Container.DataItem, "UserName").ToString()%></a>&nbsp;<asp:Panel ID="PromisePanel" runat="server">
                                            </asp:Panel>
                                        </td>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            交易方式：
                                        </td>
                                        <td class="viewtd1">
                                            <%# DataBinder.Eval(Container.DataItem, "TypeName").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            物品种类：
                                        </td>
                                        <td class="viewtd1">
                                            帐号
                                        </td>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            交易属性：
                                        </td>
                                        <td class="viewtd1">
                                            <img src='<%# GetSaleTypeImage(DataBinder.Eval(Container.DataItem, "SaleType").ToString())%>'
                                                width="18" height="19" align="absmiddle" />
                                            <a href="#">说明</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap" class="viewtd2">
                                            <p>
                                                剩余时间：
                                            </p>
                                        </td>
                                        <td colspan="3" class="viewtd2">
                                            <%# GetLastTime(DataBinder.Eval(Container.DataItem, "pTimeEnd"))%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap" class="viewtd2">
                                            <p>
                                                详情描述：</p>
                                        </td>
                                        <td colspan="3" class="viewtd2">
                                            <%# DataBinder.Eval(Container.DataItem, "pDetails").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap">
                                            <p>
                                                售后承诺：</p>
                                        </td>
                                        <td colspan="3">
                                            <%# DataBinder.Eval(Container.DataItem, "ProductsPromise").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            密保资料：
                                        </td>
                                        <td class="viewtd1">
                                            <%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "AccountPassport"))?"<span class=\'red\'>有":"<span>无"%></span>
                                        </td>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            注册时间：
                                        </td>
                                        <td class="viewtd1">
                                            <%# DataBinder.Eval(Container.DataItem, "AccountTimeReg").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            注册邮箱：
                                        </td>
                                        <td class="viewtd1">
                                            <%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "AccountMail")) ? "<span class=\"red\">有" : "<span>无"%></span>
                                        </td>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            到期时间：
                                        </td>
                                        <td class="viewtd1">
                                            <%# DataBinder.Eval(Container.DataItem, "AccountTimeEnd").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            注册黄图：
                                        </td>
                                        <td class="viewtd1">
                                            <%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "AccountYellowPage")) ? "<span class=\"red\">有" : "<span>无"%></span>
                                        </td>
                                        <td align="right" nowrap="nowrap" class="viewtd1">
                                            最后登录：
                                        </td>
                                        <td class="viewtd1">
                                            <%# DataBinder.Eval(Container.DataItem, "AccountTimeLastLogin").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap" class="viewtd2">
                                            购买件数：
                                        </td>
                                        <td colspan="3" class="viewtd2">
                                            <%# DataBinder.Eval(Container.DataItem, "ProductCount").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap">
                                            当前价：
                                        </td>
                                        <td>
                                            <span class="red"><strong>
                                                <%# GetCurrentPrice(DataBinder.Eval(Container.DataItem, "PNKID").ToString())%></strong></span>元
                                        </td>
                                        <td align="right" nowrap="nowrap">
                                            一口价：
                                        </td>
                                        <td>
                                            <span class="red"><strong>
                                                <%# DataBinder.Eval(Container.DataItem, "pPriceTop", "{0:C}")%></strong></span>元
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap">
                                            我的出价：
                                        </td>
                                        <td>
                                            <span class="red"><strong>
                                                <%# DataBinder.Eval(Container.DataItem, "PriceNow", "{0:C}")%></strong></span>元
                                        </td>
                                        <td align="right" nowrap="nowrap">
                                            我的最高出价：
                                        </td>
                                        <td>
                                            <span class="red"><strong>
                                                <%# DataBinder.Eval(Container.DataItem, "PriceAgent", "{0:C}")%></strong></span>元
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap">
                                            订单编号：
                                        </td>
                                        <td colspan="3">
                                            <%# DataBinder.Eval(Container.DataItem, "OrderNumber").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap">
                                            物品编号：
                                        </td>
                                        <td colspan="3">
                                            <%# DataBinder.Eval(Container.DataItem, "PNKID").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap">
                                            创建时间：<br />
                                        </td>
                                        <td colspan="3">
                                            <%# DataBinder.Eval(Container.DataItem, "pTimeStart").ToString()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap="nowrap">
                                            订单状态：
                                        </td>
                                        <td colspan="3">
                                            <strong class="red">
                                                <%# DataBinder.Eval(Container.DataItem, "orderType1").ToString()%></strong>
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    &nbsp;</p>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </div>
        <div class="blue p">如果有任何问题，请联系您的接手客服为您服务 7X24小时在线为您服务</div>
        <div class="backlist">
            <asp:Button ID="btn_backlist" runat="server" CssClass="btn" Text="返回订单列表" 
                onclick="btn_backlist_Click" />
        </div>
        <uc1:CustomerService ID="CustomerService1" runat="server" />
    </div>
</div>
