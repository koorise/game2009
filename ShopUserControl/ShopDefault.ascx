<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShopDefault.ascx.cs" Inherits="ShopUserControl_ShopDefault" %>
<%@ Register src="ProductShopBegin.ascx" tagname="ProductShopBegin" tagprefix="uc1" %>

<asp:Menu ID="Menu1" runat="server" StaticMenuItemStyle-CssClass="TabHeadStatic" StaticSelectedStyle-CssClass="TabHeadActive" Orientation="Horizontal" ItemWrap="false">
        <Items>
            <asp:MenuItem Text="帐号销售店铺" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="收货站" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="出货站" Value="2"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <uc1:ProductShopBegin ID="ProductShopBegin1" runat="server" />
        </asp:View>
        <asp:View ID="View2" runat="server">
        </asp:View>
        <asp:View ID="View3" runat="server">
        </asp:View>
    </asp:MultiView>