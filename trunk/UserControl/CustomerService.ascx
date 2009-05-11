<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomerService.ascx.cs" Inherits="UserControl_CustomerService" %>
<div class="service">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/view_dd_tt_middle.gif">
                    <tr>
                        <td width="1%" align="left">
                            <img src="images/view_dd_tt_left.gif" width="6" height="30" />
                        </td>
                        <td width="98%" class="blue">
                            <strong>&nbsp; 接收客服</strong>
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
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="24" align="center" class="viewtd-blue">
                            客服名称：<asp:Label ID="txt_csname" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="center" class="viewtd2">
                            <p>
                                白班QQ:<asp:Label ID="txt_dayqq" runat="server" /><a href="#" onclick="copyToClip()>[复制]</a><br />
                                <strong>8:30-23:20</strong></p>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="center">
                            <p>
                                夜班QQ:<asp:Label ID="txt_nightqq" runat="server" /><a href="#" onclick="copyToClip()>[复制]</a><br />
                                <strong>23:20-08:30</strong></p>
                        </td>
                    </tr>
                    <tr>
                        <td height="24" align="center" class="viewtd1">
                            请在工作时间内联系对应客服
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
