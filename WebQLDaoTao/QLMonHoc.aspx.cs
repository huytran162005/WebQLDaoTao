using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;
namespace WebQLDaoTao
{
    public partial class QLMonHoc : System.Web.UI.Page
    {
        MonHocDAO mhDAO = new MonHocDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //lien ket du lieu cho gvMonhoc
                gvMonhoc.DataSource = mhDAO.getAll();
                gvMonhoc.DataBind();
            }
        }
        protected void gvMonhoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //chuyen doi trang thai cua dong hien hanh : từ chế độ xem sang chế độ sửa
            gvMonhoc.EditIndex = e.NewEditIndex;
            //lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }
    }
}