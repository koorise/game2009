<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PassPortModifyList.ascx.cs" Inherits="userInfo_PassPortModifyList" %>
<div class="cont">
				<h1>清空密保问答案申请</h1>
				
				<p>&nbsp;</p>
				<p align="left" class="w740"><a href="#" class="spanbtn"><span>点此申请清空密报问题答案</span></a></p>
				<p align="left" class="passform">&nbsp;</p>
				<p align="left" class="passform">&nbsp;</p>
				<p align="left" class="w740"><strong>历史信息</strong> <img src="images/dot_hist.gif" width="11" height="11" align="absmiddle" /></p>
				
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
     <table width="740" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#ACD0F1">

                      <tr>
                        <td width="132" height="30" align="center" bgcolor="#D5EBFF" class="title">编号	                     </td>
                        <td width="253" height="30" align="center" bgcolor="#D5EBFF" class="title">创建时间 </td>
                        <td width="142" height="30" align="center" bgcolor="#D5EBFF" class="title">操作 </td>
                        <td height="30" align="center" bgcolor="#D5EBFF" class="title">订单状态/操作</td>
                      </tr>
    </HeaderTemplate>
    <ItemTemplate>
                  <tr>
                    <td width="132" rowspan="2" align="center" bgcolor="#FFFFFF"><%# Eval("NID") %></td>
                    <td height="30" align="center" bgcolor="#FFFFFF">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("intime","{0:d}") %>'></asp:Label></td>
                    <td align="center" bgcolor="#FFFFFF" class="blue">申请修改</td>
                    <td width="208" rowspan="2" align="center" bgcolor="#FFFFFF"><p>同意修改</p>
                      <p><br />
                        <a href="#">查看</a>/<a href="#">处理</a></p></td>
                  </tr>
                  <tr>
                    <td height="30" align="center" bgcolor="#FFFFFF">2009-02-28  13：30：21</td>
                    <td align="center" bgcolor="#FFFFFF" class="green"><strong>同意修改</strong></td>
                  </tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
                 <tr>
                    <td rowspan="2" align="center" bgcolor="#F2F2F2">ZF200902182999203</td>
                    <td height="30" align="center" bgcolor="#F2F2F2">2009-02-28  13：30：21</td>
                    <td align="center" bgcolor="#F2F2F2" class="blue">申请修改</td>
                    <td rowspan="2" align="center" bgcolor="#F2F2F2"><p>处理完毕</p>
                        <p><br />
                            <a href="#">查看</a>/<a href="#">处理</a></p></td>
                  </tr>
                  <tr>
                    <td height="30" align="center" bgcolor="#F2F2F2">2009-02-28  13：30：21</td>
                    <td align="center" bgcolor="#F2F2F2" class="green"><strong>同意修改</strong></td>
                  </tr>
    </AlternatingItemTemplate>
    <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>
				<table width="740" border="0" align="center" cellpadding="3" cellspacing="0">
                  <tr>
                    <td width="22%" align="center"><div style="line-height:30px; float:left">共190条  显示20条 </div></td>
                    <td width="78%"><table border="0" align="right" cellpadding="0" cellspacing="3">
                        <tr>
                          <td valign="middle"><a href="#"><img src="images/btn_prevpatge.gif" width="19" height="19" border="0" align="absmiddle" /></a> </td>
                          <td class="pages"><a href="#" class="focus"><span>1</span></a> <a href="#"><span>2</span></a> <a href="#"><span>3</span></a> <a href="#"><span>4</span></a> <a href="#"><span>5</span></a> <a href="#"><span>6</span></a> <a href="#"><span>7</span></a> </td>
                          <td><a href="#"><img src="images/btn_nextpage.gif" width="55" height="19" border="0" align="absmiddle" /></a> </td>
                          <td>到第
                            <input name="textfield" type="text" class="pgbox" size="4" />
                            页
                            <label>
                              <input type="image" name="imageField2" src="images/btn_confirm.gif" align="absmiddle"/>
                            </label></td>
                        </tr>
                    </table></td>
                  </tr>
                </table>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p align="center" class="passform">&nbsp;</p>
		  </div>