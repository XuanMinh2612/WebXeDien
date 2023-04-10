using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webbanxe.ChucNang;
namespace webbanxe
{
    public partial class Login : System.Web.UI.Page
    {
        modelUser model;
        cookies cookie;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            model = new modelUser();
            cookie = new cookies();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=XUANMINH\\SQLEXPRESS;Initial Catalog=BanXe;Integrated Security=True";
            string query = "SELECT * FROM TaiKhoan WHERE UserName = @TenDangNhap AND PassWord = @MatKhau";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@TenDangNhap", txtUsername.Text);
                command.Parameters.AddWithValue("@MatKhau", txtPassword.Text);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    string quyenHan = reader.GetString(7);
                    string username = reader.GetString(1);
                    
                    if (quyenHan == "user")
                    {
                        model.SaveCookie(username);
                        Response.Redirect("../userCode/user.aspx");
                    }
                    else if (quyenHan == "admin")
                    {
                        cookie.SaveCookieAdmin(username);
                        Response.Redirect("../adminCode/admin.aspx");
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Sai Mật khẩu rùi','','error')", true);
                }
            }
        }
    }
}
