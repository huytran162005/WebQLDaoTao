using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
namespace WebQLDaoTao.Models
{
    public class SinhVienDAO
    {
        //phuong thuc them sinh vien vao CSDL
        public int Insert(string masv, string hosv, string tensv, Boolean gioitinh, DateTime ngaysinh, string noisinh, string
        diachi, string makh)
        {
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("insert into sinhvien (masv, hosv, tensv, gioitinh,ngaysinh, noisinh, diachi, makh) values(@masv, @hosv, @tensv, @gioitinh, @ngaysinh, @noisinh, @diachi, @makh)", conn);
            cmd.Parameters.AddWithValue("@masv", masv);
            cmd.Parameters.AddWithValue("@hosv", hosv);
            cmd.Parameters.AddWithValue("@tensv", tensv);
            cmd.Parameters.AddWithValue("@gioitinh", gioitinh);
            cmd.Parameters.AddWithValue("@ngaysinh", ngaysinh);
            cmd.Parameters.AddWithValue("@noisinh", noisinh);
            cmd.Parameters.AddWithValue("@diachi", diachi);
            cmd.Parameters.AddWithValue("@makh", makh);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
        //phuong thuc doc tat ca sinh vien
        public List<SinhVien> getAll()
        {
            List<SinhVien> dsSinhVien = new List<SinhVien>();
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("select * from SinhVien", conn);
            //3.thuc thi ket qua;
            SqlDataReader dr = cmd.ExecuteReader();
            //4.xu ly ket qua tra ve
            while (dr.Read())
            {
                //tao doi tuong sinhvien
                SinhVien sv = new SinhVien
                {
                    MaSV = dr["MaSV"].ToString(),
                    HoSV = dr["Hosv"].ToString(),
                    TenSV = dr["Tensv"].ToString(),
                    GioiTinh = Boolean.Parse(dr["gioitinh"].ToString()),
                    NgaySinh = DateTime.Parse(dr["ngaysinh"].ToString()),
                    NoiSinh = dr["noisinh"].ToString(),
                    DiaChi = dr["diachi"].ToString(),
                    MaKH = dr["Makh"].ToString()
                };

                //add vao dsSinhVien
                dsSinhVien.Add(sv);
            }
            return dsSinhVien;
        }
        //phuong thuc cập nhật thông tin sinh vien vao CSDL
        public int Update(string masv, string hosv, string tensv, Boolean gioitinh, DateTime ngaysinh, string noisinh, string
        diachi, string makh)
        {
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("update sinhvien set hosv=@hosv, tensv=@tensv, gioitinh=@gioitinh,ngaysinh = @ngaysinh, noisinh = @noisinh, diachi = @diachi, makh = @makh where masv = @masv", conn);
            cmd.Parameters.AddWithValue("@masv", masv);
            cmd.Parameters.AddWithValue("@hosv", hosv);
            cmd.Parameters.AddWithValue("@tensv", tensv);
            cmd.Parameters.AddWithValue("@gioitinh", gioitinh);
            cmd.Parameters.AddWithValue("@ngaysinh", ngaysinh);
            cmd.Parameters.AddWithValue("@noisinh", noisinh);
            cmd.Parameters.AddWithValue("@diachi", diachi);
            cmd.Parameters.AddWithValue("@makh", makh);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
        //phuong thuc cập nhật thông tin sinh vien vao CSDL
        public string Delete(string masv)
        {
            string errorMessage = null;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM sinhvien WHERE masv=@masv", conn);
                cmd.Parameters.AddWithValue("@masv", masv);
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected == 0)
                {
                    errorMessage = "Không tìm thấy sinh viên để xóa.";
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 547) // Lỗi ràng buộc khóa ngoại
                {
                    errorMessage = "Không thể xóa sinh viên này vì có dữ liệu liên quan trong bảng khác.";
                }
                else
                {
                    errorMessage = "Lỗi hệ thống: " + ex.Message;
                }
            }
            finally
            {
                conn.Close();
            }

            return errorMessage;
        }


        //.....
    }
}