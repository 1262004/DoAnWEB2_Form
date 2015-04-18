<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2 class="border-box">Login to your account</h2>
						<div>
							<input type="text" placeholder="Name" />
							<input type="email" placeholder="Email Address" />
							<span>
								<input type="checkbox" class="checkbox"> 
								Keep me signed in
							</span>
							<button type="submit" class="btn btn-default">Login</button>
						</div>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2 class="border-box">New User Signup!</h2>
						<div>
							<input type="text" placeholder="Name"/>
							<input type="email" placeholder="Email Address"/>
							<input type="password" placeholder="Password"/>
							<button type="submit" class="btn btn-default">Signup</button>
						</div>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
</asp:Content>
