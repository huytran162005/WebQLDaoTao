using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text;
            string passwd = txtPassword.Text;
            // if (FormsAuthentication.Authenticate(username, passwd)) //login ok
            UserDAO uDAO = new UserDAO();
            if (uDAO.ValidateUser(username, passwd))
            {
                FormsAuthentication.RedirectFromLoginPage(username, true); //luu lai thong tin xac thuc
            }
            else
            {
                lbThongBao.Text = "Đăng nhập không thành công";
            }
        }
    }
}