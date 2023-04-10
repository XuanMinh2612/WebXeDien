using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
namespace webbanxe
{
    public class connect
    {
        public SqlConnection conn;
        public void OpenDB()
        {
            string dc = "Data Source=XUANMINH\\SQLEXPRESS;Initial Catalog=BanXe;Integrated Security=True";
            conn = new SqlConnection(dc);
            conn.Open();
        }
        public void CloseDB()
        {
            conn.Close();
        }
    }
}