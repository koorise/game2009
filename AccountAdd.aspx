<%@ Page Language="C#" MasterPageFile="~/UserManager.master" AutoEventWireup="true" CodeFile="AccountAdd.aspx.cs" Inherits="AccountAdd" Title="无标题页" %>

<%@ Register src="AccountControl/AccountAdd.ascx" tagname="AccountAdd" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AccountAdd ID="AccountAdd1" runat="server" />
</asp:Content>

