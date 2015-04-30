<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script type="text/javascript">
        function CheckName(e, args) {
            if (args.Value.length >= 6)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        function CheckPassword(e, args) {
            if (args.Value.length >= 6)
                args.IsValid = true;
            else
                args.IsValid = false;
        }
    </script>
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
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 95%;">
                                        <asp:TextBox class="form-control" placeholder="Địa chỉ email" ID="txtEmailLog" runat="server" Width="100%" Height="30px" /></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvEmailLog" runat="server" ErrorMessage="Chưa nhập địa chỉ email" ControlToValidate="txtEmailLog" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupLogin">*</asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" placeholder="Mật khẩu" ID="txtPasswordLog" runat="server" TextMode="Password" Width="100%" Height="30px" /></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td><span>
                                        <asp:CheckBox ID="cbKeep" runat="server" />
                                        Duy trì đăng nhập
                                    </span></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button class="btn btn-default" ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" ValidationGroup="groupLogin" /></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMessLog" runat="server" ForeColor="Red"/>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        
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
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 95%;">
                                        <asp:TextBox class="form-control" ID="txtNameSu" runat="server" placeholder="Họ tên" Width="100%" Height="30px" />

                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvNamSu" runat="server" ErrorMessage="Chưa nhập tên" ControlToValidate="txtNameSu" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cvNameSu" runat="server" ControlToValidate="txtNameSu" ErrorMessage="Tên tài khoản ít nhất 6 kí tự" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup" ClientValidationFunction="CheckName">*</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" ID="txtEmailSu" placeholder="Email" runat="server" TextMode="Email" Width="100%" Height="30px" /></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvEmailSu" runat="server" ErrorMessage="Chưa nhập email" ControlToValidate="txtEmailSu" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cvEmailSu" runat="server" ControlToValidate="txtNameSu" ErrorMessage="Email đã tồn tại" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup" OnServerValidate="cvEmailSu_ServerValidate">*</asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" ID="txtPasswordSu" placeholder="Mật khẩu" runat="server" TextMode="Password" Width="100%" Height="30px" /></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvPasswordSu" runat="server" ErrorMessage="Chưa nhập mật khẩu" ControlToValidate="txtPasswordSu" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cusVPasswordSu" runat="server" ErrorMessage="Password phải có ít nhất 6 ký tự" ControlToValidate="txtPasswordSu" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup" ClientValidationFunction="CheckPassword">*</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" ID="txtConfimPasSu" placeholder="Nhập lại mật khẩu" runat="server" TextMode="Password" Width="100%" Height="30px" /></td>
                                    <td>
                                        <asp:CompareValidator ID="comV" runat="server" ErrorMessage="Mật khẩu không khớp" ControlToCompare="txtPasswordSu" ControlToValidate="txtConfimPasSu" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup">*</asp:CompareValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" ID="txtBirthDay" placeholder="Ngày sinh (dd/MM/yyyy)" runat="server" TextMode="Date" Width="100%" Height="30px" /></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvBirthday" runat="server" ErrorMessage="Chưa nhập ngày sinh" ControlToValidate="txtBirthday" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cvBirthday" runat="server" ErrorMessage="Ngày sinh không đúng định dạng (dd/MM/yyyy)" ControlToValidate="txtBirthday" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup" OnServerValidate="cvBirthday_ServerValidate">*</asp:CustomValidator></td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList class="form-control" ID="cbbSex" runat="server" Style="margin-bottom: 10px;" Height="30px">
                                            <asp:ListItem Value="0" Selected="True" Text="Giới tính..." />
                                            <asp:ListItem Value="1" Text="Nam" />
                                            <asp:ListItem Value="2" Text="Nữ" />
                                        </asp:DropDownList></td>
                                    <td>
                                        <asp:CustomValidator ID="cusvCbbSex" runat="server" ErrorMessage="Chưa chọn giới tính" ControlToValidate="cbbSex" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup" OnServerValidate="cvCbbSex_ServerValidate">*</asp:CustomValidator></td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" ID="txtDiaChi" placeholder="Địa chỉ" runat="server" Width="100%" Height="30px" />
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="g-recaptcha" data-sitekey="6Lfw0AUTAAAAAKg5vyG7AJFTgDy7YqjyP1hTzLzt" style="margin-bottom: 10px;"></div>
                                    </td>
                                    <td>
                                        <asp:CustomValidator ID="cvCaptcha" runat="server" ErrorMessage="Catpcha không đúng" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupSignup" OnServerValidate="cvCaptcha_ServerValidate">*</asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button class="btn btn-default" ID="btnSignup" runat="server" Text="Đăng ký" ValidationGroup="groupSignup" OnClick="btnSignup_Click" /></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" ValidationGroup="groupSignup" HeaderText="--Danh sách lỗi--" />
                                    </td>
                                    <td>&nbsp</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!--/sign up form-->
                </div>
            </div>
        </div>
    </section>
    <!--/form-->
</asp:Content>
