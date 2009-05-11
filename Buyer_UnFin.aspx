<%@ Page Language="C#" MasterPageFile="~/UserManager.master" AutoEventWireup="true" CodeFile="Buyer_UnFin.aspx.cs" Inherits="Buyer_UnFin" Title="欢迎访问游戏易站" %>
<%@ Register src="UserControl/Buyer_UnFinList.ascx" tagname="Buyer_UnFinList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<uc1:Buyer_UnFinList ID="Buyer_UnFinList1" runat="server" />
</asp:Content>

