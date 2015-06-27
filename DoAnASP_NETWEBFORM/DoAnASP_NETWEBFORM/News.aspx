<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="DoAnASP_NETWEBFORM.News" %>

<%@ Register Src="~/Sidebar.ascx" TagPrefix="uc1" TagName="Sidebar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        div.single-blog-post img {
            height: 200px !important;
            width: 350px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <uc1:Sidebar runat="server" ID="Sidebar" />
                </div>
                <div class="col-sm-9">
                    <div class="blog-post-area">
                        <h2 class="title text-center">Latest From our Blog</h2>

                        <asp:ListView ID="gvRss" runat="server">
                            <ItemTemplate>
                                <div class="single-blog-post" style="margin-bottom: 40px;">
                                    <h3><%#Eval("Title") %></h3>
                                    <div class="post-meta">
                                        <ul>
                                            <li><i class="fa fa-user"></i>Mac Doe</li>
                                            <li><i class="fa fa-clock-o"></i><%#Eval("PublishDate") %></li>
                                            <li><i class="fa fa-calendar"></i><%#Eval("PublishDate") %></li>
                                        </ul>
                                        <span>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </span>
                                    </div>
                                    <%#Eval("Description") %>
                                    <a class="btn btn-primary" href='<%#Eval("Link") %>'>Read More</a>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <div class="pagination-area">
                            <ul class="pagination">
                                <li><a href="" class="active">1</a></li>
                                <li><a href="">2</a></li>
                                <li><a href="">3</a></li>
                                <li><a href=""><i class="fa fa-angle-double-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
