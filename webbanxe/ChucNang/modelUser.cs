using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace webbanxe.ChucNang
{
    public class modelUser : connect
    {
        DataTable dt = new DataTable();
        public DataTable trave()
        {
            OpenDB();
            string sql = "Select * from XeDien";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            CloseDB();
            return dt;

        }
        public void SaveCookie(string userName)
        {
            HttpCookie cookie = new HttpCookie("user");
            cookie.Value = userName;
            cookie.Expires = DateTime.Now.AddDays(30);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        public void DeleteCookie()
        {
            if (HttpContext.Current.Request.Cookies["user"] != null)
            {
                HttpCookie myCookie = new HttpCookie("user");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                HttpContext.Current.Response.Cookies.Add(myCookie);
            }
        }
        public string GetCookie()
        {
            string userJson = HttpContext.Current.Request.Cookies["user"]?.Value;
            string user = !string.IsNullOrEmpty(userJson) ? userJson : null;
            return user;
        }
        public int demsp()
        {
            DataTable dt = (DataTable)HttpContext.Current.Session["Cart"];
            return dt.Rows.Count;
        }
        public Boolean KTMH(String masp)
        {
            Boolean kt = false;
            if (HttpContext.Current.Session["Cart"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)HttpContext.Current.Session["Cart"];
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["MaXe"].ToString() == masp)
                    {

                        kt = true;
                        break;
                    }

                }
            }
            return kt;
        }
        public void them(String masp, String tensp, String hinhanh, int soluong, int dongia)
        {
            if (HttpContext.Current.Session["Cart"] == null)
            {
                dt.Columns.Add("MaXe");
                dt.Columns.Add("TenXe");
                dt.Columns.Add("Anh");
                dt.Columns.Add("GiaBan");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("thanhtien");
            }
            else
            {
                dt = (DataTable)HttpContext.Current.Session["Cart"];
                DataRow dr = dt.NewRow();
                dr["MaXe"] = masp;
                dr["TenXe"] = tensp;
                dr["Anh"] = hinhanh;
                dr["GiaBan"] = dongia;
                dr["SoLuong"] = soluong;
                dr["thanhtien"] = soluong * dongia;
                dt.Rows.Add(dr);

                HttpContext.Current.Session["Cart"] = dt;
            }

        }
        public void tangsl(String masp)
        {
            DataTable dt = (DataTable)HttpContext.Current.Session["Cart"];
            foreach (DataRow dr in dt.Rows)
                if (dr["MaXe"].ToString() == masp)
                {
                    dr["SoLuong"] = int.Parse(dr["SoLuong"].ToString()) + 1;
                    dr["thanhtien"] = int.Parse(dr["SoLuong"].ToString()) * int.Parse(dr["GiaBan"].ToString());
                }
            HttpContext.Current.Session["Cart"] = dt;
        }
        public DataTable travechitiet(String ma)
        {
            OpenDB();
            string sql = "Select * from XeDien where MaXe='" + ma + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            CloseDB();
            return dt;
        }

        //model phan cart
        public int tongtien()
        {
            dt = (DataTable)HttpContext.Current.Session["Cart"];
            int tong = 0;
            foreach (DataRow dr in dt.Rows)
            {
                tong += int.Parse(dr["thanhtien"].ToString());
            }
            return tong;
        }
        public void capnhat(string ma, int soluong)
        {
            dt = (DataTable)HttpContext.Current.Session["Cart"];
            foreach (DataRow dr in dt.Rows)
                if (dr["MaXe"].ToString() == ma)
                {
                    dr["SoLuong"] = soluong;
                    dr["thanhtien"] = int.Parse(dr["SoLuong"].ToString()) * int.Parse(dr["GiaBan"].ToString());
                }
            HttpContext.Current.Session["Cart"] = dt;
        }
        public void Delete(String xe)
        {
            OpenDB();
            String sql = "Delete from XeDien where MaXe = @maxe";
            SqlCommand cmd = new SqlCommand(@sql, conn);
            cmd.Parameters.AddWithValue("maxe", xe);
            cmd.ExecuteNonQuery();
            CloseDB();
        }
        //chi tiet san pham
        public DataTable TraChiTiet(string Masp)
        {
            OpenDB();
            String sql = "Select * from XeDien where MaXe='" + Masp + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            CloseDB();
            return dt;
        }
    }

}