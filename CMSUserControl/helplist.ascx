<%@ Control Language="C#" AutoEventWireup="true" CodeFile="helplist.ascx.cs" Inherits="CMSUserControl_helplist" %>
	<div class="pos">您的位置：首页 &gt;&gt; 帮助中心 &gt;&gt; 账号交易帮助 &gt;&gt; 交易流程 &gt;&gt; 如果买家拍下来不付款？</div>
		<div class="midp">
		
        <div class="main">		  
		  <div class="helpsearch">
				<strong>帮助搜索</strong>
              <asp:TextBox ID="TextBox1" CssClass="input" runat="server"></asp:TextBox>
			    <label>
                    <asp:ImageButton ID="ImgBtnSearch" ImageUrl="~/images/btn_hlpsearch.gif" 
                    ImageAlign="AbsMiddle" runat="server" onclick="ImgBtnSearch_Click" />
			    </label>
		  </div>
			
		  <div class="line2">&nbsp;</div>
		  <div class="faq_cont">
              <asp:DataList ID="DataList1" runat="server">
                <HeaderTemplate><ul class="faq_list"></HeaderTemplate>
                <ItemTemplate><li>
                    <asp:HyperLink ID="HyperLink1" Text='<%# Eval("title") %>' NavigateUrl='<%# DataBinder.Eval(Container.DataItem,"unid","~/HelpDetail.aspx?Unid={0}") %>' runat="server"></asp:HyperLink></ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
              </asp:DataList>
		  </div>
		  
		  
		  <div>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <table width="500" height="160" border="0" align="center" cellpadding="0" cellspacing="10" class="faq_svc">
              <tr>
                <td align="center" style="line-height:24px;"><span class="money f14">没有我想问的问题？</span> <a href="#"><strong>立刻联系易站客服为您解答</strong></a><br />
                  <strong>如果客服不在线，请您QQ留言，有问必答。</strong></td>
                <td width="120" rowspan="2" align="center"><img src="images/faq_svc.gif" width="118" height="143" /></td>
              </tr>
              <tr>
                <td><table width="314" border="0" align="center" cellpadding="0" cellspacing="0" background="images/faq_svc_list_middle.gif">
                  <tr>
                    <td height="5" valign="top"><img src="images/faq_svc_list_top.gif" width="314" height="5" /></td>
                  </tr>
                  <tr>
                    <td height="55" background="images/faq_svc_list_center.gif" style="border-left:1px solid #C7E4FB; border-right:1px solid #C7E4FB;"><table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="167" height="24">客服名称</td>
                        <td width="113" height="24">QQ号码</td>
                      </tr>
                      <tr>
                        <td height="24"><strong>游戏易站咨询客服</strong></td>
                        <td height="24"><strong>22065010</strong><a href="#">[复制]</a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="6" valign="bottom"><img src="images/faq_svc_list_bottom.gif" width="314" height="6" /></td>
                  </tr>
                </table></td>
              </tr>
            </table>
		  </div>
		  </div>
		</div>