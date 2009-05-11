<%@ Page Language="C#" MasterPageFile="~/UserManager.master" AutoEventWireup="true" CodeFile="Buyer_FinView.aspx.cs" Inherits="Buyer_FinView" Title="Untitled Page" %>
<%@ Register src="UserControl/Buyer_FinView.ascx" tagname="Buyer_FinView" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<uc1:Buyer_FinView ID="Buyer_FinView1" runat="server" />
</asp:Content>

