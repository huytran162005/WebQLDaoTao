<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>QUẢN LÝ SINH VIÊN</h2>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thêm Sinh Viên Mới</button>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="myModalLabel">Thêm sinh viên mới</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="txtMaSv" class="col-sm-4 col-form-label">Mã sinh viên:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtMaSv" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtHoSV" class="col-sm-4 col-form-label">Họ Sinh Viên:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtHoSV" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtTenSV" class="col-sm-4 col-form-label">Tên Sinh Viên:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Giới Tính:</label>
                        <div class="col-sm-8">
                            <asp:RadioButton ID="rdNam" runat="server" Text="Nam" GroupName="GT"/>
                            <asp:RadioButton ID="rdNữ" runat="server" Text="Nữ" GroupName="GT"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtNgaySinh" class="col-sm-4 col-form-label">Ngày Sinh:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="form-control" TextMode="Date" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtNgaySinh" class="col-sm-4 col-form-label">Địa Chỉ:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtNgaySinh" class="col-sm-4 col-form-label">Nơi Sinh:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="txtNgaySinh" class="col-sm-4 col-form-label">Nơi Sinh:</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="ddlKhoa" runat="server" 
                                 DataTextField="tenkh" DataValueField="makh" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btThem" runat="server" Text="Thêm" CssClass="btn btn-info" OnClick="btThem_Click"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
                <asp:Label ID="lbThongBao" ForeColor="#cc3300" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <asp:GridView ID="gvSinhVien" runat="server"
        AutoGenerateColumns="False" CssClass="table table-hover table-bordered"
        DataSourceID="odsSinhVien"
        DataKeyNames="MaSV" 
        AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="Mã SV" SortExpression="MaSV" ReadOnly="true" />
            <asp:BoundField DataField="HoSV" HeaderText="Họ SV" SortExpression="HoSV" />
            <asp:BoundField DataField="TenSV" HeaderText="Tên SV" SortExpression="TenSV" />
            <asp:TemplateField HeaderText="Phái">
                <ItemTemplate>
                    <asp:Label ID="lbgioitinh" runat="server"
                        Text='<%# Convert.ToBoolean(Eval("GioiTinh"))==true ? "Nam": "Nữ" %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlphai" runat="server" SelectedValue='<%# Bind("gioitinh") %>'>
                        <asp:ListItem Text="Nam" Value="True"></asp:ListItem>
                        <asp:ListItem Text="Nữ" Value="False"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" SortExpression="NgaySinh" />
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi Sinh" SortExpression="NoiSinh" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" SortExpression="DiaChi" />
            <asp:TemplateField HeaderText="Khoa">
                <ItemTemplate> <%# Eval("makh") %></ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList 
                        ID="ddlmakh" runat="server"
                        DataSourceID="odsKhoa" DataTextField="TenKH"
                        DataValueField="MaKH"
                        SelectedValue='<%# Bind("MaKH") %>' ></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" EditText="Sửa"
                ShowDeleteButton="true" DeleteText="Xóa"
                HeaderText="Chọn chức năng" />
        </Columns>
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        <HeaderStyle ForeColor="#ffffff" BackColor="#003399" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsSinhVien" runat="server" OnDeleted="odsSinhVien_Deleted" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.SinhVienDAO" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="masv" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="masv" Type="String" />
            <asp:Parameter Name="hosv" Type="String" />
            <asp:Parameter Name="tensv" Type="String" />
            <asp:Parameter Name="gioitinh" Type="Boolean" />
            <asp:Parameter Name="ngaysinh" Type="DateTime" />
            <asp:Parameter Name="noisinh" Type="String" />
            <asp:Parameter Name="diachi" Type="String" />
            <asp:Parameter Name="makh" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="masv" Type="String" />
            <asp:Parameter Name="hosv" Type="String" />
            <asp:Parameter Name="tensv" Type="String" />
            <asp:Parameter Name="gioitinh" Type="Boolean" />
            <asp:Parameter Name="ngaysinh" Type="DateTime" />
            <asp:Parameter Name="noisinh" Type="String" />
            <asp:Parameter Name="diachi" Type="String" />
            <asp:Parameter Name="makh" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsKhoa" runat="server" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.KhoaDAO"></asp:ObjectDataSource>
    <hr />
</asp:Content>
