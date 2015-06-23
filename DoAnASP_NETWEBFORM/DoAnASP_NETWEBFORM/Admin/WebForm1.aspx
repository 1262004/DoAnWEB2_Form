<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Jtable/metroblue/jquery-ui.css" rel="stylesheet" />
       <link href="Jtable/themes/jqueryui/jtable_jqueryui.css" rel="stylesheet" />
      <link href="Jtable/themes/metro/blue/jtable.css" rel="stylesheet" />
 
   
    <title></title>
</head>
<body>
  
                <div id="CateTableContainer">
                </div>
    <script src="scripts/jquery-1.9.0.min.js"></script>
    <script src="Jtable/jquery-ui-1.9.2.min.js"></script>
    <script src="Jtable/json2.min.js"></script>
    <script src="Jtable/jquery.jtable.min.js"></script>
    <script src="Jtable/jquery.jtable.aspnetpagemethods.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#CateTableContainer').jtable({
                title: 'Table of Categories',
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
                    CategoryName: {
                        title: 'Category Name',
                        width: '40%'
                    }
                }
            });

            $('#CateTableContainer').jtable('load');
        });
    </script>
</body>
</html>
