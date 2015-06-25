<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.UserAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Jtable/metroblue/jquery-ui.css" rel="stylesheet" />
    <link href="Jtable/themes/metro/blue/jtable.css" rel="stylesheet" />
    <link href="Jtable/themes/jqueryui/jtable_jqueryui.css" rel="stylesheet" />
    <link href="Jtable/themes/metro/jtable_metro_base.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="page">
        <div class="row">
            <div class="col-sm-12">
                <div id="AccountTableContainer">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="FOOTER" ContentPlaceHolderID="footer" runat="server">
     <script src="../js/jquery.js"></script>
    <script src="Jtable/jquery-ui-1.9.2.min.js"></script>
    <script src="Jtable/json2.min.js"></script>
    <script src="Jtable/jquery.jtable.min.js"></script>
    <script src="Jtable/jquery.jtable.aspnetpagemethods.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#AccountTableContainer').jtable({
                title: 'Table of Account',
                paging: true,
                pageSize: 5,
                sorting: true,
                defaultSorting: 'UserName ASC',
                actions: {
                    listAction: 'UserAccount.aspx/AccountList',
                    createAction: 'UserAccount.aspx/CreateAccount',
                    updateAction: 'UserAccount.aspx/UpdateAccount',
                    deleteAction: 'UserAccount.aspx/DeleteAccount'
                },
                fields: {
                    AccountID: {
                        title: 'Account ID',
                        key: true,
                        create: false,
                        edit: false,
                        list: true
                    },
                    UserName: {
                        title: 'UserName',
                        width: '20%'
                    },
                    PassWord: {
                        title: 'PassWord',
                        width: '20%'
                    },
                    RoleID: {
                        title: 'RoleID',
                        width: '20%',
                        options: 'UserAccount.aspx/GetRoleOptions'
                    },
                    Enabled: {
                        title: 'Enabled',
                        width: '12%',
                        type: 'checkbox',
                        values: { 'false': 'Passive', 'true': 'Active' }
                    }
                }
            });

            $('#AccountTableContainer').jtable('load');
        });
    </script>
</asp:Content>