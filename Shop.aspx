<%@ Page Language="C#" MasterPageFile="~/MP_index.master" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Shop" Title="无标题页" %>

<%@ Register src="ShopUserControl/Shop.ascx" tagname="Shop" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="style/global.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="javascript/jquery.js"></script>
<script language="javascript">
	$(function(){
		$(".tabs a").click(function(){
			$(".tabs-content").hide();
			$("#"+$(this).attr("href")).show();
			return false;
		});
	});
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Shop ID="Shop1" runat="server" />
</asp:Content>

