<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLDiem.aspx.cs" Inherits="WebQLDaoTao.QLDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>NHẬP ĐIỂM THI</h2>
    <hr />
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2">Chọn môn học</label>
            <div class="col-md-2">
                <asp:DropDownList ID="ddlMonHoc" AutoPostBack="true" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <hr />
    <asp:GridView ID="gvKetQua" ShowFooter="True" DataKeyNames="id" runat="server"
        AutoGenerateColumns="False" CssClass="table table-bordered" Width="50%">
        <Columns>
            <asp:BoundField DataField="masv" HeaderText="Mã sinh viên" />
            <asp:BoundField DataField="hotensv" HeaderText="Họ tên sinh viên" />
            <asp:TemplateField HeaderText="Điểm">
                <ItemTemplate>
                    <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("diem") %>' CssClass="form-control"></asp:TextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btLuu" runat="server" Text="Lưu điểm" CssClass="btn btn-success" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Chọn">
                <ItemTemplate>
                    <asp:CheckBox ID="chkChon" runat="server" CssClass="radio-inline" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btXoa" runat="server" Text="Xóa" CssClass="btn btn-danger" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
