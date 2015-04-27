<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">        
    <title>Login</title>
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <link href="css/custom.css" type="text/css" rel="stylesheet" />
    <script src="js/custom.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <section id="form">
        <!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form">
                        <!--login form-->
                        <h2 class="border-box">Đăng nhập</h2>

                        <div>
                            <input type="email" placeholder="Email Address" id="txtEmailLog" runat="server"/>
                            <input type="password" placeholder="Password" id="txtPasswordLog" runat="server"/>
                            <span>
                                <input type="checkbox" class="checkbox" id="cbKeep" runat="server" />
                                Keep me signed in
                            </span>
                            <button type="submit" class="btn btn-default" onserverclick="btnLogin_Click" runat="server">Login</button>
                        </div>
                        <label id="lblMessLog" runat="server" />
                    </div>
                    <!--/login form-->
                </div>
                <div class="col-sm-1">
                    <h2 class="or">OR</h2>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2 class="border-box">Đăng ký tài khoản mới!</h2>
                        <div>
                            <input type="text" id="txtNameSu" placeholder="Họ tên" runat="server"/>
                            <input type="email" id="txtEmailSu" placeholder="Email" runat="server"/>
                            <input type="password" id="txtPasswordSu" placeholder="Mật khẩu" runat="server"/>
                            <input type="password" id="txtConfimPasSu" placeholder="Nhập lại mật khẩu" runat="server"/>
                            <input type="datetime-local" id="dtBirthDay" placeholder="Ngày sinh" runat="server"/>
                            
                            <div class="combobox">
                                <input type="text" placeholder="Giới tính"/>
                                <ul runat="server" id="content_sex">
                                    <li>Nam</li>
                                    <li>Nữ</li>                                    
                                </ul>
                            </div>     
                            <textarea rows="2" cols="57" id="taDiaChi" placeholder="Địa chỉ" runat="server" style="margin-bottom: 10px;"/>                              
                            <div class="g-recaptcha" data-sitekey="6Lfw0AUTAAAAAKg5vyG7AJFTgDy7YqjyP1hTzLzt"></div>
                            <button type="submit" class="btn btn-default" runat="server" onserverclick="btnSignup_Click">Signup</button>
                            <label id="lblMessSu" runat="server" />
                        </div>
                    </div>
                    <!--/sign up form-->
                </div>
            </div>
        </div>
    </section>
    <!--/form-->
</asp:Content>
