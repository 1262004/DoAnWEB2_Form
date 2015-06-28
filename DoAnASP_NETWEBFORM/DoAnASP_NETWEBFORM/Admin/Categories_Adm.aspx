<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Categories_Adm.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.Categories_Adm" %>
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
                <div id="CateTableContainer">
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
            $('#CateTableContainer').jtable({
                title: 'Table of Categories',
                paging: true,
                pageSize: 5,
                sorting: true,
                defaultSorting: 'CategoryName ASC',
                actions: {
                    listAction: 'Categories_Adm.aspx/CategoriesList',
                    createAction: 'Categories_Adm.aspx/CreateCate',
                    updateAction: 'Categories_Adm.aspx/UpdateCate',
                    deleteAction: 'Categories_Adm.aspx/DeleteCate'
                },
                fields: {
                    CategoryID: {
                        title: 'Category ID',
                        key: true,
                        create: false,
                        edit: false,
                        list: true
                    },
                    Products: {
                        title: '',
                        width: '3%',
                        sorting: false,
                        edit: false,
                        create: false,
                        listClass: 'child-opener-image-column',
                        display: function (cateData) {
                            //Create an image that will be used to open child table
                            var $img = $('<img class="child-opener-image" src="images/product.png" title="Edit Product" />');
                            //Open child table when user clicks the image
                            $img.click(function () {
                                $('#CateTableContainer').jtable('openChildTable',
                                    $img.closest('tr'),
                                    {
                                        title: cateData.record.CategoryName + ' -  Products',
                                        actions: {
                                            paging: true,
                                            pageSize: 5,
                                            sorting: true,
                                            listAction: 'Product_Adm.aspx/ProductList_Cate?CategoryID=' + cateData.record.CategoryID,
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
                                                list: false
                                            },
                                            LinkImage: {
                                                title: 'Image',
                                                width: '20%',
                                                display: function (data) {
                                                    return '<img style="margin-left:10px;" src=/images/product/' + data.record.LinkImage + ' />';
                                                },
                                                edit: false
                                            },
                                            Discount: {
                                                title: 'Discount',
                                                list: false
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
                    CategoryName: {
                        title: 'Category Name',
                        width: '40%'
                    },
                    Description: {
                        title: 'Description',
                        width: '20%'
                    },
                    ParentId: {
                        title: 'ParentId',
                        width: '20%',
                        options: 'Product_Adm.aspx/GetCateOptions'
                    },
                    Image:{
                        title: 'Image',
                        width: '0%',
                        list:false,
                        edit: false,
                        create: false,
                        defaultValue:'hoa.png'
                    }
                }
            });

            $('#CateTableContainer').jtable('load');
        });
    </script>
</asp:Content>
