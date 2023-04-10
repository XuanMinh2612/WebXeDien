using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data;

namespace webbanxe
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("MaXe");
            dt.Columns.Add("TenXe");
            dt.Columns.Add("Anh");
            dt.Columns.Add("GiaBan");
            dt.Columns.Add("SoLuong");
            dt.Columns.Add("thanhtien");
            Session["Cart"] = dt;

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}