using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;
namespace WebQLDaoTao
{
    public partial class QLKhoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            string makh = txtMaKH.Text;
            string tenkh = txtTenKH.Text;
            if (khoaDAO.findById(makh) != null)
            {
                lbThongBao.Text = "Mã khoa đã tồn tại. Chọn mã khác nhé";
                return;
            }
            //goi phuong thuc thêm khoa vào CSDL
            khoaDAO.Insert(makh, tenkh);
            lbThongBao.Text = "Đã thêm 1 khoa";
            //liên kết dữ liệu cho gvkhoa
            gvKhoa.DataSource = KhoaDAO.getAll();
            gvKhoa.DataBind();
        }
    }
}