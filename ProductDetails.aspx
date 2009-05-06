<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" Title="无标题页" %>

<%@ Register src="Products/ProductsDetails.ascx" tagname="ProductsDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="style/global.css" rel="stylesheet" type="text/css" />
<link href="style/product.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/tab.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ProductsDetails ID="ProductsDetails1" runat="server" />
</asp:Content>

