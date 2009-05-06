<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountDone.aspx.cs" Inherits="AccountDone" Title="无标题页" %>

<%@ Register src="AccountControl/AccountAddDone.ascx" tagname="AccountAddDone" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="style/global.css" rel="stylesheet" type="text/css" />
<link href="style/nav.css" rel="stylesheet" type="text/css" />
<link href="style/published-done.css" rel="stylesheet" type="text/css" />
<link href="style/select-svc.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AccountAddDone ID="AccountAddDone1" runat="server" />
</asp:Content>

