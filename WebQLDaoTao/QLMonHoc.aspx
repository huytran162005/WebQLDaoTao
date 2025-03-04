<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLMonHoc.aspx.cs" Inherits="WebQLDaoTao.QLMonHoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>QUẢN LÝ MÔN HỌC</h2>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <h3>DANH SÁCH MÔN HỌC</h3>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thêm Môn Học Mới</button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h5 class="modal-title" id="myModalLabel">Thêm môn học mới</h5>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group row">
                                        <label for="txtMaMH" class="col-sm-2 col-form-label">Mã môn:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="txtMaMH" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="txtTenMH" class="col-sm-2 col-form-label">Tên môn:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="txtTenMH" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="txtSoTiet" class="col-sm-2 col-form-label">Số tiết:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="txtSoTiet" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btThem" runat="server" Text="Thêm" CssClass="btn btn-info" OnClick="btThem_Click"/>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            </div>
                            <asp:Label ID="lbThongBao" ForeColor="#cc3300" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            <asp:GridView CssClass="table table-bordered"
                ID="gvMonhoc" runat="server" AutoGenerateColumns="false" DataKeyNames="MaMH"
                OnRowEditing="gvMonhoc_RowEditing" OnRowDeleting="gvMonhoc_RowDeleting"
                OnRowUpdating="gvMonhoc_RowUpdating" OnRowCancelingEdit="gvMonhoc_RowCancelingEdit"
                AllowPaging="true" PageSize="8" OnPageIndexChanging="gvMonhoc_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="Mã môn học" DataField="MaMH" ReadOnly="True" />
                    <asp:BoundField HeaderText="Tên môn học" DataField="TenMH" />
                    <asp:BoundField HeaderText="Số tiết" DataField="SoTiet" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btEdit" CommandName="Edit" runat="server" Text="Sửa"
                                CssClass="btn btn-success" />
                            <asp:Button ID="btDelete" CommandName="Delete" runat="server"
                                Text="Xóa" CssClass="btn btn-danger" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btUpdate" CommandName="Update" runat="server"
                                Text="Ghi" CssClass="btn btn-success" />
                            <asp:Button ID="btCancel" CommandName="Cancel" runat="server"
                                Text="Không" CssClass="btn btn-danger" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
                <HeaderStyle BackColor="#003399" ForeColor="#ffffff" />
            </asp:GridView>
        </div>
    </div>
    <hr />
</asp:Content>
