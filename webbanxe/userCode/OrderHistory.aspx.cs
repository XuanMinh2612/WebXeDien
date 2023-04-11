using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webbanxe.ChucNang;
namespace webbanxe.userCode
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        public void LoadData()
        {
            modelUser model = new modelUser();
            DataTable dt = model.GetHoaDon(model.GetCookie());
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}