using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webbanxe.ChucNang;
using System.Data;
using System.Data.SqlClient;

namespace webbanxe.userCode
{
    public partial class Oder : System.Web.UI.Page
    {
        private modelUser controller;
        private UserModel userModel;
        DataTable userInfo;
        DataTable cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            controller = new modelUser();
            userModel = new UserModel();
            if (!IsPostBack)
            {
                userInfo = controller.getUser(controller.GetCookie());
                LoadUserInfo();
                GetCart();
            }
        }
        public void LoadUserInfo()
        {
            foreach (DataRow i in userInfo.Rows)
            {
                txtTenKH.Text = i["FullName"].ToString();
                txtDiaChi.Text = i["Address"].ToString();
                txtSDT.Text = i["phoneNumber"].ToString();
                txtEmail.Text = i["Email"].ToString();

            }
        }
        public void GetCart()
        {
            cart = (DataTable)HttpContext.Current.Session["Cart"];
            grvCart.DataSource = cart;
            grvCart.DataBind();

        }



        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            SqlConnection connection;
            connection = new connect().GetConnection();
            SqlCommand command = new SqlCommand("INSERT INTO HoaDon ( MaKH, TenKH, DiaChi, SDT, NgayDH, Email, GhiChu) VALUES (@MaKH, @TenKH, @DiaChi, @SDT, @NgayDH, @Email, @GhiChu);SELECT SCOPE_IDENTITY();", connection);
            connection.Open();
            // Định nghĩa các tham số và giá trị tương ứng
            command.Parameters.AddWithValue("@MaKH", controller.GetCookie());
            command.Parameters.AddWithValue("@TenKH", txtTenKH.Text);
            command.Parameters.AddWithValue("@DiaChi", txtDiaChi.Text);
            command.Parameters.AddWithValue("@SDT", txtSDT.Text);
            command.Parameters.AddWithValue("@NgayDH", DateTime.Now);
            command.Parameters.AddWithValue("@Email", txtEmail.Text);
            command.Parameters.AddWithValue("@GhiChu", txtGhiChu.Text);

            int orderID = Convert.ToInt32(command.ExecuteScalar());
            cart = (DataTable)HttpContext.Current.Session["Cart"];
            foreach (DataRow i in cart.Rows)
            {
                SqlCommand command1 = new SqlCommand("INSERT INTO ChiTietHD (soHD, Maxe, SoLuong, GiaBan) VALUES (@soHD, @Maxe, @soLuong, @giaBan)", connection);
                command1.Parameters.AddWithValue("@soHD", orderID);
                command1.Parameters.AddWithValue("@Maxe", i["MaXe"].ToString());
                command1.Parameters.AddWithValue("@soLuong", int.Parse(i["SoLuong"].ToString()));
                command1.Parameters.AddWithValue("@giaBan", (i["Giaban"].ToString()));
                command1.ExecuteNonQuery();
                HttpContext.Current.Session.Remove("Cart");
                lbTB.Text = "Đặt Hàng Thành Công";
                Response.Redirect("./OrderHistory.aspx");
            }
        }

    }
}