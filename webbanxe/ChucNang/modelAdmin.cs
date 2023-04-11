using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using webbanxe;
namespace webbanxe.model
{
    public class modelAdmin : connect
    {

        public DataTable TraData()
        {
            OpenDB();
            String sql = "Select * from XeDien";
            SqlDataAdapter da = new SqlDataAdapter(sql, base.conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            CloseDB();
            return dt;
        }
        public Boolean check(String maxe)
        {
            OpenDB();
            String sql = "Select *from XeDien where MaXe='" + maxe + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            CloseDB();
            if (dt.Rows.Count > 0)
                return false;
            else
                return true;
        }
        public Boolean Them(xedien xe)
        {
            OpenDB();
            if (check(xe.MaXe) == false) { return false; }
            else
            {
                OpenDB();
                String sql = "Insert into XeDien values(@maxe,@tenxe,@tenhang,@namsx,@kieudang,@mota,@anh,@giaban,@soluong)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("maxe", xe.MaXe);
                cmd.Parameters.AddWithValue("tenxe", xe.TenXe);
                cmd.Parameters.AddWithValue("tenhang", xe.TenHang);
                cmd.Parameters.AddWithValue("namsx", xe.NamSx);
                cmd.Parameters.AddWithValue("kieudang", xe.KieuDang);
                cmd.Parameters.AddWithValue("mota", xe.MoTa);
                cmd.Parameters.AddWithValue("anh", xe.Anh);
                cmd.Parameters.AddWithValue("giaban", xe.GiaBan);
                cmd.Parameters.AddWithValue("soluong", xe.SoLuong);
                cmd.ExecuteNonQuery();
                CloseDB();
                return true;
            }
        }
        public Boolean Update(xedien xe)
        {
            OpenDB();
            string sql = "update XeDien set TenXe=@TenSach, TenHang=@NhaXB, NamSx=@NamXB, KieuDang=@TacGia, MoTa=@DonGia,GiaBan=@giaban,SoLuong=@soluong";

            if (xe.Anh != "")
            {
                sql += " , Anh = @HinhAnh";
                sql += " where MaXe = @MaSach";
            }
            else 
                sql += " where MaXe = @MaSach";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("MaSach", xe.MaXe);
            cmd.Parameters.AddWithValue("TenSach", xe.TenXe);
            cmd.Parameters.AddWithValue("NhaXB", xe.TenHang);
            cmd.Parameters.AddWithValue("NamXB", xe.NamSx);
            cmd.Parameters.AddWithValue("TacGia", xe.KieuDang);
            cmd.Parameters.AddWithValue("DonGia", xe.MoTa);
            cmd.Parameters.AddWithValue("giaban", xe.GiaBan);
            cmd.Parameters.AddWithValue("soluong", xe.SoLuong);
            if (xe.Anh != "")
            {
                cmd.Parameters.AddWithValue("HinhAnh", xe.Anh);
            }
            cmd.ExecuteNonQuery();
            return true;
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
    }
}