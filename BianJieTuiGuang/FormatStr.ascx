<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FormatStr.ascx.cs" Inherits="BianJieTuiGuang_FormatStr" %>
<div class="main">
	  <div class="top">
	    <table width="100%" height="33" border="0" cellpadding="0" cellspacing="0" background="images/posbar_bg.gif">
                <tr>
                  <td width="37" align="left"><img src="images/posbar_left.gif" width="37" height="33" /></td>
                  <td width="150" background="images/posbar_bg0.gif"><strong>便捷推广–设置格式</strong></td>
                  <td align="left"><img src="images/posbar_middle.gif" width="24" height="33" /></td>
                  <td align="right"><img src="images/posbar_right.gif" width="9" height="33" /></td>
                </tr>
              </table>
			</div>
			
			<div class="btnload"><img src="images/btn_loaddefault.gif" /></div>
			<div class="frm">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
						<td width="418" height="400" valign="top" bgcolor="#F3F3F3"><table width="100%" border="0" cellspacing="12" cellpadding="0">
						  <tr>
							<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
								<td align="left" valign="top"><table width="165" border="0" cellpadding="0" cellspacing="0" class="tsel">
								  <tr>
									<td valign="top" class="head1"><p class="b">项目 </p>
									</td>
								  </tr>
								  <tr>
									<td align="right" valign="top" class="body1">
                                        <asp:ListBox ID="ListBox1" runat="server" Height="100%" 
                                            SelectionMode="Multiple" Width="100%">
                                            <asp:ListItem Value="fixtitle">固定标题</asp:ListItem>
                                            <asp:ListItem Value="title">自填标题</asp:ListItem>
                                            <asp:ListItem Value="pDetails">账号详细说明</asp:ListItem>
                                            <asp:ListItem Value="convert(varchar(50),AccountTimeReg,20)">注册日期</asp:ListItem>
                                            <asp:ListItem Value="convert( varchar(50),AccountTimeEnd ,20)">到期日期</asp:ListItem>
                                            <asp:ListItem Value="convert(varchar(50),AccountTimeLastlogin,20)">最后登录</asp:ListItem>
                                            <asp:ListItem Value="isPassPort">是否有密保资料</asp:ListItem>
                                            <asp:ListItem Value="isMail">是否有邮箱资料</asp:ListItem>
                                            <asp:ListItem Value="isYellow">是否有注册黄图</asp:ListItem>
                                            <asp:ListItem Value="convert(varchar(50),pPrice)">当前价</asp:ListItem>
                                            <asp:ListItem Value="convert(varchar(50),pPriceTop)">一口价</asp:ListItem>
                                            <asp:ListItem Value="ProductsPromise">售后承诺</asp:ListItem>
                                            <asp:ListItem Value="$URL$">交易连接</asp:ListItem>
                                            <asp:ListItem Value="$Br$">&lt;回车换行&gt;</asp:ListItem>
                                            <asp:ListItem Value="$TXT1$">&lt;自定义文本1&gt;</asp:ListItem>
                                            <asp:ListItem Value="$TXT1$">&lt;自定义文本2&gt;</asp:ListItem>
                                        </asp:ListBox>
									
									  <p>
									</p>
									</td>
								  </tr>
								  
								</table></td>
								<td width="60" align="center"><p>
                                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/btn_add.gif" 
                                        runat="server" onclick="ImageButton1_Click" /></p>
								<p>&nbsp;</p>
								<p>
                                    <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/btn_del1.gif" 
                                        runat="server" onclick="ImageButton2_Click" /></p></td>
								<td align="right"><table width="165" border="0" cellpadding="0" cellspacing="0" class="tsel">
								  <tr>
									<td valign="top" class="head2">
									  <p class="b">已选                   <Br />           <label>
									  <input type="checkbox" name="checkbox" value="checkbox" />
									设置为默认格式</label>  </p>
									</td>
								  </tr>
								  <tr>
									<td align="left" valign="top" class="body2">
                                        <asp:ListBox ID="ListBox2" runat="server" Height="100%" 
                                            SelectionMode="Multiple" Width="100%"></asp:ListBox>
									</td>
								  </tr>
								  <tr>
									<td align="center" valign="middle" class="foot">
                                        <asp:ImageButton ID="ImageButton3" ImageUrl="~/images/uper.gif" runat="server" 
                                            onclick="ImageButton3_Click" /> 
                                        <asp:ImageButton ID="ImageButton4" ImageUrl="~/images/down.gif" runat="server" 
                                            onclick="ImageButton4_Click" /></td>
								  </tr>
								</table></td>
							  </tr>
							</table></td>
						  </tr>
						</table></td>
						<td valign="top"><table width="100%" border="0" cellspacing="20" cellpadding="0">
						  <tr>
							<td><h5>当前格式：</h5>
							
							<div class="greenbox">
							  <p><asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                                    </p>
							  </div>
						  
							
							<p>&nbsp;</p>
							<h5>自定义文本1</h5>
							<p>
                                <asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows="4" CssClass="txt1" runat="server"></asp:TextBox>
							</p>
							<p class="hui">已输入0字 还剩100字</p>
							<h5>自定义文本2</h5>
							<p>
                                <asp:TextBox ID="TextBox2" TextMode="MultiLine" Rows="4" CssClass="txt1" runat="server"></asp:TextBox>
							</p>
							<p class="hui">已输入0字 还剩100字</p>
							<p class="text">&nbsp;</p>
							<p>
                                <asp:ImageButton ID="ImageButton5" ImageUrl="~/images/yangben.gif" runat="server" /></p>
							<p>&nbsp;</p>
							
                                <asp:TextBox ID="TextBox3" TextMode="MultiLine" Rows="6"  CssClass="txt2" runat="server"></asp:TextBox></td>
						  </tr>
						</table></td>
					  </tr>
					</table>			
			</div>
			<div style="width:100%; clear:both; margin:20px; text-align:center;">
			  <p>&nbsp;</p>
			  <p>
                  <asp:ImageButton ID="ImageButton6" ImageUrl="~/images/qdgs.gif" runat="server" 
                      onclick="ImageButton6_Click" />	</p>
			</div>
			
			<div class="bod">
			<h4>范例</h4>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="725" valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="0" class="fl">
                  <tr>
                    <th>请选择：                    </th>
                    <td>美服魔兽IV  Ageywnn -A 盗贼  80级  亡灵 </td>
                  </tr>
                  <tr>
                    <th>信息标题：
                  
                    </th>
                    <td>美服魔兽 Agewynn –A 80级 亡灵 盗贼  纯手工打造，绝对超值  30字内</td>
                  </tr>
                  <tr>
                    <th>详细说明：
                    </th>
                    <td><textarea name="textarea4" cols="60" rows="4">采矿采药双满，大鸟，附带70猎人一个，一身紫装，采矿375，裁缝满</textarea></td>
                  </tr>
                  <tr>
                    <th>注册日期：
                    </th>
                    <td>2009-6-13 16：30</td>
                  </tr>
                  <tr>
                    <th>到期日期：
                   
                    </th>
                    <td>2009-6-13 16：30</td>
                  </tr>
                  <tr>
                    <th>最后登录：
                   
                    </th>
                    <td>2009-6-13 16：30</td>
                  </tr>
                  <tr>
                    <th>是否有密保资料：
                    
                    </th>
                    <td>有</td>
                  </tr>
                  <tr>
                    <th>是否有邮箱资料：
                    </th>
                    <td>有</td>
                  </tr>
                  <tr>
                    <th>是否有注册黄图：</th>
                    <td>有</td>
                  </tr>
                  <tr>
                    <th>起价：</th>
                    <td>200元</td>
                  </tr>
                  <tr>
                    <th>一口价：</th>
                    <td>200元</td>
                  </tr>
                </table></td>
                <td align="center" valign="top"><table width="165" border="0" align="center" cellpadding="0" cellspacing="0" class="tsel">
                  <tr>
                    <td valign="top" class="head2" style="height:30px;"><p class="b">已选 
                            <label></label>
                    </p></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top" class="body2"><ol>
                        <li>1	【No.编号】<br />
                      </li>
                        <li>2	固定标题<br />
                      </li>
                        <li>3	自填标题<br />
                      </li>
                        <li>4	账号详细说明<br />
                      </li>
                        <li>5	&lt;回车换行&gt;<br />
                      </li>
                        <li>6	注册日期<br />
                      </li>
                        <li>7	&lt;回车换行&gt;<br />
                      </li>
                        <li>8	到期日期<br />
                      </li>
                        <li>9	&lt;回车换行&gt;<br />
                      </li>
                        <li>10	最后登录<br />
                      </li>
                        <li>11	&lt;回车换行&gt;<br />
                      </li>
                        <li>12	是否有密保资料<br />
                      </li>
                        <li>13	是否有邮箱资料<br />
                      </li>
                        <li>14	是否有注册黄图<br />
                      </li>
                        <li>15	&lt;回车换行&gt;<br />
                      </li>
                        <li>16	当前价<br />
                      </li>
                        <li>17	一口价<br />
                      </li>
                        <li>18	&lt;回车换行&gt;<br />
                      </li>
                        <li>19	交易链接</li>
                    </ol></td>
                  </tr>
                  
                </table></td>
              </tr>
            </table>
			
			<p>&nbsp;</p>
			<h4>范例的内容样式：</h4>
			<div class="huibox">【No.1】美服魔兽 Agewynn –A 80级 亡灵 盗贼 纯手工打造，绝对超值 <br />
			  采矿采药双满，大鸟，附带70猎人一个，一身紫装，采矿375，裁缝满，<br />
			  注册日期：2009-2-13 16：30 <br />
			  到期时间：2009-6-13 16：30<br />
			  最后登录：2009-2-13 19：30<br />
			  有密保资料 无邮箱资料 无注册黄图<br />
			  起价：200.00元 一口价：1000.00元<br />
			  安全交易链接：<a href="#">http://www.uc1z.com/bid.aspx?id=2998</a></div>
			<p>&nbsp;</p>
			<p>
			  <input type="submit" name="Submit" value=" 复制 " />
			</p>
			<p>&nbsp;</p>
			</div>
			
			
  </div>