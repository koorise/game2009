<%@ Page Language="C#" MasterPageFile="~/UserManager.master" AutoEventWireup="true" CodeFile="MyShopDefault.aspx.cs" Inherits="MyShopDefault" Title="欢迎访问游戏易站" %>
<%@ Register src="ShopUserControl/ShopDefault.ascx" tagname="ShopDefault" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<uc1:ShopDefault ID="ShopDefault1" runat="server" />
</asp:Content>

