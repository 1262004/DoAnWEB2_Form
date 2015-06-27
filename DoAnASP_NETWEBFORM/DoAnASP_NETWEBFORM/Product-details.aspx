<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product-details.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Product_details" %>

<%@ Register Src="~/Sidebar.ascx" TagPrefix="uc1" TagName="Sidebar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Product Detail</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">


    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <uc1:Sidebar runat="server" ID="Sidebar" />
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="product-details">
                        <!--product-details-->
                        <div class="col-sm-5">
                            <div class="view-product">
                                <img id="imgProduct" runat="server" src="" alt="" />
                                <h3>ZOOM</h3>
                            </div>
                            <%--<div id="similar-product" class="carousel slide" data-ride="carousel">

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <a href="">
                                            <img src="images/product-details/similar1.jpg" alt=""></a>
                                        <a href="">
                                            <img src="images/product-details/similar2.jpg" alt=""></a>
                                        <a href="">
                                            <img src="images/product-details/similar3.jpg" alt=""></a>
                                    </div>
                                    <div class="item">
                                        <a href="">
                                            <img src="images/product-details/similar1.jpg" alt=""></a>
                                        <a href="">
                                            <img src="images/product-details/similar2.jpg" alt=""></a>
                                        <a href="">
                                            <img src="images/product-details/similar3.jpg" alt=""></a>
                                    </div>
                                    <div class="item">
                                        <a href="">
                                            <img src="images/product-details/similar1.jpg" alt=""></a>
                                        <a href="">
                                            <img src="images/product-details/similar2.jpg" alt=""></a>
                                        <a href="">
                                            <img src="images/product-details/similar3.jpg" alt=""></a>
                                    </div>

                                </div>

                                <!-- Controls -->
                                <a class="left item-control" href="#similar-product" data-slide="prev">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                                <a class="right item-control" href="#similar-product" data-slide="next">
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>--%>
                        </div>
                        <div class="col-sm-7">
                            <div class="product-information">
                                <!--/product-information-->
                                <img runat="server" id="imgNew" src="" class="newarrival" alt="" />
                                <h2>
                                    <asp:Label ID="lblProductName" runat="server" /></h2>
                                <p>
                                    <img src="images/product-details/rating.png" alt="" />
                                </p>

                                <span>
                                    <p>
                                        <span>
                                            <asp:Label ID="lblPrice" runat="server" /></span>
                                    </p>
                                    <label>Số Lượng:</label>
                                    <input runat="server" id="txtQuantity" value="1" />
                                    <button runat="server" id="txtAddToCart" class="btn btn-fefault cart" onserverclick="txtAddToCart_ServerClick">
                                        <i class="fa fa-shopping-cart"></i>
                                        Đặt Mua
                                    </button>
                                </span>
                                <p>
                                    <b>Tình Trạng: </b>
                                    <asp:Label ID="lblNumInventory" runat="server" />
                                </p>
                                <p>
                                    <b>Hãng sản xuất: </b>
                                    <asp:Label ID="lblSup" runat="server" />
                                </p>
                                <a id="aFbShare" runat="server" href="" target="_blank" title="Share On Facebook">
                                    <img src="images/product-details/sharefb.png" >
                                </a>
                                <a id="aTwitterShare" runat="server" href="" title="Share on Twitter"
                                   target="_blank">
                                   <img src="images/product-details/sharetweet.png" >
                                </a>
                                <a id="aGPlusShare" runat="server" href="" 
                                   target="_blank" title="Share on Google+">
                                   <img src="images/product-details/gshare.png">
                                </a>
                            </div>
                            <!--/product-information-->
                        </div>
                    </div>
                    <!--/product-details-->

                    <div class="category-tab shop-details-tab">
                        <!--category-tab-->
                        <div class="col-sm-12">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#details" data-toggle="tab">Thông số</a></li>
                                <li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li>
                                <li><a href="#tag" data-toggle="tab">Bình luận</a></li>
                                <li><a href="#reviews" data-toggle="tab">Đánh giá</a></li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="details">
                                <h2>
                                    <asp:Label ID="lblHeader" runat="server" /></h2>
                                <br />
                                <%if (list != null)
                                  { %>
                                <table class="table table-condensed">
                                    <%for (int i = 0; i < list.Count; i++)
                                      {%>
                                    <tr>
                                        <td><%=list[i]%></td>
                                        <td><%=list[i+1]%></td>
                                    </tr>
                                    <% i += 1; %>
                                    <%}%>
                                </table>
                                <%} %>
                            </div>

                            <div class="tab-pane fade" id="companyprofile">
                                <div class="col-sm-3">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/gallery1.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/gallery3.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/gallery2.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/home/gallery4.jpg" alt="" />
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tag">
                                <div id="fb-root"></div>
                                <script>(function (d, s, id) {
                                    var js, fjs = d.getElementsByTagName(s)[0];
                                    if (d.getElementById(id)) return;
                                    js = d.createElement(s); js.id = id;
                                    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3&appId=475479205954552";
                                    fjs.parentNode.insertBefore(js, fjs);
                                }(document, 'script', 'facebook-jssdk'));</script>
                                <div class="fb-comments" data-href="http://developers.facebook.com/docs/plugins/comments/" data-numposts="2"></div>
                            </div>

                            <div class="tab-pane fade" id="reviews">
                                <div class="col-sm-12">
                                    <ul>
                                        <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                                        <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                                        <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
                                    </ul>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                    <p><b>Write Your Review</b></p>

                                    <form action="#">
                                        <span>
                                            <input type="text" placeholder="Your Name" />
                                            <input type="email" placeholder="Email Address" />
                                        </span>
                                        <textarea name=""></textarea>
                                        <b>Rating: </b>
                                        <img src="images/product-details/rating.png" alt="" />
                                        <button type="button" class="btn btn-default pull-right">
                                            Submit
                                        </button>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--/category-tab-->

                    <div class="recommended_items">
                        <!--recommended_items-->
                        <h2 class="title text-center">Các sản phẩm tương tự</h2>

                        <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <asp:ListView ID="lvProducts1" runat="server">
                                        <ItemTemplate>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="product text-center">
                                                            <a href="'Product-details.aspx?procID=<%# Eval("ProductID") %>'">
                                                                <img src='images/product/<%# Eval("LinkImage") %>' alt="" width="170" height="200" />
                                                                <h2><%# Eval("UnitPrice","{0:N0}") %>    <%# Eval("Unit") %></h2>
                                                                <p><%# Eval("ProductName") %></p>
                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Đặt Mua</a>
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
                                    </asp:ListView>
                                </div>
                                <div class="item">
                                    <asp:ListView ID="lvProducts2" runat="server">
                                        <ItemTemplate>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="product text-center">
                                                            <a href="'Product-details.aspx?procID=<%# Eval("ProductID") %>'">
                                                                <img src='images/product/<%# Eval("LinkImage") %>' alt="" width="170" height="200" />
                                                                <h2><%# Eval("UnitPrice","{0:N0}") %>    <%# Eval("Unit") %></h2>
                                                                <p><%# Eval("ProductName") %></p>
                                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Đặt Mua</a>
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
                                    </asp:ListView>
                                </div>
                            </div>
                            <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </div>
                    <!--/recommended_items-->

                </div>
            </div>
        </div>
    </section>


</asp:Content>
