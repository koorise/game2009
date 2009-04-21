<%@ Page Language="C#" MasterPageFile="~/UserManager.master" AutoEventWireup="true" CodeFile="User_UnDeal.aspx.cs" Inherits="User_UnDeal" Title="无标题页" %>
<%@ Register src="UserControl/Buyer_Deal.ascx" tagname="Buyer_Deal" tagprefix="uc1" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <uc1:Buyer_Deal ID="Buyer_Deal1" runat="server" />
</asp:Content>

