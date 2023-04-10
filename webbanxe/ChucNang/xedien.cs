using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webbanxe
{
    public class xedien
    {
        private string _MaXe;
        private string _TenXe;
        private string _TenHang;
        private string _NamSx;
        private string _KieuDang;
        private string _MoTa;
        private string _Anh;
        private string _GiaBan;
        private int _SoLuong;
        public xedien(string MaXe, string TenXe, string TenHang, string NamSx, string KieuDang, string MoTa, string Anh, string GiaBan, int SoLuong)
        {
            _MaXe = MaXe;
            _TenXe = TenXe;
            _TenHang = TenHang;
            _NamSx = NamSx;
            _KieuDang = KieuDang;
            _MoTa = MoTa;
            _Anh = Anh;
            _GiaBan = GiaBan;
            _SoLuong = SoLuong;
        }
        public string MaXe { get => _MaXe; set => _MaXe = value; }
        public string TenXe { get => _TenXe; set => _TenXe = value; }
        public string TenHang { get => _TenHang; set => _TenHang = value; }
        public string NamSx { get => _NamSx; set => _NamSx = value; }
        public string KieuDang { get => _KieuDang; set => _KieuDang = value; }
        public string MoTa { get => _MoTa; set => _MoTa = value; }
        public string Anh { get => _Anh; set => _Anh = value; }
        public string GiaBan { get => _GiaBan; set => _GiaBan = value; }
        public int SoLuong { get => _SoLuong; set => _SoLuong = value; }
    }
}