<%@ Page Language="C#" MasterPageFile="~/UserManager.master" AutoEventWireup="true" CodeFile="CheckPay.aspx.cs" Inherits="CheckPay" Title="欢迎访问游戏易站" %>
<%@ Register src="UserControl/CheckPay.ascx" tagname="CheckPay" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CheckPay ID="CheckPay1" runat="server" />
</asp:Content>

