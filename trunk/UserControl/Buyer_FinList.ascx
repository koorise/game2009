<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Buyer_FinList.ascx.cs"
    Inherits="UserControl_Buyer_FinList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<link href="style/done.css" rel="stylesheet" type="text/css" />
<div class="cont">
    <h1>
        已买到的</h1>
    <div class="tips">
        <strong>易站小贴士：</strong>只要您一直保持登录状态不关闭易站网页，则您参与竞拍的交易一旦成功胜出或者出价被超过，则会收到易站的系统提示，<br />
        有助于买家快速成交！
    </div>
    <!--search form start-->
    <div class="bsbox searchform">
        <div id="simplesearch">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <span class="lable">成交时间：</span><asp:TextBox ID="tbStart" CssClass="input" runat="server"
                        Width="80px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbStart">
                    </cc1:CalendarExtender>
                    &nbsp;&nbsp;至&nbsp;&nbsp;<asp:TextBox ID="tbEnd" CssClass="input" runat="server"
                        Width="80px"></asp:TextBox>
                    &nbsp;<cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="tbEnd">
                    </cc1:CalendarExtender>
                    &nbsp;&nbsp;&nbsp;游戏/服务器：
                    <asp:DropDownList ID="ddlGameID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGameID_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlServerID" runat="server">
                        <asp:ListItem Value="0">请选择服务器</asp:ListItem>
                    </asp:DropDownList>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlGameID" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <div id="advancedsearch">
                        <div>
                            <span class="lable">关键词：</span><asp:TextBox ID="tbKeyWord" Width="250px" CssClass="input"
                                runat="server"></asp:TextBox>
                            <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" WatermarkText="您可以输入商品标题、或订单编号"
                                WatermarkCssClass="watermarked" TargetControlID="tbKeyWord" runat="server">
                            </cc1:TextBoxWatermarkExtender>
                        </div>
                        <div>
                            <span class="lable">卖家：</span><asp:TextBox ID="tbSells" CssClass="input" runat="server"
                                Width="80px"></asp:TextBox>&nbsp;&nbsp;&nbsp;总额介于：<asp:TextBox ID="tbLow" runat="server" CssClass="input"
                                    Width="60px" />元 至
                            <asp:TextBox ID="tbHigh" runat="server" CssClass="input" Width="60px" />元
                        </div>
                    </div>
                </asp:Panel>
                <asp:LinkButton ID="lbtnSearchMore" Text="高级搜索选项" runat="server" OnClick="lbtnSearchMore_Click"></asp:LinkButton>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lbtnSearchMore" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
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
                        <th colspan="6">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="middle">
                                        <a href="#">
                                            <img src="images/guest4svc.gif" width="155" height="26" border="0" /></a>
                                    </td>
                                    <td width="24%">
                                        <span style="color: #006093">每页显示数量
                                            <asp:ImageButton ID="btn_pagecount1" runat="server" ImageUrl="~/images/btn_20.gif"
                                                Width="19" Height="16" BorderStyle="None" ImageAlign="absmiddle" CommandName="20"
                                                OnClick="btn_pagecount1_Click" />
                                            <asp:ImageButton ID="btn_pagecount2" runat="server" ImageUrl="~/images/btn_40.gif"
                                                Width="19" Height="16" BorderStyle="None" ImageAlign="absmiddle" CommandName="40"
                                                OnClick="btn_pagecount2_Click" />
                                            <asp:ImageButton ID="btn_pagecount3" runat="server" ImageUrl="~/images/btn_80.gif"
                                                Width="19" Height="16" BorderStyle="None" ImageAlign="absmiddle" CommandName="80"
                                                OnClick="btn_pagecount3_Click" /></span>
                                    </td>
                                </tr>
                            </table>
                        </th>
                    </tr>
                    <tr>
                        <td width="232" align="center">
                            信息标题/物品类型/游戏区服
                        </td>
                        <td width="99" align="center">
                            成交金额<br />
                        </td>
                        <td width="94" align="center">
                            件数
                        </td>
                        <td width="103" align="center">
                            卖家
                        </td>
                        <td width="94" align="center">
                            成交时间
                        </td>
                        <td width="87" align="center" class="lastd">
                            评价
                        </td>
                    </tr>
                </thead>
                <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td class="btd">
                        <div class="icotype">
                            <img width="21" height="21" src='<%# GetTypeImage(DataBinder.Eval(Container.DataItem, "PNKID").ToString())%>'
                                alt="" /></div>
                        <div class="msg">
                            <a href='<%# "ProductDetails.aspx?pnkiD="+DataBinder.Eval(Container.DataItem, "PNKID").ToString()%>'
                                target="_blank" class="tip">
                                <%# DataBinder.Eval(Container.DataItem, "pTitle").ToString()%></a>
                            <br />
                            游戏区服：<%# DataBinder.Eval(Container.DataItem, "GameName").ToString()%>
                            <%# DataBinder.Eval(Container.DataItem, "ServerName").ToString()%><br />
                            订单编号：<%# DataBinder.Eval(Container.DataItem, "OrderNumber").ToString()%>
                        </div>
                    </td>
                    <td class="btd" align="center">
                        <em>
                            <%# DataBinder.Eval(Container.DataItem, "PriceNow", "{0:C}")%></em>元
                    </td>
                    <td class="btd" align="center">
                        <span class="red"><strong>
                            <%# DataBinder.Eval(Container.DataItem, "ProductCount").ToString()%></strong></span>件
                    </td>
                    <td class="btd" align="center">
                        <a href="#" target="_blank">
                            <%# DataBinder.Eval(Container.DataItem, "UserName").ToString()%></a><br />
                        <span class="viewtd1">
                            <asp:Panel ID="PromisePanel" runat="server">
                            </asp:Panel>
                        </span>
                    </td>
                    <td class="btd" align="center">
                        <%# DataBinder.Eval(Container.DataItem, "pTimeEnd").ToString()%>
                    </td>
                    <td class="btd" align="center">
                        <asp:HyperLink ID="link_sells" runat="server" Target="_blank" /><br />
                        <asp:HyperLink ID="link_buyer" runat="server" Target="_blank" /><br />
                        <asp:HyperLink ID="link_servies" runat="server" Target="_blank" /><br />
                        <a href='<%# "Buyer_FinView.aspx?ordernum="+DataBinder.Eval(Container.DataItem, "OrderNumber").ToString()%>'
                            target="_blank">查看详情</a>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="6">
                            <div style="line-height: 30px; float: left">
                                <asp:Label ID="txt_listcount" runat="server" /></div>
                            <table border="0" align="right" cellpadding="0" cellspacing="3">
                                <tr>
                                    <td valign="middle">
                                        <asp:ImageButton ID="btn_prepage" runat="server" ImageUrl="~/images/btn_prevpatge.gif"
                                            Width="19" Height="19" BorderStyle="None" ImageAlign="absmiddle" OnClick="btn_page_Click" />
                                    </td>
                                    <td class="pages">
                                        <asp:Panel ID="btnpanel" runat="server">
                                        </asp:Panel>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btn_nextpage" runat="server" ImageUrl="~/images/btn_nextpage.gif"
                                            Width="55" Height="19" BorderStyle="None" ImageAlign="absmiddle" OnClick="btn_page_Click" />
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
