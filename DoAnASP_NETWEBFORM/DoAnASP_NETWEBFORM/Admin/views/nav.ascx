<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="nav.ascx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.views.nav" %>
<div class="nav-wrapper">
    <ul id="nav"
        class="nav"
        data-ng-controller="NavCtrl"
        data-slim-scroll
        data-collapse-nav
        data-highlight-active>
        <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i><span data-i18n="Dashboard"></span></a></li>
        <li>
            <a href="#/ui"><i class="fa fa-magic"></i><span data-i18n=""></span>Management</a>
            <ul>
                <li><a href="Categories_Adm.aspx"><i class="fa fa-angle-right"></i><span data-i18n="Categories"></span><span class="badge badge-danger">18</span></a></li>
                <li><a href="Product_Adm.aspx"><i class="fa fa-angle-right"></i><span data-i18n="Products"></span><span class="badge badge-success">13</span></a></li>
                 <li><a href="UserAccount.aspx"><i class="fa fa-angle-right"></i><span data-i18n="Accounts"></span><span class="badge badge-danger">30</span></a></li>
                <li><a href="Order_Adm.aspx"><i class="fa fa-angle-right"></i><span data-i18n="Orders"></span><span class="badge badge-success">50</span></a></li>
            </ul>
        </li>
        <li>
            <a href="#/pages"><i class="fa fa-file-text-o"></i><span data-i18n="Pages"></span></a>
            <ul>
                <li><a href="/Login.aspx"><i class="fa fa-angle-right"></i><span data-i18n="Sign in"></span></a></li>
                <li><a href="/Login.aspx"><i class="fa fa-angle-right"></i><span data-i18n="Sign Up"></span></a></li>
                <li><a href="/RecoPass.aspx"><i class="fa fa-angle-right"></i><span data-i18n="Forgot Password"></span></a></li>
                <li><a href="Profile.aspx"><i class="fa fa-angle-right"></i><span data-i18n="User Profile"></span></a></li>
                <li><a href="/404.aspx"><i class="fa fa-angle-right"></i>404 <span data-i18n="Error"></span></a></li>
            </ul>
        </li>
        <li>
            <a href="Report.aspx"><i class="fa fa-bar-chart-o"></i><span data-i18n="Reports"></span></a>
        </li>
        <li class="nav-task">
            <a href="#/tasks/tasks">
                <i class="fa fa-tasks"></i><span data-i18n="Tasks"></span>
                <span class="badge badge-danger main-badge"
                    data-ng-show="taskRemainingCount > 0">{{taskRemainingCount}}</span>
            </a>
        </li>
        <li>
            <a href="Inbox.aspx"><i class="fa fa-envelope-o"></i><span data-i18n="Mail"></span></a>
        </li>
    </ul>
</div>

