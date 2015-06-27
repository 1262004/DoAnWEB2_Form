<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product_Adm.aspx.cs" Inherits="DoAnASP_NETWEBFORM.Admin.Product_Adm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/bootstrap/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="styles/bootstrap/bootstrap/datepicker.css" rel="stylesheet" />
    <link href="styles/bootstrap/bootstrap/bootstrap-select.min.css" rel="stylesheet" />
    <script src="scripts/jquery-1.9.0.min.js"></script>
    <script src="scripts/bootstrap.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <form runat="server">
        <div class="page">
            <div class="row">
                <div class="col-sm-12">
                    <a href="javascript:;" role="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>Thêm
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <asp:ListView ID="lvwProducts" runat="server" DataKeyNames="ProductID" OnItemCommand="lvwProducts_ItemCommand" OnPagePropertiesChanging="lvwProducts_PagePropertiesChanging">
                        <EmptyDataTemplate>
                            Không có sản phẩm nào
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên SP</th>
                                        <th>Giá SP</th>
                                        <th>Đơn Vị</th>
                                        <th>Hình Ảnh</th>
                                        <th>Số Lượng Tồn</th>
                                        <th>Nhà Cung Cấp</th>
                                        <th>Doanh Mục</th>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ProductID") %></td>
                                <td><%# Eval("ProductName") %></td>
                                <td><%# Eval("UnitPrice","{0:N0}") %></td>
                                <td><%# Eval("Unit") %></td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# String.Format("~/images/product/{0}", Eval("LinkImage")) %>' Width="80px" Height="70px" />
                                </td>
                                <td><%# Eval("NumViews") %></td>
                                <td><%# Eval("Supplier.CompanyName") %></td>
                                <td><%# Eval("Category.CategoryName") %></td>
                                <td>
                                    <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-danger" CommandName="EditPro" CommandArgument='<%# Eval("ProductID") %>'><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></asp:LinkButton></td>
                                <td>
                                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger" CommandName="DelPro" CommandArgument='<%# Eval("ProductID") %>'><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></asp:LinkButton></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <div style="clear: both; text-align: center;">
                        <asp:DataPager ID="dp" runat="server" PagedControlID="lvwProducts" PageSize="10">
                            <Fields>
                                <asp:NumericPagerField CurrentPageLabelCssClass="active" />
                            </Fields>
                        </asp:DataPager>
                    </div>

                </div>
            </div>
        </div>
        <%--add Product--%>
        <div id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Thêm Sản Phẩm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="<%=txtProductName.ClientID%>" class="control-label col-xs-3">Tên Sản Phẩm</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtUnitPrice.ClientID%>" class="control-label col-xs-3">Giá Sản Phẩm</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtSoLuongTon.ClientID%>" class="control-label col-xs-3">Số Lượng Tồn</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtSoLuongTon" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtUnitPrice.ClientID%>" class="control-label col-xs-3">Đơn Vị</label>
                                <div class="col-xs-9">
                                    <asp:DropDownList ID="cbxDonVi" runat="server" CssClass="selectpicker"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtUnitPrice.ClientID%>" class="control-label col-xs-3">Hình Ảnh</label>
                                <div class="col-xs-9">
                                    <asp:FileUpload ID="fileUp" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=cbxSupplier.ClientID%>" class="control-label col-xs-3">Nhà Cung Cấp</label>
                                <div class="col-xs-9">
                                    <asp:DropDownList ID="cbxSupplier" runat="server" CssClass="selectpicker"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=cbxCate.ClientID%>" class="control-label col-xs-3">Doanh Mục</label>
                                <div class="col-xs-9">
                                    <asp:DropDownList ID="cbxCate" runat="server" CssClass="selectpicker"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtDate.ClientID%>" class="control-label col-xs-3">Ngày Nhận</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control datepicker" data-date-format="dd/MM/yyyy"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtDetails.ClientID%>" class="control-label col-xs-3">Mô tả</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtDetails" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="btn btn-danger"><span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span>   Save changes</asp:LinkButton>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Close</button>
                    </div>
                </div>
            </div>
        </div>

        <%--edit Product--%>
        <div id="myEditModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Cập Nhật Sản Phẩm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="<%=txtProductNameE.ClientID%>" class="control-label col-xs-3">Tên Sản Phẩm</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtProductIDE" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtProductNameE" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtUnitPriceE.ClientID%>" class="control-label col-xs-3">Giá Sản Phẩm</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtUnitPriceE" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtSoLuongTonE.ClientID%>" class="control-label col-xs-3">Số Lượng Tồn</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtSoLuongTonE" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=cbxUnitE.ClientID%>" class="control-label col-xs-3">Đơn Vị</label>
                                <div class="col-xs-9">
                                    <asp:DropDownList ID="cbxUnitE" runat="server" CssClass="selectpicker"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=fileUpE.ClientID%>" class="control-label col-xs-3">Hình Ảnh</label>
                                <div class="col-xs-9">
                                    <asp:FileUpload ID="fileUpE" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=cbxSupplierE.ClientID%>" class="control-label col-xs-3">Nhà Cung Cấp</label>
                                <div class="col-xs-9">
                                    <asp:DropDownList ID="cbxSupplierE" runat="server" CssClass="selectpicker"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=cbxCateE.ClientID%>" class="control-label col-xs-3">Doanh Mục</label>
                                <div class="col-xs-9">
                                    <asp:DropDownList ID="cbxCateE" runat="server" CssClass="selectpicker"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtDateE.ClientID%>" class="control-label col-xs-3">Ngày Nhận</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtDateE" runat="server" CssClass="form-control datepicker" data-date-format="dd/MM/yyyy"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="<%=txtDetailsE.ClientID%>" class="control-label col-xs-3">Mô tả</label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtDetailsE" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnCapNhat" runat="server" OnClick="btnCapNhat_Click" CssClass="btn btn-danger"><span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span>   Save changes</asp:LinkButton>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="FOOTER" ContentPlaceHolderID="footer" runat="server">
    <script src="scripts/jquery-1.9.0.min.js"></script>
    <script src="scripts/bootstrap.js"></script>
    <script src="scripts/bootstrap-datepicker.js"></script>
    <script src="scripts/bootstrap-select.min.js"></script>
    <script src="../scripts/tinymce/tinymce.min.js"></script>
    <script type="text/javascript">
        tinymce.init({ selector: 'textarea' });
        $(document).ready(function () {
            $('.datepicker').datepicker()
            $('.selectpicker').selectpicker();

            $('#myEditModal').on('shown.bs.modal', function (e) {
                $('#<%=txtProductNameE.ClientID%>').focus();
            });
        });
    </script>
</asp:Content>
