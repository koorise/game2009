<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChargeCashList.ascx.cs"
    Inherits="Service_ChargeCashList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<link href="style/unclosed.css" rel="stylesheet" type="text/css" />
<div class="cont">
    <h1>
        后台>>提现充值管理>>待处理的单子</h1>
    <!--search form start-->
    <div class="bsbox searchform">
        <div id="simplesearch">
            订单类型：<asp:DropDownList ID="sel_type" runat="server">
            </asp:DropDownList>
            订单状态：<asp:DropDownList ID="sel_status" runat="server">
            </asp:DropDownList>
            渠道：<asp:DropDownList ID="sel_channel" runat="server">
            </asp:DropDownList>
            订单号：<asp:TextBox ID="txt_ordernum" runat="server"></asp:TextBox><br />
            申请人：<asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
            帐务流水号：<asp:TextBox ID="txt_runningnum" runat="server"></asp:TextBox><br />
            申请时间：<asp:TextBox ID="tbStart" CssClass="input" runat="server" Width="80px"></asp:TextBox>
            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbStart">
            </cc1:CalendarExtender>
            &nbsp;&nbsp;至&nbsp;&nbsp;<asp:TextBox ID="tbEnd" CssClass="input" runat="server"
                Width="80px"></asp:TextBox>
            &nbsp;<cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="tbEnd">
            </cc1:CalendarExtender>
            完成时间：<asp:TextBox ID="tcStart" CssClass="input" runat="server" Width="80px"></asp:TextBox>
            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="tbStart">
            </cc1:CalendarExtender>
            &nbsp;&nbsp;至&nbsp;&nbsp;<asp:TextBox ID="tcEnd" CssClass="input" runat="server"
                Width="80px"></asp:TextBox>
            &nbsp;<cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="tbEnd">
            </cc1:CalendarExtender>
            <br />
            申请金额：<asp:TextBox ID="taLow" CssClass="input" runat="server" Width="80px"></asp:TextBox>
            &nbsp;&nbsp;至&nbsp;&nbsp;<asp:TextBox ID="taHigh" CssClass="input" runat="server"
                Width="80px"></asp:TextBox>
            成功金额：<asp:TextBox ID="tfLow" CssClass="input" runat="server" Width="80px"></asp:TextBox>
            &nbsp;&nbsp;至&nbsp;&nbsp;<asp:TextBox ID="tfHigh" CssClass="input" runat="server"
                Width="80px"></asp:TextBox><br />
            &nbsp;操作员：<asp:TextBox ID="txt_servicename" runat="server"></asp:TextBox><br />
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
                                        <asp:Button ID="btn_search_do" runat="server" Text="处理中的" CssClass="block" CommandName="doing"
                                            OnClick="btn_search_do_Click" />
                                    </td>
                                </tr>
                            </table>
                        </th>
                    </tr>
                    <tr>
                        <td width="232">
                            订单号/申请人
                        </td>
                        <td width="90" align="center">
                            类型/渠道
                        </td>
                        <td width="99" align="center">
                            申请金额
                        </td>
                        <td width="94" align="center">
                            成功金额
                        </td>
                        <td width="103" align="center">
                            订单状态
                        </td>
                        <td width="94" align="center">
                            申请时间
                        </td>
                        <td width="94" align="center">
                            完成时间
                        </td>
                        <td width="87" align="center" class="lastd">
                            操作员
                        </td>
                    </tr>
                </thead>
                <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td class="btd">
                        <div class="msg">
                            <asp:HyperLink ID="link_view" runat="server" CssClass="org" Target="_self" Text='<%# DataBinder.Eval(Container.DataItem, "runningid").ToString()%>' /><br />
                            <a href='#'
                                target="_blank" class="tip">
                                <%# DataBinder.Eval(Container.DataItem, "UserName").ToString()%></a>
                        </div>
                    </td>
                    <td class="btd" align="center">
                        <em>
                            <%# DataBinder.Eval(Container.DataItem, "typename").ToString()%></em><br />
                        <%# DataBinder.Eval(Container.DataItem, "pricechannelname").ToString()%>
                    </td>
                    <td class="btd" align="center">
                        <em>
                            <%# DataBinder.Eval(Container.DataItem, "applyprice", "{0:C}")%></em>元
                    </td>
                    <td class="btd" align="center">
                        <em>
                            <%# DataBinder.Eval(Container.DataItem, "operateprice", "{0:C}")%></em>元
                    </td>
                    <td class="btd" align="center">
                        <asp:Label ID="txt_status" runat="server" />
                    </td>
                    <td class="btd" align="center">
                        <%# DataBinder.Eval(Container.DataItem, "StartTime").ToString()%>
                    </td>
                    <td class="btd" align="center">
                        <%# DataBinder.Eval(Container.DataItem, "FinTime").ToString()%>
                    </td>
                    <td class="btd" align="center">
                        <%# DataBinder.Eval(Container.DataItem, "typeid").ToString()%><br />
                        <%# DataBinder.Eval(Container.DataItem, "username").ToString()%>
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
