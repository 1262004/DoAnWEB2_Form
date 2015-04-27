<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Shop" %>

<%@ Register Src="~/Sidebar.ascx" TagPrefix="uc1" TagName="Sidebar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Shop</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <section id="advertisement">
        <div class="container">
            <img src="images/shop/advertisement.jpg" alt="" />
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <uc1:Sidebar runat="server" ID="Sidebar" />
                </div>


                <div class="col-sm-9 padding-right">
                    <div class="features_items">
                        <!--features_items-->
                        <h2 class="title text-center">Features Items</h2>

                        <asp:ListView ID="lvProducts" runat="server" OnPagePropertiesChanging="lvProducts_PagePropertiesChanging">
                            <ItemTemplate>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href='Product-details.aspx?procID=<%# Eval("ProductID") %>'>
                                                    <img src='images/product/<%# Eval("LinkImage") %>' alt="" width="170" height="200" /></a>
                                                <h2><%# Eval("UnitPrice","{0:N0}") %>    <%# Eval("Unit") %></h2>
                                                <p><%# Eval("ProductName") %></p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                            <div class="product-overlay">
                                                <div class="overlay-content">
                                                    <h2><%# Eval("UnitPrice","{0:N0}") %>    <%# Eval("Unit") %></h2>
                                                    <p><%# Eval("ProductName") %></p>
                                                    <a href='Product-details.aspx?procID=<%# Eval("ProductID") %>' class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="choose">
                                            <ul class="nav nav-pills nav-justified">
                                                <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                Không có sản phẩm nào
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <div style="clear: both; text-align: center">
                            <asp:DataPager ID="dp" runat="server" PagedControlID="lvProducts" PageSize="12">
                                <Fields>
                                    <asp:NumericPagerField CurrentPageLabelCssClass="active" />
                                </Fields>
                            </asp:DataPager>
                        </div>

                        <ul class="pagination">
                            <li class="active"><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">&raquo;</a></li>
                        </ul>
                    </div>
                    <!--features_items-->
                </div>
            </div>
        </div>
    </section>
</asp:Content>
