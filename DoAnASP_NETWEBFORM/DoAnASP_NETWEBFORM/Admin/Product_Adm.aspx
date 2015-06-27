<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product_Adm.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.Product_Adm" %>
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
                <div id="CateTableContainer" style="margin-left:10px;color:black;">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="FOOTER" ContentPlaceHolderID="footer" runat="server">
    <script src="../js/jquery.js"></script>
    <script src="Jtable/jquery-ui-1.9.2.min.js"></script>
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
    <script src="Jtable/json2.min.js"></script>
    <script src="Jtable/jquery.jtable.min.js"></script>
    <script src="Jtable/jquery.jtable.aspnetpagemethods.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#CateTableContainer').jtable({
                title: 'Table of Product',
                paging: true,
                pageSize: 10,
                sorting: true,
                defaultSorting: 'DateReceived ASC',
                actions: {
                    listAction: 'Product_Adm.aspx/ProductList',
                    createAction: 'Product_Adm.aspx/CreateProduct',
                    updateAction: 'Product_Adm.aspx/UpdateProduct',
                    deleteAction: 'Product_Adm.aspx/DeleteProduct'
                },
                fields: {
                    ProductID: {
                        title: 'Product ID',
                        key: true,
                        create: false,
                        edit: false,
                        list: false
                    },
                    ProductName: {
                        title: 'ProductName',
                        width: '20%'
                    },
                    UnitPrice: {
                        title: 'UnitPrice',
                        width: '10%',
                        display: function (data) {
                            return formatNumber(data.record.UnitPrice);
                        }
                    },
                    Unit: {
                        title: 'Unit',
                        list:false
                    },
                    LinkImage: {
                        title: 'Image',
                        width: '20%',
                        display: function (data) {
                            return '<img style="margin-left:10px;" src=/images/product/' + data.record.LinkImage + ' />';
                        },
                        input: function(data) {
                            // data.value will be undefined on create method so we will show only input file tag
                            if (typeof data.value === "undefined") {
                                return '<div><input type="file" name="photo" id="fileUpload" class="upload"/></div>';
                            }
                            else {
                                // on edit method we will show the image and the input file tag
                                return '<div><input type="file" name="photo" id="fileUpload" class="upload"/></div>' +
                                       '<div><img style="margin-left:10px;" src=/images/product/' + data.record.LinkImage + ' height="50px" /></div>';
                            }
                        }
                    },     
                    Discount: {
                        title: 'Discount',
                        list:false
                    },
                    NumViews: {
                        title: 'NumViews',
                        width: '10%'
                    },
                    DateReceived: {
                        title: 'DateReceived',
                        width: '10%',
                        type: 'date',
                        displayFormat: 'dd-mm-yy'
                    },
                    SupplierID: {
                        title: 'Supplier',
                        width: '10%',
                        options: 'Product_Adm.aspx/GetSuppOptions'
                    },
                    CategoryID: {
                        title: 'Category',
                        width: '10%',
                        options: 'Product_Adm.aspx/GetCateOptions'
                    },
                    Status: {
                        title: 'Status',
                        width: '12%',
                        type: 'checkbox',
                        values: { '0': 'Hết Hàng', '1': 'Còn Hàng' },
                        defaultValue: '1'
                    },
                    Details: {
                        title: 'Details',
                        list:false
                    },
                }
            });
            $('#CateTableContainer').jtable('load');
        });
    </script>
</asp:Content>

