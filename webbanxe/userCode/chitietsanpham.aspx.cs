using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using webbanxe.ChucNang;
namespace webbanxe.userCode
{
    public partial class chitietsanpham : System.Web.UI.Page
    {
        modelUser ct;
        protected void Page_Load(object sender, EventArgs e)
        {
            ct = new modelUser();
            if (!IsPostBack)
            {
                getData();
            }
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "addsp")
            {
                string masp = e.CommandArgument.ToString();
                if (ct.KTMH(masp) == true)
                {
                    ct.tangsl(masp);
                }
                else
                {
                    DataTable dt = ct.travechitiet(masp);
                    DataRow dr = dt.Rows[0];
                    string tensp = dr["tenxe"].ToString();
                    int dongia = int.Parse(dr["giaban"].ToString());
                    string hinhanh = dr["anh"].ToString();
                    ct.them(masp, tensp, hinhanh, 1, dongia);
                    Response.Redirect(Request.Url.ToString());
                }
            }
        }
        void getData()
        {
            DataTable dt = ct.TraChiTiet(Request.QueryString["MaSp"]);
            foreach(DataRow i in dt.Rows)
            {
                Image1.ImageUrl ="~/img/"+ i["Anh"].ToString();
                Label1.Text ="Tên xe là: "+  i["TenXe"].ToString();
                Label2.Text = "Tên Hàng Xe: " + i["TenHang"].ToString();
                Label3.Text="Năm Sản Xuất: " +i["NamSx"].ToString();
                Label4.Text = "Kiểu Dáng Xe: " + i["KieuDang"].ToString();
                Label5.Text = "Mô Tả Xe: " + i["MoTa"].ToString();
                Label6.Text = "Giá Bán Xe: " + i["GiaBan"].ToString();
            }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string user = ct.GetCookie();
            if (user != null)
            {

                string masp = Request.QueryString["MaSp"];
                if (ct.KTMH(masp) == true)
                {
                    ct.tangsl(masp);
                }
                else
                {
                    DataTable dt = ct.travechitiet(masp);
                    DataRow dr = dt.Rows[0];
                    string tensp = dr["tenxe"].ToString();
                    int dongia = int.Parse(dr["giaban"].ToString());
                    string hinhanh = dr["anh"].ToString();
                    ct.them(masp, tensp, hinhanh, 1, dongia);
                    Response.Redirect(Request.Url.ToString());
                }
            }
            else
            {
                Response.Redirect("../Account/Login.aspx");
            }
        }
    }
}