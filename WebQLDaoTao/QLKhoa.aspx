<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2> TRANG QUẢN TRỊ KHOA </h2>
    <asp:GridView ID="gvKhoa" runat="server" DataSourceID="odsKhoa" CssClass="table table-bordered" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="MaKH" HeaderText="Mã Khoa"/>
            <asp:BoundField DataField="TenKH" HeaderText="Tên Khoa"/>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Chọn tác vụ" ButtonType="Button" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource runat="server" ID="odsKhoa"
        TypeName="WebQLDaoTao.Models.KhoaDAO"
        SelectMethod="getAll" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"    
        >
        <DeleteParameters>
            <asp:Parameter Name="makh" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="makh" Type="String" />
            <asp:Parameter Name="tenkh" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="makh" Type="String" />
            <asp:Parameter Name="tenkh" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
<hr />
</asp:Content>
