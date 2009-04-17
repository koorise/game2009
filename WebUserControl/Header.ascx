<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="WebUserControl_Header" %>
<div class="wrap">
<div class="header">
			<div class="logo"><img src="images/logo01.gif" width="219" height="110" /></div>
			<div class="tools">
				<div class="menu">
				  <a href="#">账号交易</a> | 
				  <a href="#">金币交易</a> | 
				  <a href="#">中介服务</a> | 
				  <a href="#">虚拟超市</a> | 
				  <a href="#">骗子查询</a> | 
				  <a href="#">数据业务</a> | 
				  <a href="#">易坛</a> |    
				  <a href="#"><img src="images/dot_help.gif" width="11" height="11" border="0" /> 帮助中心</a>
				</div>
				<div class="btns">
					<a href="#"><img src="images/btn_buy.gif" width="60" height="21" border="0" /></a>
					<a href="#"><img src="images/btn_sell.gif" width="62" height="21" border="0" /></a>
					<a href="#"><img src="images/btn_myinfo.gif" width="91" height="21" border="0" /></a>
				</div>
				<div class="myinfo">
					您好，欢迎来到游戏易站  [<asp:HyperLink ID="HyperLink1" NavigateUrl="~/reg.aspx" runat="server">免费注册</asp:HyperLink>] [<asp:HyperLink ID="HyperLink2" NavigateUrl="~/login.aspx" runat="server">登录</asp:HyperLink>]				
				</div>
			</div>
		</div>