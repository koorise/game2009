<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChargePrice.ascx.cs" Inherits="ChargeAndCash_ChargePrice" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="Charge_Alipay.ascx" tagname="Charge_Alipay" tagprefix="uc1" %>
<%@ Register src="Charge_SYT.ascx" tagname="Charge_SYT" tagprefix="uc1" %>
<%@ Register src="Charge_ICBC.ascx" tagname="Charge_ICBC" tagprefix="uc1" %>
<link href="style/topup.css" rel="stylesheet" type="text/css" />
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
<div class="cont">
    <h1>
        已买到的</h1>
    <dl class="tabs">
        <dt><a href="#"><span>网银自动充值</span></a> <a href="#"><span>工行人工充值（推荐）</span></a> <a
            href="#" class="focus"><span>支付宝自动充值</span></a> </dt>
        <dd id="wydd">
        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="支付宝自动充值（推荐）"><ContentTemplate>
            <uc1:Charge_Alipay ID="Charge_Alipay1" runat="server" /></ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="工行人工充值"><ContentTemplate>
            <uc1:Charge_ICBC ID="Charge_ICBC1" runat="server" /></ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="网银自动充值"><ContentTemplate>
            <uc1:Charge_SYT ID="Charge_SYT1" runat="server" /></ContentTemplate>
            </cc1:TabPanel>
        </cc1:TabContainer></dd>
    </dl>
</div>
