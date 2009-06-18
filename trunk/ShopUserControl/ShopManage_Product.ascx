<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShopManage_Product.ascx.cs" Inherits="ShopUserControl_ShopManage_Product" %>
<%@ Register src="ManageMain_Product.ascx" tagname="ManageMain_Product" tagprefix="uc1" %>
<%@ Register src="BasicInfo_Product.ascx" tagname="BasicInfo_Product" tagprefix="uc1" %>
<%@ Register src="NoticeManage_Product.ascx" tagname="NoticeManage_Product" tagprefix="uc1" %>
<%@ Register src="FriendLink_Product.ascx" tagname="FriendLink_Product" tagprefix="uc1" %>
<%@ Register src="TypeManage_Product.ascx" tagname="TypeManage_Product" tagprefix="uc1" %>
<%@ Register src="AdjustInShop_Product.ascx" tagname="AdjustInShop_Product" tagprefix="uc1" %>
<%@ Register src="SetHot_Product.ascx" tagname="SetHot_Product" tagprefix="uc1" %>
<%@ Register src="PayForShop_Product.ascx" tagname="PayForShop_Product" tagprefix="uc1" %>
<%@ Register src="HistoryRecord_Product.ascx" tagname="HistoryRecord_Product" tagprefix="uc1" %>

<asp:Menu ID="Menu1" runat="server" StaticMenuItemStyle-CssClass="TabHeadStatic" StaticSelectedStyle-CssClass="TabHeadActive" Orientation="Horizontal" ItemWrap="false">
        <Items>
            <asp:MenuItem Text="首页" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="基本设置" Value="1">
                <asp:MenuItem Text="基本设置" Value="1"></asp:MenuItem>
                <asp:MenuItem Text="公告管理" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="友情链接管理" Value="3"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="帐号管理" Value="4">
                <asp:MenuItem Text="分类管理" Value="4"></asp:MenuItem>
                <asp:MenuItem Text="帐号归类" Value="5"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="营销推广" Value="6">
                <asp:MenuItem Text="店内推荐" Value="6"></asp:MenuItem>
                <asp:MenuItem Text="促销热卖设置" Value="7"></asp:MenuItem>
                <asp:MenuItem Text="热卖商品设置" Value="8"></asp:MenuItem>
                <asp:MenuItem Text="店铺付费推广" Value="9"></asp:MenuItem>
                <asp:MenuItem Text="商品付费推广" Value="10"></asp:MenuItem>
                <asp:MenuItem Text="高级统计工具" Value="11"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem Text="店铺续费" Value="12"></asp:MenuItem>
            <asp:MenuItem Text="历史记录" Value="13"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <uc1:ManageMain_Product ID="ManageMain_Product1" runat="server" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <uc1:BasicInfo_Product ID="BasicInfo_Product1" runat="server" />
        </asp:View>
        <asp:View ID="View3" runat="server">
            <uc1:NoticeManage_Product ID="NoticeManage_Product1" runat="server" />
        </asp:View>
        <asp:View ID="View4" runat="server">
            <uc1:FriendLink_Product ID="FriendLink_Product1" runat="server" />
        </asp:View>
        <asp:View ID="View5" runat="server">
            <uc1:TypeManage_Product ID="TypeManage_Product1" runat="server" />
        </asp:View>
        <asp:View ID="View6" runat="server">
            <uc1:AdjustInShop_Product ID="AdjustInShop_Product1" runat="server" />
        </asp:View>
        <asp:View ID="View7" runat="server">
            <uc1:SetHot_Product ID="SetHot_Product1" runat="server" />
        </asp:View>
        <asp:View ID="View8" runat="server">
            <uc1:PayForShop_Product ID="PayForShop_Product1" runat="server" />
        </asp:View>
        <asp:View ID="View9" runat="server">
            <uc1:HistoryRecord_Product ID="HistoryRecord_Product1" runat="server" />
        </asp:View>
    </asp:MultiView>