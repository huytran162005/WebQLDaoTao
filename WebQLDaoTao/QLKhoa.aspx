<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2> TRANG QUẢN TRỊ KHOA </h2>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thêm Khoa Mới</button>
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h5 class="modal-title" id="myModalLabel">Thêm khoa mới</h5>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group row">
                                        <label for="txtMaMH" class="col-sm-2 col-form-label">Mã khoa:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="txtMaKH" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="txtTenMH" class="col-sm-2 col-form-label">Tên khoa:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox ID="txtTenKH" runat="server" CssClass="form-control"></asp:TextBox>
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
    <asp:GridView ID="gvKhoa" runat="server" DataSourceID="odsKhoa" CssClass="table table-bordered" 
                  AutoGenerateColumns="False" DataKeyNames="MaKH" OnRowDeleted="gvKhoa_RowDeleted"
                  AllowPaging="true" PageSize="6">
        <Columns>
            <asp:BoundField DataField="MaKH" HeaderText="Mã Khoa" ReadOnly="true"/>
            <asp:BoundField DataField="TenKH" HeaderText="Tên Khoa"/>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Chọn tác vụ" ButtonType="Button" />
        </Columns>
        <HeaderStyle ForeColor="#ffffff" BackColor="#003399" />
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:ObjectDataSource runat="server" ID="odsKhoa"
        TypeName="WebQLDaoTao.Models.KhoaDAO"
        SelectMethod="getAll" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"    
        >
        <DeleteParameters>
            <asp:Parameter Name="MaKH" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaKH" Type="String" />
            <asp:Parameter Name="tenkh" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaKH" Type="String" />
            <asp:Parameter Name="tenkh" Type="String" />

        </UpdateParameters>
    </asp:ObjectDataSource>
<hr />
</asp:Content>
