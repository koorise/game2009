<%@ Page Language="C#" MasterPageFile="~/UserManager.master" AutoEventWireup="true" CodeFile="ShopManage_Product.aspx.cs" Inherits="ShopManage_Product" Title="欢迎访问游戏易站" %>
<%@ Register src="ShopUserControl/ShopManage_Product.ascx" tagname="ShopManage_Product" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<uc1:ShopManage_Product ID="ShopManage_Product1" runat="server" />
</asp:Content>

