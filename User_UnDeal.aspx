<%@ Page Language="C#" MasterPageFile="~/UserManager.master" AutoEventWireup="true" CodeFile="User_UnDeal.aspx.cs" Inherits="User_UnDeal" Title="无标题页" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    
    <div class="cont">
				<h1>(仍)未成交的<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
                    </asp:ScriptManagerProxy></h1>
				<div class="tips">
				  <strong>易站小贴士：</strong>只要您一直保持登录状态不关闭易站网页，则您参与竞拍的交易一旦成功胜出或者出价被超过，则会收到易站的系统提示，<br />
					有助于买家快速成交！
				</div>
				<!--search form start-->
				<div class="bsbox searchform">

				  		<div id="simplesearch">
				  		<asp:UpdatePanel ID="UpdatePanel2" runat="server" 
                                UpdateMode="Conditional">
                                <ContentTemplate>
							创建时间：<asp:TextBox ID="tbStart" runat="server" Width="80px"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                                TargetControlID="tbStart">
                            </cc1:CalendarExtender>
                            &nbsp;&nbsp;至&nbsp;&nbsp;<asp:TextBox
                                ID="tbEnd" runat="server" Width="80px"></asp:TextBox>                        &nbsp;<cc1:CalendarExtender 
                                ID="CalendarExtender2" runat="server" TargetControlID="tbEnd">
                            </cc1:CalendarExtender>
                            &nbsp;&nbsp;&nbsp;游戏/服务器：
                                <asp:DropDownList ID="ddlGameID" runat="server" AutoPostBack="True"
    onselectedindexchanged="ddlGameID_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlServerID" runat="server">
                                        <asp:ListItem Value="0">请选择服务器</asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlGameID" 
                                        EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
						</div>
						<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                          <asp:Panel ID="Panel1" runat="server" Visible="False">
						<div id="advancedsearch" >
							关键词：<asp:TextBox ID="tbKeyWord" Width="250px" CssClass="unwatermarked"  runat="server"></asp:TextBox>
							<cc1:TextBoxWatermarkExtender
                                ID="TextBoxWatermarkExtender1"
                                WatermarkText="您可以输入商品标题、或订单编号" 
                                WatermarkCssClass="watermarked" TargetControlID="tbKeyWord" runat="server" >
                            </cc1:TextBoxWatermarkExtender> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
							订单状态：<asp:DropDownList ID="ddlDealStatus"
                                runat="server">
                            </asp:DropDownList>
						</div>   
						</asp:Panel>
						</ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="lbtnSearchMore" EventName="Click" />
                            </Triggers>
                    </asp:UpdatePanel>
						<div class="btns">
                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/btn_search.gif" ImageAlign="AbsMiddle" runat="server" /> <span id="searchtype">
                            <asp:LinkButton ID="lbtnSearchMore" Text="高级搜索选项" runat="server" 
                                onclick="lbtnSearchMore_Click"></asp:LinkButton></span>
                        </div>
                    
                            
                    
                        
			    </div>
				<!--searchform end-->
				<div class="list">
				  <table width="100%" border="0" cellspacing="0" cellpadding="5">
				  	<thead>
                      <tr>
                        <th colspan="6">
						
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td valign="middle"><strong>快捷搜索：</strong></td>
                            <td><a href="#"><span>等待我付款的</span> </a> 
						<a href="#"><span>等待卖家交货的</span></a>
						<a href="#"><span>竞价领先的</span></a>
						<a href="#"><span>出局可加价的</span></a>
						<a href="#"><span>全部</span></a></td>
                            <td><span style="color:#006093;">&nbsp;&nbsp; &nbsp;&nbsp;每页显示数量 
						        <a href="#"><img src="images/btn_20.gif" width="19" height="16" border="0"  align="absmiddle"/></a>
						        <a href="#"><img src="images/btn_40.gif" width="19" height="16" border="0"  align="absmiddle"/></a>
						        <a href="#"><img src="images/btn_80.gif" width="19" height="16" border="0" align="absmiddle" /></a></span></td>
                          </tr>
                        </table>
						</th>
                      </tr>
                      <tr>
                        <td width="232">信息标题/物品类型<br />
                          游戏区服<br />
                        订单编号</td>
                        <td width="99">购买件数<br />
                          我的出价<br />
                        我的最高出价<br /></td>
                        <td width="94">创建时间</td>
                        <td width="103">剩余时间</td>
                        <td width="94">订单状态</td>
                        <td width="87" class="lastd">操作</td>
                      </tr>
				    </thead>
					  <tbody>
                      <tr>
                        <td>
						<div class="icotype"><img src="images/ico_zhang.gif" width="21" height="21" /></div>
						<div class="msg">
						<span class="tip">						
						80级凶猛盗贼无敌的很非常超级帅气<br />
                        的男人法师，再不来错过了.</span><br />
                          游戏区服:美服魔兽 Ageywnn –A<br />
                        订单编号：DB1298198291829182918<br />
						</div>						</td>
                        <td align="center"><em>1</em>/1<br />
                          <em>50.00</em>元<br />
                        <em>300.00</em>元<br /></td>
                        <td align="center">2009-02-11<br />
                        13：12：29<br /></td>
                        <td align="center">2天2小时11分</td>
                        <td align="center"><img src="images/btn_lingxian.gif" width="59" height="22" /></td>
                        <td align="center"><a href="#" class="org">查看</a><br />
                          <a href="#" class="tip">退出竞拍</a></td>
                      </tr>
                      <tr>
                        <td><div class="icotype"><img src="images/ico_jin.gif" width="21" height="21" /></div>
                            <div class="msg"> <span class="tip"> 80级凶猛盗贼无敌的很非常超级帅气<br />
                              的男人法师，再不来错过了.</span><br />
                              游戏区服:美服魔兽 Ageywnn –A<br />
                              订单编号：DB1298198291829182918<br />
                          </div></td>
                        <td align="center"><em>1</em>/1<br />
                            <em>50.00</em>元<br />
                            <em>300.00</em>元<br /></td>
                        <td align="center">2009-02-11<br />
                          13：12：29<br /></td>
                        <td align="center">2天2小时11分</td>
                        <td align="center"><p><img src="images/btn_chuju.gif" width="59" height="22" /></p>
                        <p><a href="#" class="tip">提高出价</a></p></td>
                        <td align="center"><a href="#" class="org">查看</a><br />
                          <a href="#" class="tip">退出竞拍</a></td>
                      </tr>
                      <tr>
                        <td><div class="icotype"><img src="images/ico_zhang2.gif" width="22" height="21" /></div>
                            <div class="msg"> <span class="tip"> 80级凶猛盗贼无敌的很非常超级帅气<br />
                              的男人法师，再不来错过了.</span><br />
                              游戏区服:美服魔兽 Ageywnn –A<br />
                              订单编号：DB1298198291829182918<br />
                          </div></td>
                        <td align="center"><em>1</em>/1<br />
                            <em>50.00</em>元<br />
                            <em>300.00</em>元<br /></td>
                        <td align="center">2009-02-11<br />
                          13：12：29<br /></td>
                        <td align="center">2天2小时11分</td>
                        <td align="center"><p><img src="images/btn_dengdai.gif" width="59" height="22" /></p>
                        <p><a href="#" class="tip">立刻付款</a></p></td>
                        <td align="center"><a href="#" class="org">查看</a><br />
                          <a href="#" class="tip">退出竞拍</a></td>
                      </tr>
					  </tbody>
					  <tfoot>
                      <tr>
                        <td colspan="6">
						<div style="line-height:30px; float:left">物品信息总数：10    显示总页数：1</div>
						<table border="0" align="right" cellpadding="0" cellspacing="3">
						  <tr><td valign="middle">
						  <a href="#"><img src="images/btn_prevpatge.gif" width="19" height="19" border="0" align="absmiddle" /></a>	
						  </td>
						  <td class="pages">
						  <a href="#" class="focus"><span>1</span></a>
						  <a href="#"><span>2</span></a>
						  <a href="#"><span>3</span></a>
						  <a href="#"><span>4</span></a>
						  <a href="#"><span>5</span></a>
						  <a href="#"><span>6</span></a>
						  <a href="#"><span>7</span></a>
						  </td><td>
						  <a href="#"><img src="images/btn_nextpage.gif" width="55" height="19" border="0" align="absmiddle" /></a> 
						  </td>
						  </tr>
						  </table>
					  
						</td>
                      </tr>
					  </tfoot>
                    </table>
				</div>
				
			</div>    
</asp:Content>

