﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Reg.ascx.cs" Inherits="WebUserControl_Reg" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<div class="main">
			<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
            </asp:ScriptManagerProxy>
			<!--start left part-->
			<div class="mleft">
				<dl class="reg_step">
					<dt><img src="images/reg_step_top.gif" /></dt>
					<dd>
						<div class="regstep1">
							<img src="images/reg_step_ico1.gif" width="40" height="57" hspace="20" vspace="20" align="left" />
							<p>第一步：<br />填写注册信息
							</p>
						</div>
						<div class="regstep2">
							<img src="images/reg_step_ico2.gif" width="59" height="45" hspace="10" vspace="30" align="left" />
							<p>第二步：<br />完成</p>
					    </div>
					</dd>
				</dl>
			</div>
			<!--end left part-->
			
			
			<!--right part start-->
			<div class="mright">
				<h3>填写注册信息<span>( 以下均为必填项 )</span></h3>
				  <table width="100%" border="0" cellpadding="0" cellspacing="1" class="frmtable">
				  	<thead>
                      <tr>
                        <td colspan="2"><img src="images/org_dot.gif" width="5" height="13" hspace="10" align="absmiddle" />基本信息：</td>
                      </tr>
				    </thead>
					 <tbody>
                      <tr>
                        <th> 会员名：<br /><br /><br /><br /><br /></th>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="10">
                          <tr>
                            <td width="200" valign="top"><p>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                       <asp:TextBox ID="tbUserName" CssClass="input" Width="150px" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="tbUserName" Display="None" ErrorMessage="必填项" 
                                            ValidationGroup="RR"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" 
                                            TargetControlID="RequiredFieldValidator1">
                                        </cc1:ValidatorCalloutExtender>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            ErrorMessage="格式错误" ControlToValidate="tbUserName" ValidationGroup="RR" 
                                            ValidationExpression="^[\u4E00-\u9FA0a-z0-9]+$" Display="None"></asp:RegularExpressionValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4"  ValidationGroup="RR" Display="None" ValidationExpression=".{5,20}" ControlToValidate="tbUserName" runat="server" ErrorMessage="长度5-20个字符">
                                            </asp:RegularExpressionValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" TargetControlID="RegularExpressionValidator3">
                                        </cc1:ValidatorCalloutExtender>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender12" runat="server" TargetControlID="RegularExpressionValidator4">
                                        </cc1:ValidatorCalloutExtender>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="imgBTNChkUserName" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:ImageButton ID="imgBTNChkUserName" runat="server" height="23" hspace="10" 
                                            ImageUrl="~/images/btn_checkusername.gif" onclick="imgBTNChkUserName_Click" 
                                            vspace="10" width="130" />
                                </p>
                            </td>
                            <td>5-20个字符(包括小写字母、数字、下划线、中文)，一个<br />
                              汉字为两个字符，推荐使用中文会员名。一旦注册成功会<br />
                              员名不能修改。<br />
                              请勿申请带有敏感词语的用户名，或恶意模仿其他用户的<br />
                            用户名，被举报后账号将被永久封停。</td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <th>密码：<br /><br /><br /></th>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="10">
                          <tr>
                            <td width="200" valign="top">
                             <asp:TextBox ID="tbPassWD1" TextMode="Password" Width="150px" CssClass="input" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="必填项" ControlToValidate="tbPassWD1" ValidationGroup="RR" Display="None"></asp:RequiredFieldValidator>
                            </td>
                            <td>密码由6-16个字符组成，请使用英文字母加数字或符号的<br />
                              组合密码，不能单独使用英文字母、数字或符号作为您的<br />
                            密码。</td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <th>确认密码：</th>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="10">
                          <tr>
                            <td width="200" valign="top"><p>
                                <asp:TextBox ID="tbPassWD2" TextMode="Password" Width="150px" CssClass="input" runat="server"></asp:TextBox><asp:CompareValidator
                                    ID="CompareValidator1" runat="server" ErrorMessage="两次输入密码不一致。" ControlToValidate="tbPassWD2" ControlToCompare="tbPassWD1" ValidationGroup="RR" Display="None"></asp:CompareValidator>
                            </p></td>
                            <td>请再输入一遍您上面输入的密码。</td>
                          </tr>
                        </table></td>
                      </tr>
				    </tbody>
                    </table>
				  <table width="100%" border="0" cellpadding="0" cellspacing="1" class="frmtable">
                    <thead>
                      <tr>
                        <td colspan="2"><img src="images/org_dot.gif" width="5" height="13" hspace="10" align="absmiddle" />安全信息：以下信息非常重要，请认真填写并且牢记</td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th>密码保护问题：</th>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
                          <tr>
                            <td width="200" valign="top"><p>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:GameDB %>" 
                                    SelectCommand="SELECT [qID], [Question] FROM [sysQuestion]">
                                </asp:SqlDataSource>
                                <asp:DropDownList ID="ddlQuestion"  CssClass="input" Width="150px" 
                                    runat="server" DataSourceID="SqlDataSource1" DataTextField="Question" 
                                    DataValueField="qID">
                                </asp:DropDownList>
                            </p></td>
                            <td>请选择密码提示问题，用于修改个人信息</td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <th>密码保护答案：</th>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
                          <tr>
                            <td width="200" valign="top"><p>
                                <asp:TextBox ID="tbAnswer1" Width="150px" CssClass="input" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="必填项" 
                                    Display="None" ControlToValidate="tbAnswer1" ValidationGroup="RR"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbAnswer1" Display="None"  ValidationGroup="RR" ValidationExpression="^.{2,200}$" ErrorMessage="至少两个汉字"></asp:RegularExpressionValidator>
                            </p></td>
                            <td>至少2个汉字</td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <th>确认密保答案：<br /></th>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr>
                              <td width="200" valign="top"><p>
                                  <asp:TextBox ID="tbAnswer2" Width="150px" CssClass="input" runat="server"></asp:TextBox>
                                  <asp:CompareValidator
                                      ID="CompareValidator2" runat="server" ErrorMessage="两次输入答案不一致。" Display="None" ControlToValidate="tbAnswer2" ControlToCompare="tbAnswer1"></asp:CompareValidator>
                              </p></td>
                              <td>请重复问题答案，务必牢记</td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <th>电子邮件：<br /></th>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
                          <tr>
                            <td width="200" valign="top"><p style="width:150px;">
                                <asp:TextBox ID="tbEmail1" Width="150px" CssClass="input" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator4" runat="server" ValidationGroup="RR" Display="None" ControlToValidate="tbEmail1" ErrorMessage="必填项"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="tbEmail1"  ValidationGroup="RR" Display="None" 
                                    ErrorMessage="E-mail格式错误。" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </p></td>
                            <td>非常重要，用于找回密码，请准确填写</td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <th>确认电子邮件：<br /></th>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
                          <tr>
                            <td width="200" valign="top"><p>
                                <asp:TextBox ID="tbEmail2" Width="150px" CssClass="input" runat="server"></asp:TextBox><asp:CompareValidator
                                    ID="CompareValidator3" runat="server" ErrorMessage="两次输入E-mail不一致。" Display="None" ControlToValidate="tbEmail2" ControlToCompare="tbEmail1" ValidationGroup="RR"></asp:CompareValidator>
                            </p></td>
                            <td>请确认您的邮箱地址</td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <th>验证码：</th>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
                          <tr>
                            <td width="200" valign="top"><p>
                                <asp:TextBox ID="tbCode" Width="50px" CssClass="input_short" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbCode" ErrorMessage="必填项" Display="None" ValidationGroup="RR"></asp:RequiredFieldValidator>
                                <asp:Image ID="Image1" ImageAlign="AbsMiddle" height="22"  width="66" ImageUrl="~/CheckCode.aspx" runat="server" /> <asp:LinkButton ID="lBTNCode" runat="server" 
                            onclick="lBTNCode_Click">换张图片</asp:LinkButton></p></td>
                            <td>请输入验证码</td>
                          </tr>
                        </table></td>
                      </tr>
                    </tbody>
                  </table>
				  <div class="proto">
				    <p>一、总则</p>
				    <p>1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击&quot;同意&quot;按钮即表示用户与百度公司达成协议，完全接受本协议项下的全部条款。<br />
				      1．2　用户注册成功后，百度将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。<br />
				      1．3　用户可以使用百度各个频道单项服务，当用户使用百度各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及百度在该单项服务中发出的各类公告的同意。<br />
				      1．4　百度会员服务协议以及各个频道单项服务条款和公告可由百度公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。<br />
				      　　
				      您在使用百度提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消百度提供的服务；您一旦使用百度服务，即视为您已了解并完全同意本服务协议各项内容，包括百度对服务协议随时所做的任何修改，并成为百度用户。</p>
				    <p>二、注册信息和隐私保护</p>
				    <p>2．1　百度帐号（即百度用户ID）的所有权归百度，用户完成注册申请手续后，获得百度帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，百度不负任何责任。<br />
				      2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知百度。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，百度不承担任何责任。<br />
				      2．3　百度不对外公开或向第三方提供单个用户的注册资料，除非：<br />
				      （1）事先获得用户的明确授权；<br />
				      （2）只有透露你的个人资料，才能提供你所要求的产品和服务；<br />
				      （3）根据有关的法律法规要求；<br />
				      （4）按照相关政府主管部门的要求；<br />
				      （5）为维护百度的合法权益。<br />
				      2．4　在你注册百度帐户，使用其他百度产品或服务，访问百度网页, 或参加促销和有奖游戏时，百度会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。</p>
				    <p>三、使用规则</p>
				    <p>3．1　用户在使用百度服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶<br />
				      （1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：<br />
				      1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的； <br />
				      （2）不得为任何非法目的而使用网络服务系统；<br />
				      （3）不利用百度服务从事以下活动：<br />
				      1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；<br />
				      2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；<br />
				      3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；<br />
				      4) 故意制作、传播计算机病毒等破坏性程序的；<br />
				      5) 其他危害计算机信息网络安全的行为。<br />
				      3．2　用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿百度与合作公司、关联公司，并使之免受损害。对此，百度有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收百度帐号、追究法律责任等措施。对恶意注册百度帐号或利用百度帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，百度有权回收其帐号。同时，百度公司会视司法部门的要求，协助调查。<br />
				      3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。<br />
				      3．4　用户须对自己在使用百度服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在百度公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予百度公司等额的赔偿。 </p>
				    <p>四、服务内容</p>
				    <p>4．1　百度网络服务的具体内容由百度根据实际情况提供。<br />
				      4．2　除非本服务协议另有其它明示规定，百度所推出的新产品、新功能、新服务，均受到本服务协议之规范。<br />
				      4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。<br />
				      4．4　鉴于网络服务的特殊性，用户同意百度有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。百度不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。<br />
				      4．5　百度需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，百度无需为此承担任何责任。百度保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。<br />
				      4．6　本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于百度无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，百度不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，百度亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、商品或服务所产生的任何损害或损失，百度不承担任何责任。<br />
				      4．7　用户明确同意其使用百度网络服务所存在的风险将完全由其自己承担。用户理解并接受下载或通过百度服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。百度对在服务网上得到的任何商品购物服务、交易进程、招聘信息，都不作担保。<br />
				      4．8　6个月未登陆的帐号，百度保留关闭的权利。<br />
				      4．9　百度有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，百度对用户和任何第三人均无需承担任何责任。<br />
				      4．10　终止服务<br />
				      您同意百度得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或百度认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并同意，百度可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您的帐号及相关信息和文件被关闭或删除，百度对您或任何第三人均不承担任何责任。</p>
				    <p>五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）</p>
				    <p>5．1　用户专属权利<br />
				      百度尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向百度提供资料∶<br />
				      　 
				      请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，百度建议该个人或单位首先咨询专业人士。 <br />
				      　 
				      为了百度有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）： <br />
				      　　 
				      1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；<br />
				      　　 
				      2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。<br />
				      　　 
				      3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。<br />
				      　　 
				      4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。<br />
				      　　 
				      5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。<br />
				      　　 
				      6. 请在权利通知中加入如下关于通知内容真实性的声明： “我保证，本通知中所述信息是充分、真实、准确的，如果本权利通知内容不完全属实，本人将承担由此产生的一切法律责任。”<br />
				      　　 
				      7. 请您签署该文件，如果您是依法成立的机构或组织，请您加盖公章。 <br />
				      　 
				      请您把以上资料和联络方式书面发往以下地址：　　<br />
				      中国北京市海淀北四环西路66号 第三极办公楼8层<br />
				      　　 
				      百度公司 投诉组<br />
				      　　 
				      邮政编码：100080<br />
				      5．2　对于用户通过百度服务（包括但不限于贴吧、知道、MP3、影视等）上传到百度网站上可公开获取区域的任何内容，用户同意百度在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知的或以后开发的其他任何形式的作品、媒体或技术中。<br />
				      5．3　百度拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：<br />
				      所有的资料和图象均以获得信息为目的；<br />
				      　　 
				      所有的资料和图象均不得用于商业目的；<br />
				      　　 
				      所有的资料、图象及其任何部分都必须包括此版权声明；<br />
				      　　 
				      本网站（www.baidu.com）所有的产品、技术与所有程序均属于百度知识产权，在此并未授权。<br />
				      　　 
				      “Baidu”, “百度”及相关图形等为百度的注册商标。<br />
				      　　 
				      未经百度许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，百度将依法追究法律责任。</p>
				    <p>六、青少年用户特别提示</p>
				    <p>青少年用户必须遵守全国青少年网络文明公约：<br />
				      要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。</p>
				    <p>七、其他</p>
				    <p>7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。<br />
				      7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向百度所在地的人民法院提起诉讼。<br />
				      7．3　百度未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。<br />
				      7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。<br />
			        </p>
				    <p>　　请您在发现任何违反本服务协议以及其他任何单项服务的服务条款、百度各类公告之情形时，通知百度。您可以通过如下联络方式同百度联系∶<br />
				      中国北京市海淀北四环西路66号 第三极办公楼8层<br />
				      　　 
				      百度公司 投诉组<br />
				      　　 
				      邮政编码：100080</p>
				    <p></p>
				  </div>
				  <div class="accept"> 
                      <asp:Button ID="btnConfirm" ValidationGroup="RR" runat="server" 
                          Text="已阅读并同意游戏易站服务协议" onclick="btnConfirm_Click" />
                      <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                      <cc1:PasswordStrength ID="PasswordStrength1" runat="server" 
                            DisplayPosition="BelowLeft" 
                            MinimumNumericCharacters="1" MinimumSymbolCharacters="1" 
                            PreferredPasswordLength="16" PrefixText="检测提示:密码安全性 " 
                            RequiresUpperAndLowerCaseCharacters="True" TargetControlID="tbPassWD1" 
                            TextStrengthDescriptions="很差;脆弱;中等;强壮;优秀"
                            TextStrengthDescriptionStyles="TextIndicator_TextBox1_Strength1;TextIndicator_TextBox1_Strength2;TextIndicator_TextBox1_Strength3;TextIndicator_TextBox1_Strength4;TextIndicator_TextBox1_Strength5"
                            StrengthIndicatorType="Text"
                            HelpStatusLabelID="TextBox2_HelpLabel"
                            BarIndicatorCssClass="BarIndicator_TextBox2"
                            BarBorderCssClass="BarBorder_TextBox2">
                      </cc1:PasswordStrength>
                </div>
			
			</div>
			<!--right part end-->
			
		</div>
<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" 
    TargetControlID="RequiredFieldValidator2">
</cc1:ValidatorCalloutExtender>
<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" 
    TargetControlID="RequiredFieldValidator3">
</cc1:ValidatorCalloutExtender>
<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" 
    TargetControlID="RequiredFieldValidator4">
</cc1:ValidatorCalloutExtender>
<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" 
    TargetControlID="CompareValidator1">
</cc1:ValidatorCalloutExtender>
<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" 
    TargetControlID="CompareValidator2">
</cc1:ValidatorCalloutExtender>
<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" 
    TargetControlID="CompareValidator3">
</cc1:ValidatorCalloutExtender>
<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" 
    TargetControlID="RegularExpressionValidator1">
</cc1:ValidatorCalloutExtender>
<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" 
    TargetControlID="RegularExpressionValidator2">
</cc1:ValidatorCalloutExtender>
