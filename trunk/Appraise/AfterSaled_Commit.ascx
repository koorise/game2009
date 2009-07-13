<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AfterSaled_Commit.ascx.cs" Inherits="Appraise_AfterSaled_Commit" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
   <style>
    /* Rating */
.ratingStar {
    font-size: 0pt;
    width: 13px;
    height: 12px;
    margin: 0px;
    padding: 0px;
    cursor: pointer;
    display: block;
    background-repeat: no-repeat;
}

.filledRatingStar {
    background-image: url(Images/FilledStar.png);

}

.emptyRatingStar {
    background-image: url(Images/EmptyStar.png);
}

.savedRatingStar {
    background-image: url(Images/SavedStar.png);
}


    </style>
<div class="cont">
				<h1>
                    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
                    </asp:ScriptManagerProxy>
                    评价卖家</h1>
				<div class="notes">
					<img src="images/notes.gif" width="10" height="16" hspace="8" align="absmiddle" />
					<strong>打分须知：</strong>
					 <div class="ncont">请根据此次交易给予真实评价，您的评价将对其他的会员起到参考作用，也将影响卖家的信用度，请客观仔细地评价。 <br />
					  您的打分<br />
					出现卖家申诉，易站将会根据卖家提交的售后证据进行调解。恶意打低分的买家将遭到严厉处罚。
					</div>
				</div>
				<div class="info">
				<br />
					<table width="100%" border="0" cellspacing="0" cellpadding="5">
                      <tr>
                        <td width="80" height="24" align="right">被评价人：</td>
                        <td>
                            <asp:HyperLink ID="HyperLink2" runat="server">HyperLink</asp:HyperLink></td>
                      </tr>
                      <tr>
                        <td height="24" align="right">相关物品：</td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink></td>
                      </tr>
                      <tr>
                        <td height="24" align="right">售后承诺：</td>
                        <td>包到封号，期间一旦出现被密码找回的情况，可以找我无偿所要账号密码</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="1" class="pf">
                      <tr>
                        <th colspan="3">请针对他的售后承诺执行情况打分</th>
                      </tr>
                      <tr>
                        <td width="18%" height="30" align="right">售后承诺执行情况：<br /></td>
                        <td width="17%">
                        <!--
						<ul id="mark1" class="mark" linkfield="" defval="3" spmsg="spmark1">
							<li mark="1" lable="很差" msg="根本就不打算兑现承诺， 简直就 是赤裸裸的欺诈，还恶言相向">&nbsp;</li>
							<li mark="2" lable="稍差" msg="太差了。。。">&nbsp;</li>
							<li mark="3" lable="一般" msg="一般般啦。。。">&nbsp;</li>
							<li mark="4" lable="较好" msg="还算可以。。。">&nbsp;</li>
							<li mark="5" lable="很好" msg="very well。。。">&nbsp;</li>
						</ul>		
						-->				
						    <cc1:Rating ID="Rating1" runat="server"
						                StarCssClass="ratingStar"
                                        WaitingStarCssClass="savedRatingStar"
                                        FilledStarCssClass="filledRatingStar"
                                        EmptyStarCssClass="emptyRatingStar" onchanged="Rating1_Changed" 
                                CurrentRating="0">
                            </cc1:Rating>
						</td>
                        <td width="65%"><span id="spmark1"></span></td>
                      </tr>
                      <tr>
                        <td height="30" align="right">售后服务态度：</td>
                        <td>
                        <!--
                        <ul id="mark2" class="mark" linkfield="" defval="3" spmsg="spmark2">
							<li mark="1" lable="很差" msg="太差了。。。">&nbsp;</li>
							<li mark="2" lable="稍差" msg="太差了。。。">&nbsp;</li>
							<li mark="3" lable="一般" msg="一般般啦。。。">&nbsp;</li>
							<li mark="4" lable="较好" msg="还算可以。。。">&nbsp;</li>
							<li mark="5" lable="很好" msg="very well。。。">&nbsp;</li>
						</ul>
						-->
						 <cc1:Rating ID="Rating2" runat="server"
						                StarCssClass="ratingStar"
                                        WaitingStarCssClass="savedRatingStar"
                                        FilledStarCssClass="filledRatingStar"
                                        EmptyStarCssClass="emptyRatingStar" onchanged="Rating2_Changed">
                            </cc1:Rating>
						</td>
                        <td><span id="spmark2"></span></td>
                      </tr>
                      <tr>
                        <td height="30">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="3"><table width="625" border="0" align="left" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="40" height="30">&nbsp;</td>
                            <td>详情描述<span class="hui">（如果售后执行不力，请在此写明原因方便易站客服协助调节解决）</span></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:TextBox ID="TextBox1" Columns="60" Rows="6" TextMode="MultiLine" runat="server"></asp:TextBox></td>
                          </tr>
                          <tr>
                            <td height="30">&nbsp;</td>
                            <td class="hui">已输入<span class="red">0</span>字，还可以输入<span class="red">500</span>字</td>
                          </tr>
                          <tr>
                            <td height="30" colspan="2" align="center">
                                <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/btn_qddf.gif" 
                                    runat="server" onclick="ImageButton1_Click" /></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table>
					<p>&nbsp;</p>
			  </div>
    </div>
    <div id="tip">
				<dl>
					<dt id="tipdt">5分 非常满意</dt>
					<dd id="tipdd">根本就不打算兑现承诺，简直就<br />
				    是赤裸裸的欺诈，还恶言相向</dd>
				</dl>
	</div>