<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrderBuy_List.ascx.cs" Inherits="Service_OrderBuy_List" %>
<link href="style/unclosed.css" rel="stylesheet" type="text/css" />
<div class="cont">
    <h1>
        (仍)未成交的</h1>
    <div class="tips">
        <strong>易站小贴士：</strong>只要您一直保持登录状态不关闭易站网页，则您参与竞拍的交易一旦成功胜出或者出价被超过，则会收到易站的系统提示，<br />
        有助于买家快速成交！
    </div>
    <!--search form start-->
    <div class="bsbox searchform">
        <div id="simplesearch">
            
        </div>
        
        <div class="btns">
            <asp:ImageButton ID="btn_search" ImageUrl="~/images/btn_search.gif" ImageAlign="AbsMiddle"
                runat="server" OnClick="btn_search_Click" />
        </div>
    </div>
    <!--searchform end-->
    <div class="list">
        <asp:DataList ID="MyOrderList1" Width="100%" border="0" CellSpacing="0" CellPadding="5"
            runat="server" OnItemDataBound="MyOrderList1_ItemDataBound">
            <HeaderTemplate>
                <thead>
                    <tr>
                        <th colspan="7">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="middle">
                                        <strong>快捷搜索：</strong>
                                    </td>
                                    <td>
                                        
                                        <asp:Button ID="btn_search_all" runat="server" Text="全部" CssClass="block" CommandName="all" OnClick="btn_search_all_Click" />
                                    </td>
                                </tr>
                            </table>
                        </th>
                    </tr>
                    <tr>
                        <td width="232">
                            信息标题/物品类型<br />
                            游戏区服<br />
                            订单编号
                        </td>
                        <td width="90" align="center">
                            当前价格
                        </td>
                        <td width="99" align="center">
                            购买件数<br />
                            我的出价<br />
                            我的最高出价<br />
                        </td>
                        <td width="94" align="center">
                            创建时间
                        </td>
                        <td width="103" align="center">
                            剩余时间
                        </td>
                        <td width="94" align="center">
                            订单状态
                        </td>
                        <td width="87" align="center" class="lastd">
                            操作
                        </td>
                    </tr>
                </thead>
                <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td class="btd">
                        <div class="icotype">
                            <img width="21" height="21" src='<%# DataBinder.Eval(Container.DataItem, "PNKID").ToString()%>' alt="" /></div>
                        <div class="msg">
                            <a href='<%# "ProductDetails.aspx?pnkiD="+DataBinder.Eval(Container.DataItem, "PNKID").ToString()%>' target="_blank" class="tip"><%# DataBinder.Eval(Container.DataItem, "pTitle").ToString()%></a>
                            <br />
                            游戏区服：<%# DataBinder.Eval(Container.DataItem, "GameName").ToString()%> <%# DataBinder.Eval(Container.DataItem, "ServerName").ToString()%><br />
                            订单编号：<%# DataBinder.Eval(Container.DataItem, "OrderNumber").ToString()%>
                        </div>
                    </td>
                    <td class="btd" align="center">
                        <em>
                            <%# DataBinder.Eval(Container.DataItem, "PNKID").ToString()%></em>元
                    </td>
                    <td class="btd" align="center">
                        <em>
                            <%# DataBinder.Eval(Container.DataItem, "ProductCount").ToString()%></em>/<%# DataBinder.Eval(Container.DataItem, "PNKID").ToString()%><br />
                        <em>
                            <%# DataBinder.Eval(Container.DataItem, "PriceNow", "{0:C}")%></em>元<br />
                        <em>
                            <%# DataBinder.Eval(Container.DataItem, "PriceAgent", "{0:C}")%></em>元
                    </td>
                    <td class="btd" align="center">
                        <%# DataBinder.Eval(Container.DataItem, "pTimeStart").ToString()%>
                    </td>
                    <td class="btd" align="center">
                        <%# DataBinder.Eval(Container.DataItem, "pTimeEnd").ToString()%>
                    </td>
                    <td class="btd" align="center">
                        <img width="59" height="22" src='<%# DataBinder.Eval(Container.DataItem, "orderType1").ToString().ToString()%>' alt="" /><br />
                        test
                    </td>
                    <td class="btd" align="center">
                        <asp:HyperLink ID="link_view" runat="server" CssClass="org" Target="_blank" Text="查看" /><br />
                        <asp:HyperLink ID="link_nexttip" runat="server" CssClass="tip" Target="_blank" />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="7">
                            <div style="line-height: 30px; float: left">
                                <asp:Label ID="txt_listcount" runat="server" /></div>
                            <table border="0" align="right" cellpadding="0" cellspacing="3">
                                <tr>
                                    <td valign="middle">
                                        <asp:ImageButton ID="btn_prepage" runat="server" ImageUrl="~/images/btn_prevpatge.gif" Width="19" Height="19" BorderStyle="None" ImageAlign="absmiddle" OnClick="btn_page_Click" />
                                    </td>
                                    <td class="pages">
                                        <asp:Panel ID="btnpanel" runat="server"></asp:Panel>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btn_nextpage" runat="server" ImageUrl="~/images/btn_nextpage.gif" Width="55" Height="19" BorderStyle="None" ImageAlign="absmiddle" OnClick="btn_page_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tfoot>
            </FooterTemplate>
        </asp:DataList>
    </div>
</div>
