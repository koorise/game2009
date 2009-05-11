<%@ Page Language="C#" MasterPageFile="~/UserManager.master" AutoEventWireup="true" CodeFile="Buyer_Fin.aspx.cs" Inherits="Buyer_Fin" Title="欢迎访问游戏易站" %>
<%@ Register src="UserControl/Buyer_FinList.ascx" tagname="Buyer_FinList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<uc1:Buyer_FinList ID="Buyer_FinList1" runat="server" />
</asp:Content>

