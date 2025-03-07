using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;
namespace WebQLDaoTao
{
    public partial class QLSinhVien : System.Web.UI.Page
    {
        KhoaDAO khDAO = new KhoaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlKhoa.DataSource = khDAO.getAll();
                ddlKhoa.DataTextField = "tenkh";
                ddlKhoa.DataValueField = "makh";
                ddlKhoa.DataBind();
            }
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            SinhVienDAO svDao = new SinhVienDAO();
            svDao.Insert(txtMaSv.Text,
                Convert.ToString(txtHoSV.Text),
                txtTenSV.Text,
                rdNam.Checked == true ? true : false,
                Convert.ToDateTime(txtNgaySinh.Text),
                txtNoiSinh.Text,
                txtDiaChi.Text,
                ddlKhoa.SelectedValue);
            gvSinhVien.DataBind();
        }

        protected void odsSinhVien_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                string errorMessage = e.Exception.InnerException != null ? e.Exception.InnerException.Message : "Lỗi không xác định!";
                string script = $"alert('{errorMessage}');";
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", script, true);

                e.ExceptionHandled = true; // Ngăn trang bị crash
            }
        }
    }
}