<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="DoAnASP_NETWEBFORM.Sidebar" %>
<div class="left-sidebar">
    <h2>Category</h2>
    <div class="demo-container clear">
        <div class="test">
            <asp:ListView ID="ListViewParent" runat="server" DataKeyNames="CategoryID" OnItemDataBound="ListViewParent_ItemDataBound">
                <LayoutTemplate>
                    <ul id="mega-2" class="mega-menu">
                        <li runat="server" id="itemPlaceholder"></li>
                    </ul>
                </LayoutTemplate>
                <ItemTemplate>
                    <li>
                        <a href="#"><span class="iconhome" style='background: url(css/images/<%# Eval("Image") %>) no-repeat 50% 50%;'></span><%# Eval("CategoryName") %></a>
                        <ul>
                            <asp:ListView ID="ListView1" runat="server" DataKeyNames="CategoryID">
                                <ItemTemplate>
                                    <li><span class="iconhome" style='background: url(css/images/<%# Eval("Image") %>) no-repeat 50% 50%;'></span><a href='Shop.aspx?cate=<%# Eval("CategoryID") %>'><%# Eval("CategoryName") %></a></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
                    </li>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>

    <div style="clear: both;" class="panel-group category-products" id="accordian">
        <!--suppler-productsr-->
        <asp:ListView ID="ListViewSup" runat="server">
            <ItemTemplate>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title"><a href='Shop.aspx?ship=<%# Eval("SupplierID") %>'><%# Eval("CompanyName") %></a></h4>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <!--/category-products-->

    <div class="shipping text-center">
        <!--shipping-->
        <img src="images/home/shipping.jpg" alt="" />
    </div>
    <!--/shipping-->

</div>
