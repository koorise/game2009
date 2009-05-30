<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Shop.ascx.cs" Inherits="ShopUserControl_Shop" %>
		<%@ Register src="../WebUserControl/UserTips.ascx" tagname="UserTips" tagprefix="uc1" %>
		<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
		<div class="pos">
            <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
            <a href="#">易站首页</a> >> <a href="#">账号店铺列表</a> >> 
            <asp:HyperLink ID="hySHopname" runat="server"></asp:HyperLink></div>
		<div class="ad001"></div>
<uc1:UserTips ID="UserTips1" runat="server" />
		<div class="right">
		  <div class="dpgg">
				<div class="logo">
				<asp:Image ID="imgShopLogo" width="125" height="125"
                        runat="server" />
				</div>
				<dl class="content">
					<dt>店铺公告</dt>
					<dd>
						<p align="left">
                            <asp:Literal ID="litShopPost" runat="server"></asp:Literal></p>
						<p>&nbsp;</p>
						<p align="right">后更新：<asp:Literal ID="LitShopLastUpdateTIme" runat="server"></asp:Literal></p>
					</dd>
		 		</dl>
		  </div>
		  <div class="clear"></div>
             <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
               <dl class="zgtj">
				<dt>店铺公告</dt>
				<dd>
					<ul>
            </HeaderTemplate>
            <ItemTemplate>
            	<li><img src="images/ico_li.gif" align="absmiddle" />
                    <asp:HyperLink ID="HyperLink2" Text='<%# Eval("Title") %>' NavigateUrl='<%# Eval("pnkid","~/ProductDetails.aspx?pnkid={0}") %>' runat="server"></asp:HyperLink>    <span class="red-text"><strong>
                        <asp:Literal ID="Literal5" Text='<%# Eval("priceTop","{0:c}") %>' runat="server"></asp:Literal></strong></span><span class="blue-text">元</span></li>
            </ItemTemplate>
            <FooterTemplate>
            	</ul>
				</dd>
				
	 	  </dl>
            </FooterTemplate>
            </asp:Repeater>
		  <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
        <div class="search">
				<div class="s_title">
					<img src="images/btn_search_ico.gif" width="89" height="27" />
					<span class="close"><a href="#">收起</a></span>				</div>
        <div class="s_content">
        <asp:Panel ID="Panel1" runat="server">
		      
                       <p>
                        <asp:DropDownList ID="ddlGame" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlGame_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlServer" runat="server">
                            <asp:ListItem Value="0">全部服务器</asp:ListItem>
                        </asp:DropDownList> 
                        &nbsp;&nbsp;
					职业：<asp:DropDownList ID="ddlJob" runat="server">
					      <asp:ListItem Value="0">全部</asp:ListItem>
                        </asp:DropDownList> &nbsp;&nbsp;
					等级范围：<asp:TextBox ID="tbLeveL1" Width="40px" CssClass="input" runat="server"></asp:TextBox> 
					至 
                        <asp:TextBox ID="tbLevel2" CssClass="input" Width="40px" runat="server"></asp:TextBox> &nbsp;&nbsp;
					种族：<asp:DropDownList ID="ddlRace" runat="server">
					      <asp:ListItem Value="0">全部</asp:ListItem>
                        </asp:DropDownList>
                        </p>

                        </asp:Panel>
                    <p>
					一口价范围：<asp:TextBox ID="tbPrice1" CssClass="input" Width="40px"  runat="server"></asp:TextBox> 至<asp:TextBox ID="tbPrice2" Width="40px" CssClass="input"  runat="server"></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;
					诚信保障计划：<asp:DropDownList ID="ddlPromise" runat="server">
                          <asp:ListItem Value="0">不限</asp:ListItem>
                        <asp:ListItem Value="true">是</asp:ListItem>
                        <asp:ListItem Value="false">否</asp:ListItem>
                        </asp:DropDownList> 
					</p>
                    <asp:Panel ID="Panel2" Visible=false runat="server">
					<p>关键字：<asp:TextBox ID="tbKeyWord" CssClass="input" Text="您可以输入标题关键字、物品编号"  runat="server"></asp:TextBox>
					出售模式：<asp:DropDownList 
                            ID="ddlSaleMethod" runat="server">
                        </asp:DropDownList></p>
                    <p>
                    密保资料：<asp:DropDownList  ID="ddlPassPort" runat="server">
                        <asp:ListItem Value="0">不限</asp:ListItem>
                        <asp:ListItem Value="true">是</asp:ListItem>
                        <asp:ListItem Value="false">否</asp:ListItem>
                    </asp:DropDownList>
                        注册时间： 
                        <asp:TextBox ID="tbRegTime1" CssClass="input" runat="server"></asp:TextBox> 
                        <asp:Image ID="Image5" runat="server" 
                            ImageUrl="~/images/Calendar_scheduleHS.png" />
                        至  
                        <asp:TextBox ID="tbRegTIme2" CssClass="input" runat="server"></asp:TextBox> 
                        <asp:Image ID="Image6" runat="server" 
                            ImageUrl="~/images/Calendar_scheduleHS.png" />
                    </p>
					<p>
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                            PopupButtonID="Image5" TargetControlID="tbRegTime1">
                        </cc1:CalendarExtender>
                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                            PopupButtonID="Image6" TargetControlID="tbRegTIme2">
                        </cc1:CalendarExtender>
                    </p>
					<p>注册黄图：<asp:DropDownList ID="ddlYellowPage" runat="server">
					<asp:ListItem Value="0">不限</asp:ListItem>
					<asp:ListItem Value="true">是</asp:ListItem>
                        <asp:ListItem Value="false">否</asp:ListItem>
                        </asp:DropDownList>    到期时间： 
                        <asp:TextBox ID="tbEndTime1" CssClass="input" runat="server"></asp:TextBox> 
                        <asp:Image ID="Image7" runat="server" 
                            ImageUrl="~/images/Calendar_scheduleHS.png" />
                        至   
                        <asp:TextBox ID="tbEndTime2" CssClass="input" runat="server"></asp:TextBox> 
                        <asp:Image ID="Image8" runat="server" 
                            ImageUrl="~/images/Calendar_scheduleHS.png" />
                        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" 
                            PopupButtonID="Image7" TargetControlID="tbEndTime1">
                        </cc1:CalendarExtender>
                        <cc1:CalendarExtender ID="CalendarExtender4" runat="server" 
                            PopupButtonID="Image8" TargetControlID="tbEndTime2">
                        </cc1:CalendarExtender>
                        </p>
					<p>邮箱资料：<asp:DropDownList ID="ddlEmail" runat="server">
					    <asp:ListItem Value="0">不限</asp:ListItem>
                        <asp:ListItem Value="true">是</asp:ListItem>
                        <asp:ListItem Value="false">否</asp:ListItem>
                        </asp:DropDownList>   最后登录： 
                        <asp:TextBox ID="tbLastLoginTime1" CssClass="input" runat="server"></asp:TextBox> 
                        <asp:Image ID="Image9" runat="server" 
                            ImageUrl="~/images/Calendar_scheduleHS.png" />
                        至   
                        <asp:TextBox ID="tbLastLoginTIme2" CssClass="input" runat="server"></asp:TextBox> 
                        <asp:Image ID="Image10" runat="server" 
                            ImageUrl="~/images/Calendar_scheduleHS.png" />
                        <cc1:CalendarExtender ID="CalendarExtender5" runat="server" 
                            PopupButtonID="Image9" TargetControlID="tbLastLoginTime1">
                        </cc1:CalendarExtender>
                        <cc1:CalendarExtender ID="CalendarExtender6" runat="server" 
                            PopupButtonID="Image10" TargetControlID="tbLastLoginTime2">
                        </cc1:CalendarExtender>
                        </p>
					</asp:Panel>
					<p align="center" id="simp">
                        <asp:ImageButton ID="imgBtnSearch" ImageUrl="~/images/btn_search.gif" 
                            runat="server" onclick="imgBtnSearch_Click" />
                        <asp:LinkButton ID="LinkButton2" runat="server" Text="更多搜索选项>>" onclick="LinkButton2_Click"></asp:LinkButton></p>
				</div>
				                        </ContentTemplate>
                    </asp:UpdatePanel>
		 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list">
		   <tr>
		     <td align="left" class="list-title"><table width="96%" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
               <tr>
                 <td align="left"> <span class="black_text"><strong>排序方式：</strong></span>                   
                   <select name="select">
                   <option>默认</option>
                   </select>                 </td>
                 <td align="right">&nbsp;每页显示数量 
                     <asp:HyperLink ID="HyperLink3"    ImageUrl="~/images/btn_20.gif" runat="server"></asp:HyperLink>
                     <asp:HyperLink ID="HyperLink4"    ImageUrl="~/images/btn_40.gif" runat="server"></asp:HyperLink>
                     <asp:HyperLink ID="HyperLink5"    ImageUrl="~/images/btn_60.gif" runat="server"></asp:HyperLink></td>
               </tr>
             </table></td>
	       </tr>
		   <tr>
		     <td align="left">
		     <!---Start -->
                 <asp:Repeater ID="Repeater2" runat="server">
                 <HeaderTemplate>
                    <table width="100%" border="0" cellpadding="5" cellspacing="0" class="list-content">
                       <tr>
                         <th width="270" scope="col">标题、卖家信用、游戏/服务器</th>
                         <th width="80" scope="col">属性</th>
                         <th width="120" scope="col">价格	       </th>
                         <th width="60" scope="col">数量</th>
                         <th width="80" scope="col"> 安全资料    	 </th>
                         <th class="last" scope="col">剩余时间</th>
                       </tr>
                 </HeaderTemplate>
                 <ItemTemplate>
                       <tr>
                         <td><img src="images/ico_huang.gif" width="20" height="19" align="absmiddle" /> 
                             <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"pnkid","~/ProductDetails.aspx?PnkID={0}") %>' Text='<%# Eval("Title") %>' runat="server"></asp:HyperLink>
                         <br />
                           物品种类：游戏账号<br />
                         游戏区服：<asp:Literal ID="Literal1" Text='<%# Eval("gamename") %>' runat="server"></asp:Literal> 
                             <asp:Literal ID="litServer" Text='<%# Eval("servername") %>' runat="server"></asp:Literal></td>
                         <td align="center" valign="middle"><asp:Image ID="Image1" ImageUrl='<%# Tools.PicShow(bool.Parse(Eval("pPromise").ToString()),"~/images/ico_pei.gif") %>' width="18" height="19" runat="server" /></td>
                         <td align="center" valign="middle"><span class="green"><strong>
                             <asp:Literal ID="Literal2" Text='<%# Eval("priceNow","{0:c}") %>' runat="server"></asp:Literal></strong></span> <span class="green"><strong>当前</strong></span><br />
                           <span class="red-text"><strong><asp:Literal ID="Literal3" Text='<%# Eval("pricetop","{0:c}") %>' runat="server"></asp:Literal></strong></span><span class="red-text"><strong>一口价</strong></span></td>
                         <td align="center" valign="middle">
                             <asp:Literal ID="Literal4"  Text='<%# Eval("pAccountNums") %>' runat="server"></asp:Literal>件</td>
                         <td align="center" valign="middle">
                         <asp:Image ID="Image2" width="20" height="19" ImageUrl='<%# Tools.PicShow(bool.Parse(Eval("isPassport").ToString()),"~/images/ico_mi.gif") %>'   runat="server" />
                         <asp:Image ID="Image3" width="20" height="19" ImageUrl='<%# Tools.PicShow(bool.Parse(Eval("isMail").ToString()),"~/images/ico_you.gif") %>' runat="server" />
                         <asp:Image ID="Image4" width="20" height="19" ImageUrl='<%# Tools.PicShow(bool.Parse(Eval("isYellow").ToString()),"~/images/ico_huang.gif") %>' runat="server" />
                               </td>
                         <td align="center" valign="middle"><%# Tools.TimeLeft(Eval("pTimeEnd").ToString()) %>></td>
                       </tr>
                 </ItemTemplate>
                 <FooterTemplate></table></FooterTemplate>
                 </asp:Repeater>
          <!---end -->
	         </td>
	       </tr>
				</table>
				
				<table width="100%" border="0" align="left" cellpadding="3" cellspacing="0">
                  <tr>
                    <td width="22%" align="center"><div style="line-height:30px; float:left">共<asp:Literal ID="litRecordCount" runat="server"></asp:Literal>条  显示<asp:Literal ID="litPageSize" runat="server"></asp:Literal>条 </div></td>
                    <td width="78%"><table border="0" align="right" cellpadding="0" cellspacing="3">
                        <tr>
                          <td valign="middle">
                              <asp:HyperLink ID="hyPagePre" runat="server" 
                                  ImageUrl="~/images/btn_prevpatge.gif"></asp:HyperLink>
                            </td>
                          <td class="pages">
                              <asp:Literal ID="LitPageCountor" runat="server"></asp:Literal>
                          </td>
                          <td>
                              <asp:HyperLink ID="hyPageNext" runat="server" 
                                  ImageUrl="~/images/btn_nextpage.gif"></asp:HyperLink>
                            </td>
                          
                        </tr>
                    </table></td>
                  </tr>
                </table>
		  
		</div>		