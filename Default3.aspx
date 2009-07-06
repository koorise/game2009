<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" Title="无标题页" %>

<%@ Register src="BianJieTuiGuang/FormatStr.ascx" tagname="FormatStr" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="style/global.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="scripts/jquery.js"></script>
<script language="javascript" src="scripts/nav.js"></script>
<link href="style/nav.css" rel="stylesheet" type="text/css" />
<link href="style/bjtg.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:FormatStr ID="FormatStr1" runat="server" />
</asp:Content>

