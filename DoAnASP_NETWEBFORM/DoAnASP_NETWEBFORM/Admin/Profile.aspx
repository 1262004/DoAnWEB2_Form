<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="page page-profile">
    <div class="row">
        <div class="col-md-6">
            <section class="panel panel-box">
                <div class="panel-top bg-primary">
                    <div class="text-center">
                        <h3>{{main.name}}</h3>
                        <p>Project Manager</p> 
                    </div>
                    <div class="divider divider-lg"></div>
                    <div class="divider divider-lg"></div>
                </div>
                <div class="panel-img bg-primary">
                    <img alt="" src="images/g1.jpg" class="img-circle">
                </div>
            </section>  
            <div class="panel panel-default">
                <div class="panel-heading"><strong><span class="glyphicon glyphicon-th"></span> Profile Info</strong></div>
                <div class="panel-body">
                    <div class="media">
                        <div class="media-body">
                            <ul class="list-unstyled list-info">
                                <li>
                                    <span class="icon glyphicon glyphicon-user"></span>
                                    <label>User name</label>
                                    {{main.name}}
                                </li>
                                <li>
                                    <span class="icon glyphicon glyphicon-envelope"></span>
                                    <label>Email</label>
                                    name@example.com
                                </li>
                                <li>
                                    <span class="icon glyphicon glyphicon-home"></span>
                                    <label>Address</label>
                                    Street 123, Avenue 45, Country
                                </li>
                                <li>
                                    <span class="icon glyphicon glyphicon-earphone"></span>
                                    <label>Contact</label>
                                    (+012) 345 6789
                                </li>
                                <li>
                                    <span class="icon glyphicon glyphicon-flag"></span>
                                    <label>Nationality</label>
                                    Australia
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>  
        </div>

        <div class="col-md-6">

            <div class="ui-timline-container ui-timline-left">
                <section class="ui-timeline">
                    <article class="tl-item">
                        <div class="tl-body">
                            <div class="tl-entry">
                                <div class="tl-caption">
                                    <a href="javascript:;" class="btn btn-primary btn-block">Today</a>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article class="tl-item">
                        <div class="tl-body">
                            <div class="tl-entry">
                                <div class="tl-time">1 hour ago</div>
                                <div class="tl-icon btn-icon btn-icon-round bg-warning"><i class="fa fa-shopping-cart"></i></div>
                                <div class="tl-content">
                                    <h4 class="tl-tile text-danger">Buy some toys</h4>
                                    <p>Ullam, commodi, modi, impedit nostrum odio sit odit necessitatibus accusantium enim voluptates culpa cupiditate cum pariatur a recusandae tenetur aspernatur at beatae.</p>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="tl-item">
                        <div class="tl-body">
                            <div class="tl-entry">
                                <div class="tl-time">3 hours ago</div>
                                <div class="tl-icon btn-icon btn-icon-round bg-success"><i class="fa fa-camera"></i></div>
                                <div class="tl-content">
                                    <h4 class="tl-tile text-warning">Soluta nihil</h4>
                                    <p>Incidunt, molestias odio soluta nihil accusantium sit nostrum doloremque. Recusandae, ullam, odio consequatur facere totam reiciendis similique dicta explicabo!</p>
                                </div>
                            </div>
                        </div>
                    </article>
       
                    <article class="tl-item">
                        <div class="tl-body">
                            <div class="tl-entry">
                                <div class="tl-caption">
                                    <a href="javascript:;" class="btn btn-danger btn-block">Yesterday</a>
                                </div>
                            </div>
                        </div>
                    </article>


                    <article class="tl-item">
                        <div class="tl-body">
                            <div class="tl-entry">
                                <div class="tl-time">8:30 PM</div>
                                <div class="tl-icon btn-icon btn-icon-round bg-warning"><i class="fa fa-asterisk"></i></div>
                                <div class="tl-content">
                                    <h4 class="tl-tile">Enim asperiores facere</h4>
                                    <p>Odit, iusto, dolorem, aut ipsum rem atque enim asperiores facere tempore explicabo omnis corporis hic! Molestias, dolores, iure esse at illo aliquam temporibus in eum cupiditate magni velit eveniet unde facilis quisquam numquam nihil atque tempore vitae porro maxime repellendus quas a sit repellat delectus expedita nam natus fugiat ut ipsam eaque voluptates omnis ratione?</p>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="tl-item">
                        <div class="tl-body">
                            <div class="tl-entry">
                                <div class="tl-time">7:00 PM</div>
                                <div class="tl-icon btn-icon btn-icon-round bg-success"><i class="fa fa-comment-o"></i></div>
                                <div class="tl-content">
                                    <h4 class="tl-tile text-warning">Illum veniam atque</h4>
                                    <p>Illum veniam atque iste voluptatem eos saepe quisquam aperiam voluptatum sunt.</p>
                                </div>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>

</div>
</asp:Content>
