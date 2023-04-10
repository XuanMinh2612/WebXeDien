using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webbanxe;

namespace webbanxe
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Kiểm tra dữ liệu đầu vào
            if (string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {
                lblMessage.Text = "Username and password are required.";
                return;
            }

            // Kiểm tra xem tên đăng nhập đã được sử dụng chưa
            string username = txtUsername.Text.Trim();
            if (IsUsernameExist(username))
            {
                lblMessage.Text = "This username is already taken.";
                return;
            }

            // Thêm tài khoản vào cơ sở dữ liệu
            using (SqlConnection conn = new SqlConnection("Data Source=XUANMINH\\SQLEXPRESS;Initial Catalog=BanXe;Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO TaiKhoan (UserName, PassWord, FullName, Address, PhoneNumber, Email, Role) VALUES (@UserName, @PassWord, @FullName, @Address, @PhoneNumber, @Email, @Role)", conn);
                cmd.Parameters.AddWithValue("@UserName", username);
                cmd.Parameters.AddWithValue("@PassWord", txtPassword.Text);
                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            // Hiển thị thông báo khi đăng ký thành công tài khoản và chuyển hướng đến trang đăng nhập khi người dùng ấn OK
            string message = "Đăng ký tài khoản thành công!";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "'); window.location.href = 'Login.aspx'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        // Hàm kiểm tra xem tên đăng nhập đã tồn tại trong cơ sở dữ liệu chưa
        private bool IsUsernameExist(string username)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=XUANMINH\\SQLEXPRESS;Initial Catalog=BanXe;Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM TaiKhoan WHERE UserName = @UserName", conn);
                cmd.Parameters.AddWithValue("@UserName", username);
                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                conn.Close();
                return (count > 0);
            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {

        }

        protected void lnkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
