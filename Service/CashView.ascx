<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CashView.ascx.cs" Inherits="Service_CashView" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<link href="style/unclosed.css" rel="stylesheet" type="text/css" />
<div class="cont">
    <h1>
        后台>>提现充值管理>>单子详情</h1>
    <div class="list">
        <asp:DataList ID="MyOrderList1" Width="100%" border="0" CellSpacing="0" CellPadding="5"
            runat="server" OnItemDataBound="MyOrderList1_ItemDataBound">
            <HeaderTemplate>
                <thead>
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
                            <a class="org" target="_self" href='CashView.aspx?runningid=<%# DataBinder.Eval(Container.DataItem, "runningid").ToString()%>'><%# DataBinder.Eval(Container.DataItem, "runningid").ToString()%></a><br />
                            <a href='#' target="_blank" class="tip">
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
        </asp:DataList>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <table border="0" align="center" cellpadding="5" cellspacing="0">
                        <tr>
                            <td colspan="2" nowrap="nowrap">
                                详情：
                            </td>
                        </tr>
                        <tr>
                            <td width="75" align="right" nowrap="nowrap">
                                类型：
                            </td>
                            <td>
                            提现
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                渠道：
                            </td>
                            <td width="165" class="viewtd1">
                            <asp:Label ID="txt_pricechannel" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                户名：
                            </td>
                            <td width="186" class="viewtd1">
                                <asp:Label ID="txt_accountname" runat="server" />元
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                帐号：
                            </td>
                            <td width="186" class="viewtd1">
                                <asp:Label ID="txt_accountnum" runat="server" />元
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                申请金额：
                            </td>
                            <td width="186" class="viewtd1">
                                <asp:Label ID="txt_aprice" runat="server" />元
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                手续费：
                            </td>
                            <td class="viewtd1">
                                <asp:Label ID="txt_sprice" runat="server" />元
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                应到帐：
                            </td>
                            <td width="186" class="viewtd1">
                                <asp:Label ID="txt_oprice" runat="server" />元
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table border="0" align="center" cellpadding="5" cellspacing="0">
                        <tr>
                            <td colspan="4" nowrap="nowrap">
                                会员资金概况：
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right" nowrap="nowrap" class="viewtd1">
                                账户总额：
                            </td>
                            <td colspan="2" width="165" class="viewtd1">
                                <asp:Label ID="txt_totalprice" runat="server" />元
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                可用余额：
                            </td>
                            <td width="186" class="viewtd1">
                                <asp:Label ID="txt_cprice" runat="server" />元
                            </td>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                锁定金额：
                            </td>
                            <td width="186" class="viewtd1">
                                <asp:Label ID="txt_lprice" runat="server" />元
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                押金总额：
                            </td>
                            <td class="viewtd1">
                                <asp:Label ID="txt_typrice" runat="server" />元
                            </td>
                            <td align="right" nowrap="nowrap" class="viewtd1">
                                可用押金余额：
                            </td>
                            <td class="viewtd1">
                                <asp:Label ID="txt_yprice" runat="server" />元
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" nowrap="nowrap" class="viewtd1">
                                发现资金异常请勿直接给出处理结果，等待处理
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table border="0" align="center" cellpadding="5" cellspacing="0">
                    <tr>
                        <td colspan="2" nowrap="nowrap">
                            处理结果：
                        </td>
                    </tr>
                    <tr>
                        <td width="75" align="right" nowrap="nowrap">
                            处理结果：
                        </td>
                        <td>
                        <asp:Label ID="txt_fstatus" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" class="viewtd1">
                            到账金额：
                        </td>
                        <td width="165" class="viewtd1">
                            <asp:Label ID="txt_fprice" runat="server" />元
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" class="viewtd1">
                            账务流水号：
                        </td>
                        <td width="186" class="viewtd1">
                        <asp:Label ID="txt_frunningnum" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" class="viewtd1">
                            备注：
                        </td>
                        <td class="viewtd1">
                        <asp:Label ID="txt_fbak" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table border="0" align="center" cellpadding="5" cellspacing="0">
                    <tr>
                        <td colspan="2" nowrap="nowrap">
                            处理结果：
                        </td>
                    </tr>
                    <tr>
                        <td width="75" align="right" nowrap="nowrap">
                            处理结果：
                        </td>
                        <td>
                            <asp:RadioButtonList ID="sel_fin" runat="server">
                            <asp:ListItem Value="success" Text="充值成功"></asp:ListItem>
                            <asp:ListItem Value="fail" Text="充值失败"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" class="viewtd1">
                            应到账金额：
                        </td>
                        <td width="165" class="viewtd1">
                            <asp:Label ID="txt_price" runat="server" />元
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" class="viewtd1">
                            确认到账金额：
                        </td>
                        <td width="165" class="viewtd1">
                            <asp:TextBox ID="txt_operateprice" runat="server" />元
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" class="viewtd1">
                            账务流水号：
                        </td>
                        <td width="186" class="viewtd1">
                        <asp:TextBox ID="txt_runningnum" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" class="viewtd1">
                            备注：
                        </td>
                        <td class="viewtd1">
                        <asp:TextBox ID="txt_bak" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
    <div class="backlist">
        <asp:Button ID="btn_apply" runat="server" CssClass="btn" Text="提交" OnClick="btn_apply_Click" /><asp:Button
            ID="btn_back" runat="server" Text="返回列表" CssClass="btn" OnClick="btn_back_Click" />
    </div>
</div>
