<%@ Page Title="Quên Mật Khẩu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecoPass.aspx.cs" Inherits="DoAnASP_NETWEBFORM.RecoPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    <script src="css/sweetalert/sweetalert.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container">
        <div class="step-one">
            <h2 class="heading">Quên mật khẩu?</h2>
        </div>
        <div class="col-xs-4">
            <p>Xin vui lòng nhập địa chỉ email của bạn</p>
            <br />
            <asp:TextBox ID="txtEmail" runat="server" placeHolder="example@domain.com" CssClass="form-control" />
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Địa chỉ email không hợp lệ!" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" />
            <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Địa chỉ email không tồn tại! Vui lòng nhập địa chỉ email khác!" OnServerValidate="CustomValidator2_ServerValidate" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" />
            <div>
                <asp:Button ID="btnBack" runat="server" Text="Quay Về" class="btn btn default get pull-left" CausesValidation="false" OnClientClick="JavaScript:window.history.go(-1);return false;" />
                <asp:Button ID="btnSend" runat="server" Text="Gửi" class="btn btn default get" CausesValidation="true" OnClick="btnSend_Click" Style="margin-left: 5%;" />
            </div>
        </div>
    </div>
    <br />
</asp:Content>
