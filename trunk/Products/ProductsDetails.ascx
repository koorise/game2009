<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductsDetails.ascx.cs" Inherits="Products_ProductsDetails" %>
<div class="main">
		<div id="userinfo">
			<div id="us_title">
                <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
                </asp:ScriptManagerProxy>
                会员信誉档案</div>
			<div id="us_info">
				<div id="us_id">
                    <asp:HyperLink ID="hyLinkUserName" runat="server"></asp:HyperLink></div>
				<div id="us_tab">
					<ul>
						<li><a href="#" class="cur" id="tab1" onclick="changtab(1,3,'tab','info')">全部</a></li>
						<li><a href="#" id="tab2" onclick="changtab(2,3,'tab','info')">帐号</a></li>
						<li><a href="#" id="tab3" onclick="changtab(3,3,'tab','info')">金币</a></li>
					</ul>
					<div id="info1" style="display:block">
						<dl>
							<dd>卖家信用：<span class="num"><asp:Literal ID="litisSalerScores" runat="server"></asp:Literal></span> <img src="images/icon2.gif" width="18" height="16" align="absmiddle" /><img src="images/icon2.gif" width="18" height="16" align="absmiddle" /><img src="images/icon2.gif" width="18" height="16" align="absmiddle" /></dd>
							<dd>买家信用：<span class="num"><asp:Literal ID="litisBuyerScores" runat="server"></asp:Literal></span> <img src="images/icon2.gif" width="18" height="16" align="absmiddle" /><img src="images/icon2.gif" width="18" height="16" align="absmiddle" /><img src="images/icon2.gif" width="18" height="16" align="absmiddle" /></dd>
							<dd>卖家好评率： 
                                <asp:Literal ID="litisSalerPer" runat="server"></asp:Literal></dd>
							<dt>买家好评率：<asp:Literal ID="litisBuyerPer" runat="server"></asp:Literal></dt>
							<dd>注册时间： 
                                <asp:Literal ID="litInTime" runat="server"></asp:Literal></dd>
						</dl>
				  </div>
					<div id="info2">222</div>
					<div id="info3">333</div>
					
				</div>
				<div class="but_enter" ><asp:HyperLink ID="hyLinkEnter" NavigateUrl="#" ImageUrl="~/images/enter.png" runat="server"></asp:HyperLink></div>
			</div>
		</div>
		<div id="container">
			<div id="pro_info">
			  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                <tr>
                  <td colspan="3"><div id="pro_name">
                      <asp:Literal ID="litProductTitle" runat="server"></asp:Literal>
                      <asp:Literal ID="LitError" runat="server"></asp:Literal>
                      </div></td>
                </tr>
               
				<tr class="pad" >
                  <td width="34%" >商品编号：<asp:Literal ID="litPNKID" runat="server"></asp:Literal></td>
                  <td colspan="2" ><a href="#">复制商品编号</a>  <a href="#">收藏</a></td>
                </tr>
                <tr>
                  <td>游戏区服：<asp:Literal ID="litGameName" runat="server"></asp:Literal></td>
                  <td width="19%">&nbsp;</td>
                  <td width="47%">物品类型：帐号</td>
                </tr>
                <tr>
                  <td>当前价格：<span class="red"><b><asp:Literal ID="litPriceNow1" runat="server"></asp:Literal></b></span>元</td>
                  <td>&nbsp;</td>
                  <td>交易方式：<asp:Literal ID="litSaleMethod" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td>一口价：<span class="red"><b><asp:Literal ID="litPriceTop" runat="server"></asp:Literal></b></span>元</td>
                  <td>&nbsp;</td>
                  <td>交易属性：<asp:Literal ID="litSaleType" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td>商品状态：<span class="red"><b><asp:Literal ID="litStatus" runat="server"></asp:Literal></b></span></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                      <ContentTemplate>
                      剩余时间：<asp:Literal ID="litTimeLeft" runat="server"></asp:Literal>
                      <asp:Literal ID="litTimeLeft2" Visible=false runat="server"></asp:Literal>
                      <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">
                      </asp:Timer>
                      </ContentTemplate>
                          <Triggers>
                              <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                          </Triggers>
                      </asp:UpdatePanel>
                      
                      </td>
                  <td>&nbsp;</td>
                  <td>该账号在易站交易次数：<span class="red"><b>未验证</b></span></td>
                </tr>
                <tr>
                  <td>发布时间：<asp:Literal ID="litProductInTime" runat="server"></asp:Literal></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>商品件数：<asp:Literal ID="litAccountNums1" runat="server"></asp:Literal>件 </td>
                  <td>&nbsp;</td>
                  <td>浏览次数：<asp:Literal ID="litViewCount" runat="server"></asp:Literal> 次 </td>
                </tr>
              </table>
			</div>
			<div id="pro_desc">
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><ul class="tab_title"><li><a href="#">帐号详细描述</a></li></ul></td>
                </tr>
                <tr >
                  <td class="pad pad2">
                      <asp:Literal ID="litProductDetails" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td>
                  <asp:Panel ID="pannelAccount" Visible=false runat="server">
				  <div id="reginfo">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                    <tr>
                      <td>密保资料：<span class="red"><asp:Literal ID="litAccountPassPort" runat="server"></asp:Literal></span></td>
                      <td>注册时间：<asp:Literal ID="litAccountTimeReg" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td>注册邮箱：<span class="red"><asp:Literal ID="litAccountMail" runat="server"></asp:Literal></span> </td>
                      <td>到期时间：<asp:Literal ID="litAccountTimeEnd" runat="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td>注册黄图：<asp:Literal ID="litAccountYellowPage" runat="server"></asp:Literal> </td>
                      <td>最后登录：<asp:Literal ID="litAccountTimeLastLogin" runat="server"></asp:Literal></td>
                    </tr>
                  </table></div></asp:Panel></td>
                </tr>
              </table>
			</div>
			
			
			<div id="pro_serv">
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><ul class="tab_title"><li><a href="#">售后服务承诺</a></li></ul></td>
                </tr>
                <tr >
                  <td class="pad pad2">
                      <asp:Literal ID="litProductsPromise" runat="server"></asp:Literal></td>
                </tr>
              </table>
			</div>
			
			<div id="pro_buy">
				<ul>
				<li><a href="#" class="cur" id="buy1" onclick="changtab(1,2,'buy','buyinfo');return false">参与竞价</a></li>
				<li><a href="#" id="buy2" onclick="changtab(2,2,'buy','buyinfo');return false">一口价购买</a></li>			
				</ul>
				<div id="buyinfo1" style="display:block">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="26%">当前价格：<span class="red"><b><asp:Literal ID="litPriceNow2" 
                              runat="server"></asp:Literal></b></span>元          </td>
                      <td width="19%">物品件数：<span class="red"><b><asp:Literal ID="litAccountNums2" runat="server"></asp:Literal></b></span>件</td>
                      <td width="55%">最低加价幅度： <span class="red"><b>
                          <asp:Literal ID="litPriceStep" runat="server"></asp:Literal></b></span>元/次</td>
                    </tr>
                    <tr>
                      <td colspan="3">购买件数：<span class="red"><b><asp:TextBox ID="tbAccountNums" 
                              Enabled="false" runat="server" CssClass="text" Width="50px"></asp:TextBox></b></span>件</td>
                    </tr>
                    <tr>
                      <td colspan="3">我的出价：<label><asp:TextBox ID="tbMyPrice" CssClass="text" 
                              runat="server" Width="100px"></asp:TextBox>
                        </label>            
                      元       
                          <asp:CompareValidator ID="CompareValidator1" runat="server" 
                              ControlToValidate="tbMyPrice" Display="Dynamic" ErrorMessage="*" 
                              Operator="GreaterThan" Type="Double" ValidationGroup="A"></asp:CompareValidator>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                              ControlToValidate="tbMyPrice" Display="Dynamic" ErrorMessage="*" 
                              ValidationGroup="A"></asp:RequiredFieldValidator>
                          不低于 <span class="red">
                          <asp:Literal ID="litPriceNow4" runat="server"></asp:Literal></span>元 
                          <asp:Literal ID="litPriceNow22" runat="server" Visible="False"></asp:Literal>
                          <asp:Literal ID="litPriceTop11" runat="server" Visible="False"></asp:Literal>
                                </td>
                    </tr>
                    <tr>
                      <td colspan="3"><div class="buy_box">如果您输入的金额高于<asp:Literal ID="litPriceNow3" 
                              runat="server"></asp:Literal>元，则系统会启动<a href="">代理出价</a>功能。<br />
一旦有人出价，系统会帮您逐渐增加出价金额，直到您输入的金额为止</div></td>
                    </tr>
                    <tr>
                      <td colspan="3">拍卖保证金：<span class="red"><b>10.00</b></span>元</td>
                    </tr>
                    <tr>
                      <td colspan="3"><div class="buy_box">为营造良好的交易环境，保障交易成功率，买家出价将被锁定<span class="red">10</span>元押金，交易正常结束后全部退还，如果成交不买，<br />
                      保证金将被自动罚没，不予退还。<a href="#">详情点此</a></div></td>
                    </tr>
                    <tr>
                      <td colspan="3">校验码： 
                        <label>
                            <asp:TextBox ID="tbCode1" Width="50px" MaxLength="4" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                              ControlToValidate="tbCode1" ErrorMessage="*" ValidationGroup="A"></asp:RequiredFieldValidator>
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Image ID="Image2" ImageUrl="~/checkcode.aspx?sname=tbcode1" runat="server" />
                      </label></td>
                    </tr>
                    <tr>
                      <td colspan="3"><div class="but_center"><asp:ImageButton ID="imgBTNSubMit" 
                              ImageUrl="~/images/button1.png" runat="server" ValidationGroup="A" 
                              onclick="imgBTNSubMit_Click" /></div></td>
                    </tr>
                  </table>
				</div>
				<div id="buyinfo2" >
                    <asp:Panel ID="PanelZhongJie" runat="server">
				      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td>此交易为中介交易，必须使用交易密码以一口价拍下 请输入交易密码</td>
                        </tr>
                        <tr>
                          <td>交易密码：
                            <label>
                                <asp:TextBox ID="tbFastKey" runat="server" TextMode="Password"></asp:TextBox>
                          </label>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                  ControlToValidate="tbFastKey" Display="Dynamic" ErrorMessage="*" 
                                  ValidationGroup="B"></asp:RequiredFieldValidator>
                                    </td>
                        </tr>
                        </table>
                      </asp:Panel>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>购买件数：<span class="red"><b><asp:Literal ID="litAccountNums3" runat="server"></asp:Literal>件</b></span></td>
                    </tr>
                    <tr>
                      <td>一口价：<span class="red"><b><asp:Literal ID="litPriceTop2" runat="server"></asp:Literal></b></span>元</td>
                    </tr>
                    <tr>
                      <td>校验码：
                        <label>
                            <asp:TextBox ID="tbCode2" MaxLength="4" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                              ControlToValidate="tbCode2" Display="Dynamic" ErrorMessage="*" 
                              ValidationGroup="B"></asp:RequiredFieldValidator>
                          &nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" ImageUrl="~/CheckCode.aspx?sName=tbcode2" runat="server" />
                        </label></td>
                    </tr>
                    <tr>
                      <td><div class="but_center">
                          <asp:ImageButton ID="imgBTNPriceTopSubmit" ImageUrl="~/images/button3.png" 
                              runat="server" ValidationGroup="B" onclick="imgBTNPriceTopSubmit_Click" /></div></td>
                    </tr>
                  </table>
				</div>
			</div>
			
			
			
			<div id="pro_ly">
				<ul>
				<li><a href="#" class="cur" id="ly1" onclick="changtab(1,2,'ly','lyinfo');return false">拍卖进程</a></li>
				<li><a href="#" id="ly2" onclick="changtab(2,2,'ly','lyinfo');return false">留言簿</a></li>			
				</ul>
				<div id="lyinfo1" style="display:block">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:GameDB %>" 
                        SelectCommand="SELECT [UserName], [PriceNow], [inTime] FROM [vwOrderInfoList] WHERE ([PNKID] = @PNKID) ORDER BY [PriceNow] DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="PNKID" QueryStringField="PNKID" 
                                Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
				    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="5" 
                        Width="100%" onrowdatabound="GridView1_RowDataBound">
                        <RowStyle HorizontalAlign="Center" />
                        <Columns>
                            <asp:TemplateField HeaderText="状态">
                                <ItemTemplate>
                                    <asp:Literal ID="Literal6" Text='<%# Container.DataItemIndex==0?"<span class=green><b>领先</b></span>":"<span class=red><b>出局</b></span>" %>' runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserName" HeaderText="出价人" 
                                SortExpression="UserName" />
                            <asp:BoundField DataField="PriceNow" DataFormatString="{0:c}" HeaderText="价格" 
                                SortExpression="PriceNow">
                                <ItemStyle ForeColor="#CC3300" />
                            </asp:BoundField>
                            <asp:BoundField DataField="inTime" HeaderText="出价时间" SortExpression="inTime" />
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" />
                        <HeaderStyle BorderColor="#E8E8E8" />
                    </asp:GridView>
				</div>
				<div id="lyinfo2" >
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <th>
                      <asp:Panel ID="panelLogin" runat="server">
                      <div id="login">
                           <div class="fl">
                          <img src="images/icon.gif" align="absmiddle"    /> 您需要先<asp:HyperLink ID="HyperLink1" NavigateUrl="" runat="server">登录</asp:HyperLink>，才能向掌柜提问.<asp:HyperLink
                              ID="HyperLink2" runat="server">30秒立即注册</asp:HyperLink></div>
                      </div></asp:Panel></th>
                    </tr>
                    <tr>
                      <td  class="pad">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" id="lybg">
                        <tr class="pad">
                          <td width="14%" valign="top" align="right">给卖家留言：&nbsp; </td>
                          <td width="86%"><label>
                              <asp:TextBox ID="tbMessage" Columns="50" Rows="7" CssClass="text" 
                                  MaxLength="300" runat="server" TextMode="MultiLine"></asp:TextBox>
                              </label>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                  ControlToValidate="tbMessage" Display="Dynamic" ErrorMessage="*" 
                                  ValidationGroup="C"></asp:RequiredFieldValidator>
                                            </td>
                        </tr>
                        <tr >
                          <td align="right">校验码：&nbsp; 
                        </td>
                          <td><label>
                              <asp:TextBox ID="tbCode3" MaxLength="4" runat="server" Width="50px"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                  ControlToValidate="tbCode3" ErrorMessage="*" ValidationGroup="C"></asp:RequiredFieldValidator>
                              <asp:Image ID="Image3" ImageUrl="~/CheckCode.aspx?sName=tbcode3" 
                                  runat="server" />
                      </label></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><asp:ImageButton ID="imgBTNMessageSubMit" ImageUrl="~/images/button2.png" 
                                  Width="73" Height="25" runat="server" ValidationGroup="C" /></td>
                        </tr>
                      </table>
                      </td>
                    </tr>
                    <tr>
                      <td>
					  <div id="lylist">
                          <asp:Repeater ID="Repeater2" runat="server">
                          <HeaderTemplate><dl></HeaderTemplate>
                                  <ItemTemplate>
                                      <dd>
								        <table width="100%" border="0" cellspacing="0" cellpadding="0">
									          <tr>
										        <td width="76%">
                                                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("MSG") %>'></asp:Literal>(<asp:Literal ID="Literal2"
                                                        runat="server" Text='<%# Eval("UserName") %>'></asp:Literal>)</td>
										        <td width="24%">(<asp:Literal ID="Literal3" runat="server" 
                                                        Text='<%# Eval("inTime") %>'></asp:Literal>)</td>
									          </tr>
									          <tr>
										        <td class="reword">
                                                    <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("reMsg") %>'></asp:Literal> </td>
										        <td>(<asp:Literal ID="Literal5" runat="server" Text='<%# Eval("reTime") %>'></asp:Literal>)</td>
									          </tr>
									        </table>
							          </dd>
                                  </ItemTemplate>
                                  <AlternatingItemTemplate>
                                  	<dd class="row2">
                                  	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
									          <tr>
										        <td width="76%">
                                                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("MSG") %>'></asp:Literal>(<asp:Literal ID="Literal2"
                                                        runat="server" Text='<%# Eval("UserName") %>'></asp:Literal>)</td>
										        <td width="24%">(<asp:Literal ID="Literal3" runat="server" 
                                                        Text='<%# Eval("inTime") %>'></asp:Literal>)</td>
									          </tr>
									          <tr>
										        <td class="reword">
                                                    <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("reMsg") %>'></asp:Literal> </td>
										        <td>(<asp:Literal ID="Literal5" runat="server" Text='<%# Eval("reTime") %>'></asp:Literal>)</td>
									          </tr>
									        </table>
					      		      </dd>
                                  </AlternatingItemTemplate>
                                  <FooterTemplate></dl></FooterTemplate>
                          </asp:Repeater>                                  

							
                <table border="0" align="right" cellpadding="0" cellspacing="3">
						  <tr>
						  <td valign="middle">
						  <a href="#"><img src="images/btn_prevpatge.gif" width="19" height="19" border="0" align="absmiddle" /></a>	
						  </td>
						  <td class="pages">
                              <asp:Literal ID="litPageNum" runat="server"></asp:Literal>
						 </td><td>
						  <a href="#"><img src="images/btn_nextpage.gif" width="55" height="19" border="0" align="absmiddle" /></a> 
						  </td>
						  </tr>
						  </table>
						</td>
                      </tr>
 
					  
					  </div></td>
                    </tr>
                  </table>
				</div>
			</div>
			
		</div>