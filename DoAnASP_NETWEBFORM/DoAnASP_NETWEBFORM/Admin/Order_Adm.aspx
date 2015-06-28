<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Order_Adm.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.Order_Adm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Jtable/metroblue/jquery-ui.css" rel="stylesheet" />
    <link href="Jtable/themes/metro/blue/jtable.css" rel="stylesheet" />
    <link href="Jtable/themes/jqueryui/jtable_jqueryui.css" rel="stylesheet" />
    <link href="Jtable/themes/metro/jtable_metro_base.css" rel="stylesheet" />
    <style>
        select, input, textarea {
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="page">
        <div class="row">
            <div class="col-sm-12">
                <div id="OrderTableContainer">
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
            $('#OrderTableContainer').jtable({
                title: 'Table of Order',
                paging: true,
                pageSize: 5,
                sorting: true,
                defaultSorting: 'OrderID ASC',
                actions: {
                    listAction: 'Order_Adm.aspx/OrderList',
                    createAction: 'Order_Adm.aspx/CreateOrder',
                    updateAction: 'Order_Adm.aspx/UpdateOrder',
                    deleteAction: 'Order_Adm.aspx/DeleteOrder'
                },
                fields: {
                    OrderID: {
                        title: 'OrderID',
                        key: true,
                        create: false,
                        edit: false,
                        list: true
                    },
                    OrderDetails: {
                        title: '',
                        width: '3%',
                        sorting: false,
                        edit: false,
                        create: false,
                        listClass: 'child-opener-image-column',
                        display: function (cateData) {
                            //Create an image that will be used to open child table
                            var $img = $('<img class="child-opener-image" src="images/order.png" title="Edit Order" />');
                            //Open child table when user clicks the image
                            $img.click(function () {
                                $('#OrderTableContainer').jtable('openChildTable',
                                    $img.closest('tr'),
                                    {
                                        title: cateData.record.OrderID + ' -  Order Detail',
                                        actions: {
                                            listAction: 'Order_Adm.aspx/DetailList_Order?OrderID=' + cateData.record.OrderID,
                                            deleteAction: 'Order_Adm.aspx/DeleteDetail',
                                            updateAction: 'Order_Adm.aspx/UpdateDetail',
                                            createAction: 'Order_Adm.aspx/CreateDetail'
                                        },
                                        fields: {
                                            OrderID: {
                                                title: 'OrderID',
                                                key: true,
                                                defaultValue: cateData.record.OrderID,
                                                create: true
                                            },
                                            ProductID: {
                                                key: true,
                                                create:true,
                                                title: 'ProductName',
                                                width: '20%',
                                                options: 'Order_Adm.aspx/GetProductOptions'
                                            },
                                            UnitPrice: {
                                                title: 'UnitPrice',
                                                width: '10%',
                                                edit: false,
                                                display: function (data) {
                                                    return formatNumber(data.record.UnitPrice);
                                                }
                                            },
                                            Quantity: {
                                                title: 'Quantity',
                                                width: '10%'
                                            },
                                            TotalMoney: {
                                                title: 'TotalMoney',
                                                width: '10%',
                                                edit: false
                                            }
                                        }
                                    }, function (data) { //opened handler
                                        data.childTable.jtable('load');
                                    });
                            });
                            //Return image to show on the person row
                            return $img;
                        }
                    },
                    CustomerID: {
                        title: 'Customer',
                        width: '20%',
                        options: 'Order_Adm.aspx/GetCustomerOptions'
                    },
                    EmployeeID: {
                        title: 'Employee',
                        width: '20%',
                        options: 'Order_Adm.aspx/GetEmployeeOptions'
                    },
                    DateBuy: {
                        title: 'DateBuy',
                        width: '20%',
                        type: 'date',
                        displayFormat: 'yy-mm-dd'
                    },
                    Status: {
                        title: 'Status',
                        width: '12%',
                        type: 'checkbox',
                        values: { '1': 'Chưa thanh toán', '2': 'Đã Thanh toán' },
                        defaultValue: '1'
                    }
                }
            });

            $('#OrderTableContainer').jtable('load');
        });
    </script>
</asp:Content>

