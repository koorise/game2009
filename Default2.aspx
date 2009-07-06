<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <asp:Label ID="Label1"  runat="server" Text='<%# Eval("Provincename") %>'></asp:Label><br>
        </ItemTemplate>
        <FooterTemplate>
         
        </FooterTemplate>
        </asp:Repeater> 
           <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

    </div>
    </form>
</body>
</html>
