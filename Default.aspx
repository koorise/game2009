<%@ Page Language="C#" MasterPageFile="~/MP_index.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="无标题页" %>

<%@ Register src="WebUserControl/UserTips.ascx" tagname="UserTips" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserTips ID="UserTips1" runat="server" />
</asp:Content>

