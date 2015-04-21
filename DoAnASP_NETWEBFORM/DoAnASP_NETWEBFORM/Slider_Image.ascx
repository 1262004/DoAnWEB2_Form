<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slider_Image.ascx.cs" Inherits="DoAnASP_NETWEBFORM.Slider_Image" %>
<section id="slider">
    <!--slider-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <asp:ListView ID="lvSider" runat="server">
                    <LayoutTemplate>
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#slider-carousel" data-slide-to="1"></li>
                                <li data-target="#slider-carousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div runat="server" id="itemPlaceholder"></div>
                            </div>
                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="item" runat="server" id="divSlider">
                            <div class="col-sm-6">
                                <h1><span>E</span>-SHOPPER</h1>
                                <h2><%# Eval("Title") %></h2>
                                <p>Hiện tại Ecomerce đang có đợt giảm giá mạnh các mặt hàng Iphone , Ipad , Tablet , Laptop ................. </p>
                                <button type="button" class="btn btn-default get">Get it now</button>
                            </div>
                            <div class="col-sm-6">
                                <img src='images/home/<%# Eval("LinkImage") %>' class="girl img-responsive" alt="" />
                                <img src="images/home/pricing.png" class="pricing" alt="" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</section>
<!--/slider-->
