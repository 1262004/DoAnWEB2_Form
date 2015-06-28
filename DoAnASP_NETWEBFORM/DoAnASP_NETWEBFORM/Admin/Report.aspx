<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="Jtable/metroblue/jquery-ui.css" rel="stylesheet" />
    <link href="Jtable/themes/metro/blue/jtable.css" rel="stylesheet" />
    <link href="Jtable/themes/jqueryui/jtable_jqueryui.css" rel="stylesheet" />
    <link href="Jtable/themes/metro/jtable_metro_base.css" rel="stylesheet" />
    <style>
        select,input, textarea{
            color:black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="page">
        <div class="row">
            <div class="col-sm-12">
                <div id="ReportNamTableContainer">
                </div>
            </div>
        </div>
    </div>
     <div class="page">
        <div class="row">
            <div class="col-sm-6">
                 <div id="chartdiv">   
                   </div>   
            </div>
              <div class="col-sm-6">
                <div id="chartdiv1">   
                   </div>   
            </div>
        </div>
    </div>

    
    <%---Thong ke theo thang--%>
     <div class="page">
        <div class="row">
            <div class="col-sm-12">
                <div id="ReportThangTableContainer">
                </div>
            </div>
        </div>
    </div>
     <div class="page">
        <div class="row">
            <div class="col-sm-6">
                 <div id="chartdiv_thang">   
                   </div>   
            </div>
              <div class="col-sm-6">
                <div id="chardiv_thang1">   
                   </div>   
            </div>
        </div>
    </div>

     <%---Thong ke theo quý--%>
     <div class="page">
        <div class="row">
            <div class="col-sm-12">
                <div id="ReportQuyTableContainer">
                </div>
            </div>
        </div>
    </div>
     <div class="page">
        <div class="row">
            <div class="col-sm-6">
                 <div id="chartdiv_quy">   
                   </div>   
            </div>
              <div class="col-sm-6">
                <div id="chartdiv_quy1">   
                   </div>   
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <script src="../js/jquery.js"></script>
    <script src="Jtable/jquery-ui-1.9.2.min.js"></script>
    <script src="Jtable/json2.min.js"></script>
    <script src="Jtable/jquery.jtable.min.js"></script>
    <script src="Jtable/jquery.jtable.aspnetpagemethods.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

    <script type="text/javascript">
        function formatNumber(number) {
            var number = number.toFixed(2) + '';
            var x = number.split('.');
            var x1 = x[0];
            var x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            return x1 + x2;
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#ReportNamTableContainer').jtable({
                title: 'Table of Report Year',
                sorting: true,
                defaultSorting: 'Nam ASC',
                actions: {
                    listAction: 'Report.aspx/ThongKeTheoTungNamList',
                },
                fields: {
                    Nam: {
                        title: 'Năm',
                        key: true,
                    },
                    DoanhThu: {
                        title: 'Doanh Thu',
                        width: '50%',
                        display: function (data) {
                            return formatNumber(data.record.DoanhThu);
                        }
                    }
                }
            });

            $('#ReportNamTableContainer').jtable('load');

            // tháng
            $('#ReportThangTableContainer').jtable({
                title: 'Table of Report Month',
                sorting: true,
                defaultSorting: 'Thang ASC',
                actions: {
                    listAction: 'Report.aspx/ThongKeTheoTungThangList',
                },
                fields: {
                    Thang: {
                        title: 'Tháng',
                        key: true,
                    },
                    DoanhThu: {
                        title: 'Doanh Thu',
                        width: '50%',
                        display: function (data) {
                            return formatNumber(data.record.DoanhThu);
                        }
                    }
                }
            });

            $('#ReportThangTableContainer').jtable('load');

            // Qúy
            $('#ReportQuyTableContainer').jtable({
                title: 'Table of Report Quy',
                sorting: true,
                defaultSorting: 'Quy ASC',
                actions: {
                    listAction: 'Report.aspx/ThongKeTheoTungQuyList',
                },
                fields: {
                    Quy: {
                        title: 'Quý',
                        key: true,
                    },
                    DoanhThu: {
                        title: 'Doanh Thu',
                        width: '50%',
                        display: function (data) {
                            return formatNumber(data.record.DoanhThu);
                        }
                    }
                }
            });

            $('#ReportQuyTableContainer').jtable('load');

        });
    


        // report
        // Global variable to hold data  
        // Load the Visualization API and the piechart package. 

        google.load('visualization', '1', { packages: ['corechart'] });
    </script>

    
    <%--Chart theo năm--%>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Report.aspx/ThongKeTheoTungNam',
                data: '{}',
                success: function (response) {
                    drawchart(response.d); // calling method  
                },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });
        })

        function drawchart(dataValues) {
            // Callback that creates and populates a data table,  
            // instantiates the pie chart, passes in the data and  
            // draws it.  
            var data = new google.visualization.DataTable();

            data.addColumn('string', 'Nam');
            data.addColumn('number', 'DoanhThu');

            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Nam.toString(), dataValues[i].DoanhThu]);
            }
            // Instantiate and draw our chart, passing in some options  
            var chart = new google.visualization.ColumnChart(document.getElementById('chartdiv'));

            chart.draw(data,
              {
                  title: "Show Google Chart in Asp.net",
                  position: "top",
                  fontsize: "14px",
                  chartArea: { width: '40%' },
              });
            var chart1 = new google.visualization.PieChart(document.getElementById('chartdiv1'));

            // Set chart options
            var options = {
                'title': 'How Much Pizza I Ate Last Night',
                is3D: true
            };
            chart1.draw(data, options);
        }
        </script>  


    <%--Chart theo tháng--%>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Report.aspx/ThongKeTheoTungThang',
                data: '{}',
                success: function (response) {
                    drawchartthang(response.d); // calling method  
                },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });
        })

        function drawchartthang(dataValues) {
            // Callback that creates and populates a data table,  
            // instantiates the pie chart, passes in the data and  
            // draws it.  
            var data = new google.visualization.DataTable();

            data.addColumn('string', 'Thang');
            data.addColumn('number', 'DoanhThu');

            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Nam.toString(), dataValues[i].DoanhThu]);
            }
            // Instantiate and draw our chart, passing in some options  
            var chart = new google.visualization.ColumnChart(document.getElementById('chartdiv_thang'));

            chart.draw(data,
              {
                  title: "Show Google Chart in Asp.net",
                  position: "top",
                  fontsize: "14px",
                  chartArea: { width: '40%' },
              });
            var chart1 = new google.visualization.PieChart(document.getElementById('chardiv_thang1'));

            // Set chart options
            var options = {
                'title': 'How Much Pizza I Ate Last Night',
                is3D: true
            };
            chart1.draw(data, options);
        }
        </script>  




      <%--Chart theo Qúy--%>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Report.aspx/ThongKeTheoTungQuy',
                data: '{}',
                success: function (response) {
                    drawchartquy(response.d); // calling method  
                },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });
        })

        function drawchartquy(dataValues) {
            // Callback that creates and populates a data table,  
            // instantiates the pie chart, passes in the data and  
            // draws it.  
            var data = new google.visualization.DataTable();

            data.addColumn('string', 'Quy');
            data.addColumn('number', 'DoanhThu');

            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Nam.toString(), dataValues[i].DoanhThu]);
            }
            // Instantiate and draw our chart, passing in some options  
            var chart = new google.visualization.ColumnChart(document.getElementById('chartdiv_quy'));

            chart.draw(data,
              {
                  title: "Show Google Chart in Asp.net",
                  position: "top",
                  fontsize: "14px",
                  chartArea: { width: '40%' },
              });
            var chart1 = new google.visualization.PieChart(document.getElementById('chartdiv_quy1'));

            // Set chart options
            var options = {
                'title': 'How Much Pizza I Ate Last Night',
                is3D: true
            };
            chart1.draw(data, options);
        }
        </script>  
</asp:Content>
