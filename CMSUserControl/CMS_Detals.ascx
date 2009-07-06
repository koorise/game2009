<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMS_Detals.ascx.cs" Inherits="CMSUserControl_CMS_Detals" %>
<%@ Register src="Left.ascx" tagname="Left" tagprefix="uc1" %>
<div class="pos">您的位置：首页 &gt;&gt; 帮助中心 &gt;&gt; 
    <asp:HyperLink ID="HyperLink_BigClass" runat="server"></asp:HyperLink> &gt;&gt; 
    <asp:HyperLink ID="HyperLink_SmallClass" runat="server"></asp:HyperLink> &gt;&gt; 
    <asp:Literal ID="Literal_title2" runat="server"></asp:Literal></div>
<div class="midp">
<uc1:Left ID="Left1" runat="server" />
		<div class="main">
		  
		  <div class="faq_title">
              <asp:Literal ID="Literal_title" runat="server"></asp:Literal></div>
		  <div class="line2">
		    <div align="center">[添加时间:<asp:Literal ID="Literal_inTime" runat="server"></asp:Literal> | 点击数:<asp:Literal ID="Literal_Hits" runat="server"></asp:Literal>]</div>&nbsp;
		    <div class="xg">
		  	<h1>相关问题</h1>
			<ul>
				<li><a href="#">买家交易流程</a></li>
				<li><a href="#">卖家交易流程</a></li>
				<li><a href="#">交易过程中如果出现问题怎么办？</a></li>
				<li><a href="#">如果我付款了，卖家不交货，我该怎么办？</a></li>
				<li><a href="#">如果买家拍下来以后不付款？</a></li>
				<li><a href="#">如果买到了不应该买到的赃物，怎么处理？</a></li>
			</ul>
		  </div>
		  </div>
		  <div class="faq_cont">
              <asp:Label ID="Label_Content" runat="server" Text="Label"></asp:Label></div>
		  </div>
		</div>