<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cart</title>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="/Default.aspx">Home</a></li>
                    <li class="active">Shopping Cart</li>
                </ol>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="table-responsive cart_info">
                        <asp:ListView ID="lvItemsCart" runat="server" OnItemDataBound="lvItemsCart_ItemDataBound" OnItemCommand="lvItemsCart_ItemCommand">
                            <LayoutTemplate>
                                <table class="table table-condensed">
                                    <thead>
                                        <tr class="cart_menu">
                                            <td class="image">Sản Phẩm</td>
                                            <td class="description"></td>
                                            <td class="price">Giá</td>
                                            <td class="quantity">Số Lượng</td>
                                            <td class="total">Tổng Cộng</td>
                                            <td></td>
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
                                        <asp:ImageButton ID="imgPro" runat="server"></asp:ImageButton>
                                    </td>
                                    <td class="cart_description">
                                        <h4>
                                            <asp:Label ID="lblProName" runat="server"></asp:Label></h4>
                                    </td>
                                    <td class="cart_price">
                                        <p>
                                            <asp:Label ID="lblPrice" runat="server"></asp:Label>
                                        </p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <asp:LinkButton ID="lnkUp" runat="server" class="cart_quantity_up" CommandName="up" CommandArgument='<%# Eval("ProID") %>'>+ </asp:LinkButton>
                                            <input class="cart_quantity_input" type="text" name="quantity" value='<%# Eval("Quantity") %>' autocomplete="off" size="2" />
                                            <asp:LinkButton ID="lnkDown" runat="server" class="cart_quantity_down" CommandName="down" CommandArgument='<%# Eval("ProID") %>'>- </asp:LinkButton>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">
                                            <asp:Label ID="lblAmount" runat="server"></asp:Label>
                                        </p>
                                    </td>
                                    <td class="cart_delete">
                                        <asp:LinkButton ID="lnkDelete" runat="server" class="cart_quantity_delete" CommandName="deleteItem" CommandArgument='<%# Eval("ProID") %>'><i class="fa fa-times"></i></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <h4>Không có sản phẩm nào trong giỏ hàng!</h4>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section>
    <!--/#cart_items-->

    <section id="do_action">
        <div class="container">
            <div class="heading">
                <h3>Lựa chọn hình thức thành toán</h3>
                <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="chose_area">
                        <ul class="user_option">
                            <li>
                                <input type="checkbox" />
                                <label>Use Coupon Code</label>
                            </li>
                            <li>
                                <input type="checkbox" />
                                <label>Use Gift Voucher</label>
                            </li>
                            <li>
                                <input type="checkbox" />
                                <label>Estimate Shipping & Taxes</label>
                            </li>
                        </ul>
                        <ul class="user_info">
                            <li class="single_field">
                                <label>Country:</label>
                                <select>
                                    <option>United States</option>
                                    <option>Bangladesh</option>
                                    <option>UK</option>
                                    <option>India</option>
                                    <option>Pakistan</option>
                                    <option>Ucrane</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select>

                            </li>
                            <li class="single_field">
                                <label>Region / State:</label>
                                <select>
                                    <option>Select</option>
                                    <option>Dhaka</option>
                                    <option>London</option>
                                    <option>Dillih</option>
                                    <option>Lahore</option>
                                    <option>Alaska</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select>

                            </li>
                            <li class="single_field zip-field">
                                <label>Zip Code:</label>
                                <input type="text" />
                            </li>
                        </ul>
                        <a class="btn btn-default update" href="">Get Quotes</a>
                        <a class="btn btn-default check_out" href="">Continue</a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="total_area">
                        <ul>
                            <li>Cart Sub Total <span>$59</span></li>
                            <li>Eco Tax <span>$2</span></li>
                            <li>Shipping Cost <span>Free</span></li>
                            <li>Total <span>
                                <asp:Label ID="lblTotal" runat="server"></asp:Label></span></li>
                        </ul>
                        <a class="btn btn-default update" href="">Update</a>
                        <a class="btn btn-default check_out" href="">Check Out</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#do_action-->

</asp:Content>
