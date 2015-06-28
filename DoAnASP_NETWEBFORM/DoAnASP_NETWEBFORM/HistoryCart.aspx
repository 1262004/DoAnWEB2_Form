<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HistoryCart.aspx.cs" Inherits="DoAnASP_NETWEBFORM.HistoryCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="/Default.aspx">Home</a></li>
                    <li class="active">Lịch Sử Giỏ Hàng</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
                <asp:ListView ID="lvIHistorytemsCart" runat="server">
                    <LayoutTemplate>
                        <table class="table table-condensed">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="image">Sản Phẩm</td>
                                    <td class="description"></td>
                                    <td>Ngày Mua</td>
                                    <td class="price">Giá</td>
                                    <td class="quantity">Số Lượng</td>
                                    <td class="total">Tổng Cộng</td>
                                    <td>Hình Thức Thanh Toán</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr runat="server" id="itemPlaceholder">
                                </tr>

                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="cart_product">
                                <img src='images/product/<%# Eval("LinkImage") %>' alt="" />
                            </td>
                            <td class="cart_description">
                                <h4>
                                    <%#Eval("ProductName") %></h4>
                            </td>
                            <td>
                                <%# string.Format("{0:dd/MM/yyyy}", Eval("DateBuy")) %></h4>
                            </td>
                            <td class="cart_price">
                                <p>
                                    <%# Eval("UnitPrice","{0:N0}") %>    <%# Eval("Unit") %>
                                </p>
                            </td>
                            <td class="cart_quantity">
                                <%#Eval("Quantity") %></h4>
                            </td>
                            <td class="cart_total">
                                <p class="cart_total_price">
                                    <%# Eval("TotalMoney","{0:N0}") %>    <%# Eval("Unit") %>
                                </p>
                            </td>
                            <td>
                                <%#Eval("Payments") %>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <h4>Bạn chưa mua sản phẩm nào của cửa hàng!</h4>
                    </EmptyDataTemplate>
                </asp:ListView>                
            </div>
            <asp:Button ID="btnBack" runat="server" Text="Quay Về" class="btn btn default get" OnClientClick="JavaScript:window.history.go(-1);return false;" />
        </div>
    </section>
</asp:Content>
