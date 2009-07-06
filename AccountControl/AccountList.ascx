<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountList.ascx.cs" Inherits="AccountControl_AccountList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<script language="javascript">
	function changeSearch(obj){
		if($(obj).html()=="高级搜索选项"){
			$("#advancedsearch").css("display","block");
			$(obj).html("精简搜索选项");
		}else{
			$("#advancedsearch").css("display","none");
			$(obj).html("高级搜索选项");
		}
		return false;
	}

</script>
<div class="cont">
				<h1>
                    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
                    </asp:ScriptManagerProxy>
                    (仍)未成交的</h1>
				<div class="tips">
				  <strong>易站小贴士：</strong>您发布的出售信息有买家竞价时，如果您强行撤单，会影响您的成交率指数。所以针对错误订单请您及时撤单 </div>
				<!--search form start-->
				
				<div class="bsbox searchform">
						<div id="simplesearch" >
							<div >
								<span class="lable">关键词：</span>
                                <asp:TextBox ID="tbKeyWord" CssClass="input" runat="server"></asp:TextBox>
                                <!--  water mark :您可以输入商品标题、或订单编号 --> 
								&nbsp;&nbsp; 
								订单状态：
                                <asp:DropDownList ID="ddlProductStatusID" runat="server">
                                </asp:DropDownList>
							</div>
							
						</div>
						<div id="advancedsearch" >
						<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
							<span class="lable">游戏/服务器：</span>
                            <asp:DropDownList ID="ddlGame" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="ddlGame_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlServer" runat="server">
                                <asp:ListItem Value="0">请选择服务器</asp:ListItem>
                            </asp:DropDownList>
                            </ContentTemplate>
                </asp:UpdatePanel> &nbsp;
                        	创建时间：&nbsp;
                            <asp:TextBox ID="tbStartTime" CssClass="input" runat="server"></asp:TextBox>&nbsp;<cc1:CalendarExtender 
                                ID="CalendarExtender1" runat="server" TargetControlID="tbStartTime">
                            </cc1:CalendarExtender>
                            至&nbsp;
                            <asp:TextBox ID="tbEndTime" CssClass="input" runat="server"></asp:TextBox> 
							<cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                                TargetControlID="tbEndTime">
                            </cc1:CalendarExtender>
							<br />
							<div align="left" style="display:block; text-indent:0px; padding-left:0px;">
							<span class="lable">买家：</span>
							<asp:TextBox ID="tbBuyerName" CssClass="input" runat="server"></asp:TextBox> </div>
						</div>
						
						<div class="btns">
                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/btn_search.gif" 
                                ImageAlign="AbsMiddle" runat="server" onclick="ImageButton1_Click" />
                            <span id="searchtype">
                                <a href="javascript:void(0);" onclick="return changeSearch(this);">高级搜索选项</a></span>						</div>
			    </div>
                    
				<!--searchform end-->
				<div class="list">
				  <table width="100%" border="0" cellspacing="0" cellpadding="5">
				  	<thead>
                      <tr>
                        <th colspan="7">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="39%" align="left" valign="middle">
						     <strong>快捷搜索：						      
                                 <asp:HyperLink ID="hyLink" ImageUrl="~/images/ddjhddd.gif" ToolTip="等待交货的订单" runat="server"></asp:HyperLink></strong></td>
                            <td width="37%" align="right" valign="middle">&nbsp;</td>
                            <td width="24%"><span style="color:#006093;">&nbsp;&nbsp; &nbsp;&nbsp;每页显示数量
                                <asp:ImageButton ID="ImageButton20" ImageUrl="~/images/btn_20.gif" ImageAlign="AbsMiddle" runat="server" /> 
                                <asp:ImageButton ID="ImageButton40" ImageUrl="~/images/btn_40.gif" ImageAlign="AbsMiddle" runat="server" />
                                <asp:ImageButton ID="ImageButton80" ImageUrl="~/images/btn_80.gif" ImageAlign="AbsMiddle" runat="server" />
						        </span></td>
                          </tr>
                        </table>						</th>
                      </tr>
                      </thead>
                      </table>
                      <!--物品列表 start-->
                    <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
				  	    <thead>
                          <tr>
                            <td width="243" align="left" valign="top"><span class="mar20">信息标题/物品类型<br />
    游戏区服<br />
    订单编号</span></td>
                            <td width="83" align="left" valign="top"><span class="mar20">交易金额</span></td>
                            <td width="68" align="center" valign="top">物品件数         </td>
                            <td width="74" align="center" valign="top">买家</td>
                            <td width="82" align="center" valign="top">创建时间</td>
                            <td width="73" align="center" valign="top">订单状态</td>
                            <td width="76" align="center" valign="top" class="lastd">操作</td>
                          </tr>
				        </thead>
                       </HeaderTemplate>
                       <ItemTemplate>
                        <tr>
                        <td>
						<div class="icotype"><img src="images/ico_zhang.gif" width="21" height="21" /></div>
						<div class="msg">
						<span class="tip">						
                            <asp:Literal ID="Literal1" Text='<%# Eval("title") %>' runat="server"></asp:Literal></span><br />
                          游戏区服:<asp:Literal ID="Literal2" Text='<%# Eval("gamename") %>' runat="server"></asp:Literal>/<asp:Literal ID="Literal6" Text='<%# Eval("Servername") %>' runat="server"></asp:Literal><br />
                        订单编号：<asp:Literal ID="Literal3" Text='<%# Eval("OrderNumber") %>' runat="server"></asp:Literal><br />
						</div>						</td>
                        <td align="center"><p><br />
                            <em>
                                <asp:Literal ID="Literal4" Text='<%# Eval("Pricenow") %>' runat="server"></asp:Literal></em>元</p>
                          <p><br />                          
                            <br />
                          </p></td>
                        <td align="center"><span class="blue"><strong>
                            <asp:Literal ID="Literal5" Text='<%# Eval("pAccountNums") %>' runat="server"></asp:Literal></strong></span> 件<br /></td>
                        <td align="center"><p>
                            <asp:HyperLink ID="HyperLink3" NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"uID","~/user.aspx?UID={0}") %>' Text='<%# DataBinder.Eval(Container.DataItem,"username") %>' runat="server"></asp:HyperLink></p>
                        <p><img src="images/ico_lanzuan.gif" width="15" height="13" /><img src="images/ico_lanzuan.gif" width="15" height="13" /><img src="images/ico_lanzuan.gif" width="15" height="13" /></p></td>
                        <td align="center">
                            <asp:Literal ID="Literal7" Text='<%# Eval("orderintime") %>' runat="server"></asp:Literal></td>
                        <td align="center"><p>
                            <asp:Image ID="Image1" ImageUrl='<%# Dictionary.orderTypeImage(int.Parse(Eval("OrderType").ToString())) %>' runat="server" /></p>
                          <p>
                              <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("PNKID") %>' CommandName="setOK" runat="server">提前成交</asp:LinkButton><br />
                          </p></td>
                        <td align="center">
                            <asp:HyperLink ID="HyperLink1" CssClass="orange" NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"PNKID","~/ProductDone.aspx?PNKID={0}") %>' runat="server">查看物品</asp:HyperLink><br />
                          <asp:HyperLink ID="HyperLink2" CssClass="orange" NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"PNKID","~/ProductDone.aspx?PNKID={0}") %>' runat="server">处理订单</asp:HyperLink>></td>
                      </tr>
                       </ItemTemplate>
                       <FooterTemplate>
                          
                       </FooterTemplate>
                    </asp:Repeater>
                   <!-- 页脚-->
                        <tfoot>
                          <tr>
                            <td colspan="7">
						    <div style="line-height:30px; float:left">物品信息总数：<asp:Literal ID="litCounts" runat="server"></asp:Literal>    显示总页数：<asp:Literal ID="litPageCount" runat="server"></asp:Literal></div>
						    <table border="0" align="right" cellpadding="0" cellspacing="3">
						      <tr><td valign="middle">
                                  <asp:ImageButton ID="imgBtnPrv" ImageUrl="~/images/btn_prevpatge.gif" 
                                      runat="server" onclick="imgBtnPrv_Click" />	
						      </td>
						      <td class="pages">
                                  <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
						      </td><td>
                                  <asp:ImageButton ID="imgBtnNext" ImageUrl="~/images/btn_nextpage.gif" 
                                          runat="server" onclick="imgBtnNext_Click" />
                                  </td>
						      </tr>
						      </table>						</td>
                          </tr>
					      </tfoot>
                        </table>
				</div>
				
		  </div>