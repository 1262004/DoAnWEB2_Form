<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Thông tin cá nhân</title>
    <link href="css/sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    <script src="css/sweetalert/sweetalert.min.js" type="text/javascript"></script>
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
                        <!--Profile Login form-->
                        <h2 class="border-box">Thông Tin Đăng Nhập</h2>

                        <div>
                            <table style="width: 100%;">
                                <tr style="width: 95%;">
                                    <td>
                                        <asp:TextBox class="form-control" placeholder="Mật khẩu cũ" ID="txtPassOld" runat="server" TextMode="Password" Width="100%" Height="30px" /></td>
                                    <td><asp:CustomValidator ID="cvPassOld" runat="server" ErrorMessage="Mật khẩu không chính xác" ControlToValidate="txtPassOld" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupProLogin" OnServerValidate="cvPassOld_ServerValidate">*</asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" placeholder="Mật khẩu mới" ID="txtPassNew" runat="server" TextMode="Password" Width="100%" Height="30px" /></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvPassNew" runat="server" ErrorMessage="Chưa nhập mật khẩu mới" ControlToValidate="txtPassNew" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupProLogin">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cvPassNew" runat="server" ErrorMessage="Mật khẩu mới phải có ít nhất 6 ký tự" ControlToValidate="txtPassNew" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupProLogin" ClientValidationFunction="CheckPassword">*</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" placeholder="Nhập lại mật khẩu mới" ID="txtConfirmPassNew" runat="server" TextMode="Password" Width="100%" Height="30px" /></td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu nhập lại không khớp" ControlToCompare="txtPassNew" ControlToValidate="txtConfirmPassNew" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupProLogin">*</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button class="btn btn-default" ID="btnUpdateLog" runat="server" Text="Cập Nhật" OnClick="btnUpdateLog_Click" ValidationGroup="groupProLogin" /></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" Font-Bold="True" ForeColor="Red" ValidationGroup="groupProLogin" HeaderText="--Danh sách lỗi--" />
                                    </td>
                                    <td>&nbsp</td>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <!--/Profile Login form-->
                </div>
                <div class="col-sm-1">
                    <h2 class="or">OR</h2>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form">
                        <!--Profile form-->
                        <h2 class="border-box">Thông Tin Cá Nhân</h2>
                        <div>
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 95%;">
                                        <asp:TextBox class="form-control" ID="txtName" runat="server" placeholder="Họ tên" Width="100%" Height="30px" />

                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvNamSu" runat="server" ErrorMessage="Chưa nhập tên" ControlToValidate="txtName" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupProfile">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cvName" runat="server" ControlToValidate="txtName" ErrorMessage="Tên tài khoản ít nhất 6 kí tự" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupProfile" ClientValidationFunction="CheckName">*</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" ID="txtBirthDay" placeholder="Ngày sinh (dd/MM/yyyy)" runat="server" TextMode="Date" Width="100%" Height="30px" /></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvBirthday" runat="server" ErrorMessage="Chưa nhập ngày sinh" ControlToValidate="txtBirthday" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupProfile">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cvBirthday" runat="server" ErrorMessage="Ngày sinh không đúng định dạng (dd/MM/yyyy)" ControlToValidate="txtBirthday" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupProfile" OnServerValidate="cvBirthday_ServerValidate">*</asp:CustomValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList class="form-control" ID="cbbSex" runat="server" Style="margin-bottom: 10px;" Height="30px">
                                            <asp:ListItem Value="0" Selected="True" Text="Giới tính..." />
                                            <asp:ListItem Value="1" Text="Nam" />
                                            <asp:ListItem Value="2" Text="Nữ" />
                                        </asp:DropDownList></td>
                                    <td>
                                        <asp:CustomValidator ID="cusvCbbSex" runat="server" ErrorMessage="Chưa chọn giới tính" ControlToValidate="cbbSex" ForeColor="Red" SetFocusOnError="True" ValidationGroup="groupProfile" OnServerValidate="cusvCbbSex_ServerValidate">*</asp:CustomValidator></td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="form-control" ID="txtDiaChi" placeholder="Địa chỉ" runat="server" Width="100%" Height="30px" />
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button class="btn btn-default" ID="btnUpdatePro" runat="server" Text="Cập Nhật" ValidationGroup="groupProfile" OnClick="btnUpdatePro_Click" /></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" ValidationGroup="groupProfile" HeaderText="--Danh sách lỗi--" />
                                    </td>
                                    <td>&nbsp</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!--/Profile Login form-->
                </div>
            </div>
        </div>
    </section>
    <!--/form-->
</asp:Content>
