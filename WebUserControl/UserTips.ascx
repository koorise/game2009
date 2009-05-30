<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserTips.ascx.cs" Inherits="WebUserControl_UserTips" %>
<div class="left">
			<dl class="unit">
				<dt>会员信誉档案</dt>
				<dd>
					<p align="center">
                        <asp:HyperLink ID="hyLinkUserName" runat="server"></asp:HyperLink> <img src="images/ico_qq.gif" width="61" height="15" hspace="6" align="absmiddle" /></p>
					
					<div class="tabs">
						<a href="cont1">全部</a>	  <a href="cont2" class="focus">账号</a>   <a href="#">金币</a> 
						<div class="clear"></div>
					</div>
					<div class="tabs-content" id="cont1" style="display:none">
							<p>卖家信用：<span class="num"><asp:Literal ID="litisSalerScores" runat="server"></asp:Literal></span> <img src="images/icon2.gif" width="18" height="16" align="absmiddle" /><img src="images/icon2.gif" width="18" height="16" align="absmiddle" /><img src="images/icon2.gif" width="18" height="16" align="absmiddle" /></p>
							<p>买家信用：<span class="num"><asp:Literal ID="litisBuyerScores" runat="server"></asp:Literal></span> <img src="images/icon2.gif" width="18" height="16" align="absmiddle" /><img src="images/icon2.gif" width="18" height="16" align="absmiddle" /><img src="images/icon2.gif" width="18" height="16" align="absmiddle" /></p>
							<p>卖家好评率： 
                                <asp:Literal ID="litisSalerPer" runat="server"></asp:Literal></p>
							<p>买家好评率：<asp:Literal ID="litisBuyerPer" runat="server"></asp:Literal></p>
							<p>注册时间： 
                                <asp:Literal ID="litInTime" runat="server"></asp:Literal></p>
											</div>
					<div class="tabs-content" id="cont2">
						<p class="orange-text h24"><strong>作为账号卖家</strong></p>
						<p class="blue-text h24"><strong>卖家信用积累</strong><span class="hui-text"> -----------</span></p>
						<p>&nbsp;&nbsp;信用：<span class="blue-text"><strong>1097</strong></span> <img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /><img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /><img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /></p>
						<p>好评率：<strong>97.23</strong>% </p>
						<p>成交率：<span class="blue-text">2609笔</span>/76%</p>
						<p class="blue-text h24"><strong>售后服务评分</strong><span class="hui-text"> -----------</span></p>
						<p>售后承诺执行：<img src="images/start1.gif" width="11" height="11" align="absmiddle" /><img src="images/start1.gif" width="11" height="11" align="absmiddle" /><img src="images/start1.gif" width="11" height="11" align="absmiddle" /><img src="images/start1.gif" width="11" height="11" align="absmiddle" /><img src="images/start2.gif" width="11" height="11" align="absmiddle" /> <span class="blue-text">4.7</span></p>
						<p>售后服务态度：<img src="images/start1.gif" width="11" height="11" align="absmiddle" /><img src="images/start1.gif" width="11" height="11" align="absmiddle" /><img src="images/start1.gif" width="11" height="11" align="absmiddle" /><img src="images/start1.gif" width="11" height="11" align="absmiddle" /><img src="images/start2.gif" width="11" height="11" align="absmiddle" /> <span class="blue-text">4.7</span></p>
						
						<p class="orange-text h24"><strong>作为账号买家</strong></p>
						<p class="blue-text h24"><strong>买家信用积累</strong><span class="hui-text"> -----------</span></p>
						<p>&nbsp;&nbsp;信用：<span class="blue-text"><strong>1097</strong></span> <img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /><img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /><img src="images/ico_lanzuan.gif" width="15" height="13" align="absmiddle" /></p>
						<p>好评率：<strong>97.23</strong>% </p>
						<p>成交率：<span class="blue-text">2609笔</span>/76%</p>						
						<p>注册时间：2007-03-12</p>
						<p align="center"><img src="images/btn_scbdp.gif" vspace="5" /><img src="images/btn_qbdp.gif" hspace="5" vspace="5" /></p>
					</div>					
				</dd>
		  </dl>
  </div>
 