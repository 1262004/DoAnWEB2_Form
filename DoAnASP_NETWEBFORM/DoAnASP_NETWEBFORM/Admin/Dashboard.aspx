<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="page page-dashboard" data-ng-controller="DashboardCtrl">
        <div class="row">
            <div class="col-lg-8">
                <div class="panel panel-default">
                    <div class="panel-body" data-ng-controller="flotChartCtrl">
                        <div data-flot-chart
                            data-data="line1.data"
                            data-options="line1.options"
                            style="width: 100%; height: 372px;">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">

                <div class="row" data-ng-controller="chartCtrl">

                    <div class="col-xsm-6">
                        <div class="panel panel-default">
                            <div class="panel-body text-center">
                                <div easypiechart options="easypiechartsm1.options" percent="easypiechartsm1.percent" class="easypiechart easypiechart-sm">
                                    <span class="pie-percent" ng-bind="easypiechartsm1.percent"></span>
                                </div>
                                <p class="text-center text-muted">Bounce Rate</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-xsm-6">
                        <div class="panel panel-default">
                            <div class="panel-body text-center">
                                <div easypiechart options="easypiechartsm2.options" percent="easypiechartsm2.percent" class="easypiechart easypiechart-sm">
                                    <span class="pie-percent" ng-bind="easypiechartsm2.percent"></span>
                                </div>
                                <p class="text-center text-muted">New Visists</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-xsm-6">
                        <div class="panel panel-default">
                            <div class="panel-body text-center">
                                <div easypiechart options="easypiechartsm3.options" percent="easypiechartsm3.percent" class="easypiechart easypiechart-sm">
                                    <span class="pie-percent" ng-bind="easypiechartsm3.percent"></span>
                                </div>
                                <p class="text-center text-muted">Search Traffic</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-xsm-6">
                        <div class="panel panel-default">
                            <div class="panel-body text-center">
                                <div easypiechart options="easypiechartsm4.options" percent="easypiechartsm4.percent" class="easypiechart easypiechart-sm">
                                    <span class="pie-percent" ng-bind="easypiechartsm4.percent"></span>
                                </div>
                                <p class="text-center text-muted">Modern Browsers</p>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
        </div>

        <div class="panel panel-default" data-ng-controller="flotChartCtrl">
            <div class="panel-body">
                <div data-flot-chart-realtime
                    data-type="realtime"
                    style="width: 100%; height: 350px;">
                </div>
            </div>
        </div>

    </div>

</asp:Content>
