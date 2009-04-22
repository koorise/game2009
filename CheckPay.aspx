<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckPay.aspx.cs" Inherits="CheckPay" Title="欢迎访问游戏易站" %>
<%@ Register src="WebUserControl/CheckPay.ascx" tagname="CheckPay" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/pay.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/ReadTime.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CheckPay runat="server" />
</asp:Content>

