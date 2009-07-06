<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="CMSUserControl_Search" %>
<div class="pos" style="height:40px; padding-top:7px;"><img src="images/ser_res.gif" width="250" height="36" /></div>
		<div class="midp">		
		  <div class="main1">		  
			  <div class="helpsearch">
					<strong>帮助搜索</strong>
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
					<label>
                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/btn_hlpsearch.gif" 
                        runat="server" onclick="ImageButton1_Click" />
					</label>
			  </div>
				
			  <div class="line2" style="line-height:30px; height:30px;">&nbsp;共计<asp:Label ID="Label1" runat="server" Text=""></asp:Label>条搜索结果</div>
			  <div class="faq_cont">
                  <asp:DataList ID="DataList1" runat="server">
                  <ItemTemplate>
                    <div class="faq">
					<div class="title">
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"unid","~/HelpDetails.aspx?unid={0}") %>' Text='<%# KeyWords(Eval("title").ToString()) %>' runat="server"></asp:HyperLink></div>
					<div class="content">
                        <asp:Literal ID="Literal1" Text='<%# KeyWords(Eval("content").ToString()) %>' runat="server"></asp:Literal> ……</div>
				<!--  <div class="link"><a href="www.uc1z.com/help/traderules/">www.uc1z.com/help/traderules/</a></div> !-->
				  </div>
                  </ItemTemplate>
                  </asp:DataList>
				  

				<table border="0" align="right" cellpadding="0" cellspacing="3" style="float:right; clear:both;">
				<tr>
				  <td valign="middle"><a href="#"><img src="images/btn_prevpatge.gif" width="19" height="19" border="0" align="absmiddle" /></a> </td>
				  <td class="pages">
                      <asp:Literal ID="Literal2" runat="server"></asp:Literal>
				  <a href="#" class="focus"><span>1</span></a> 
				  </td>
				  <td><a href="#"><img src="images/btn_nextpage.gif" width="55" height="19" border="0" align="absmiddle" /></a> </td>
				</tr>
			  </table>
			  </div>
			  
			  <div class="helpsearch"  style="width:730px; float:left; clear:both;">
					<strong>帮助搜索</strong>
					<input name="textfield2" type="text" class="input" />
					<label>
					<input name="imageField2" type="image" src="images/btn_hlpsearch.gif" align="absmiddle" />
					</label>
			  </div>
		  </div>
			
			<div style="width:200px; float:right;">
				<dl class="dlright">
					<dt>最近热问</dt>
					<dd>
						<ul>
                            <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
			    				<li>
                                    <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"unid","~/HelpDetails.aspx?unid={0}") %>' Text='<%# Eval("Title") %>' runat="server"></asp:HyperLink></li>
                            </ItemTemplate>
                            </asp:Repeater>
						</ul>
					</dd>
				</dl>
				
				<dl class="dlsvc">
					<dt>易站客服</dt>
					<dd>游戏易站咨询客服<br />
					  QQ：22018928<a href="#">   [复制]</a><br />
					  如果您未找到满意的答案，请联<br />
					  系易站咨询客服为您解答。<br />
					</dd>
				</dl>
			
		  </div>
	  </div>