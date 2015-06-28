<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Default" %>
<%@ Register Src="~/Sidebar.ascx" TagPrefix="uc1" TagName="Sidebar" %>
<%@ Register Src="~/Slider_Image.ascx" TagPrefix="uc1" TagName="Slider_Image" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <uc1:Slider_Image runat="server" ID="Slider_Image" />
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
                                            <div class="product text-center">
                                                <a href='Product-details.aspx?procID=<%# Eval("ProductID") %>'>
                                                    <img src='images/product/<%# Eval("LinkImage") %>' alt="" width="170" height="200" />
                                                    <h2><%# Eval("UnitPrice","{0:N0}") %>    <%# Eval("Unit") %></h2>
                                                    <p><%# Eval("ProductName") %></p>
                                                    <a href='Product-details.aspx?procID=<%# Eval("ProductID")%>' class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Đặt Mua</a>
                                                </a>
                                            </div>
                                            <div class="product-overlay">
                                                <div class="overlay-content">
                                                    <h2><%# Eval("UnitPrice", "{0:N0}")%> <%# Eval("Unit") %></h2>
                                                    <p><%# Eval("ProductName") %></p>
                                                    <a href='Product-details.aspx?procID=<%# Eval("ProductID")%>' class="btn btn default add-to-cart"><i class="fa fa-shopping-cart"></i>Đặt Mua</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="choose">
                                            <ul class="nav nav-pills nav-justified">
                                                <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                Không có sản phẩm nào
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <div style="clear: both; text-align: center;">
                            <asp:DataPager ID="dp" runat="server" PagedControlID="lvProducts" PageSize="12">
                                <Fields>
                                    <asp:NumericPagerField CurrentPageLabelCssClass="active" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                        <!--features_items-->
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
