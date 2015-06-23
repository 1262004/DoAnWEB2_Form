<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Admin</title>
    <meta name="description" content="Responsive Admin Web App">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic" rel="stylesheet" type="text/css">
    <!-- Needs images, font... therefore can not be part of main.css -->
    <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="bower_components/weather-icons/css/weather-icons.min.css">
    <!-- end Needs images -->

    <link rel="stylesheet" href="styles/main.css" />
</head>
<body data-ng-app="app" id="app" class="app" data-custom-page="" data-off-canvas-nav="" data-ng-controller="AppCtrl" data-ng-class=" {'layout-boxed': admin.layout === 'boxed' } ">
    <form id="form1" runat="server">
        <div>
            <div class="page-signin">
                <div class="signin-header">
                    <section class="logo text-center">
                        <a href="#/">{{main.brand}}</a>
                    </section>
                </div>

                <div class="signin-body">
                    <div class="container">
                        <div class="form-container">

                            <form class="form-horizontal">
                                <fieldset>
                                    <div class="form-group">
                                        <div class="btn-icon-lined btn-icon-round btn-icon-sm btn-default-light">
                                            <span class="glyphicon glyphicon-envelope"></span>
                                        </div>
                                        <input type="email"
                                            class="form-control input-lg input-round text-center"
                                            placeholder="Username">
                                    </div>
                                    <div class="form-group">
                                        <div class="btn-icon-lined btn-icon-round btn-icon-sm btn-default-light">
                                            <span class="glyphicon glyphicon-lock"></span>
                                        </div>
                                        <input type="password"
                                            class="form-control input-lg input-round text-center"
                                            placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <a href="#/" class="btn btn-primary btn-lg btn-round btn-block text-center">Log in</a>
                                    </div>
                                </fieldset>
                            </form>

                            <section>
                                <p class="text-center"><a href="#/pages/forgot-password">Forgot your password?</a></p>
                                <p class="text-center text-muted text-small">Don't have an account yet? <a href="#/pages/signup">Sign up</a></p>
                            </section>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
    <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script src="scripts/vendor.js"></script>
    <script src="scripts/ui.js"></script>
    <script src="scripts/app.js"></script>
</body>
</html>
