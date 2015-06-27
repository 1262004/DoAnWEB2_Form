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
                    <div class="panel-heading"><strong><span id="editpro" class="glyphicon glyphicon-pencil" style="cursor: pointer;"></span>Profile Info</strong></div>
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-body">
                                <ul class="list-unstyled list-info">
                                    <li>
                                        <span class="icon glyphicon glyphicon-user"></span>
                                        <label>User name</label>
                                        <asp:Label ID="lbUsername" runat="server" Text="{{main.name}}"></asp:Label>
                                    </li>
                                    <li>
                                        <span class="icon glyphicon glyphicon-user"></span>
                                        <label>Full Name</label>
                                        <asp:Label ID="lbFullName" runat="server" Text=""></asp:Label>
                                    </li>
                                    <li>
                                        <span class="icon glyphicon glyphicon-envelope"></span>
                                        <label>Sex</label>
                                        <asp:Label ID="lbSex" runat="server" Text=""></asp:Label>
                                    </li>
                                    <li>
                                        <span class="icon glyphicon glyphicon-home"></span>
                                        <label>Address</label>
                                        <asp:Label ID="lbAddress" runat="server" Text=""></asp:Label>
                                    </li>
                                    <li>
                                        <span class="icon glyphicon glyphicon-earphone"></span>
                                        <label>Contact</label>
                                        <asp:Label ID="lbPhone" runat="server" Text=""></asp:Label>
                                    </li>
                                    <li>
                                        <span class="icon glyphicon glyphicon-flag"></span>
                                        <label>BirthDay</label>
                                        <asp:Label ID="lbBirthDay" runat="server" Text=""></asp:Label>
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
<asp:Content runat="server" ID="FOOTER" ContentPlaceHolderID="footer">

    <form runat="server">
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Confirmation</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="<%=txtUsername.ClientID%>" class="control-label col-xs-2">Username</label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="<%=txtPassword.ClientID%>" class="control-label col-xs-2">Password</label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="<%=txtFullName.ClientID%>" class="control-label col-xs-2">Full Name</label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="<%=cbxSex.ClientID%>" class="control-label col-xs-2">Sex</label>
                            <div class="col-xs-10">
                                <asp:DropDownList ID="cbxSex" runat="server" CssClass="selectpicker"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="<%=txtAddress.ClientID%>" class="control-label col-xs-2">Address</label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="<%=txtPhone.ClientID%>" class="control-label col-xs-2">Phone</label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="<%=txtBirthDay.ClientID%>" class="control-label col-xs-2">Birth Day</label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtBirthDay" runat="server" CssClass="form-control datepicker" ></asp:TextBox>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                     <asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="btn-danger"><span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span>   Save changes</asp:LinkButton>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>   Close</button>
                </div>
            </div>
        </div>
    </div>
        </form>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"/>
    <link href="styles/bootstrap/bootstrap/datepicker.css" rel="stylesheet" />
    <link href="styles/bootstrap/bootstrap/bootstrap-select.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="scripts/bootstrap-datepicker.js"></script>
    <script src="scripts/bootstrap-select.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.datepicker').datepicker()
            $('.selectpicker').selectpicker();
            $("#editpro").click(function () {
                $("#myModal").modal('show');
            });


        });
    </script>
</asp:Content>
