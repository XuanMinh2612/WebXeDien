using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webbanxe.ChucNang;

namespace webbanxe
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        modelUser cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            cart = new modelUser();
            string username = cart.GetCookie();
            if (!IsPostBack)
            {
                lbsosp.Text = cart.demsp().ToString();
                if (username != null)
                {
                    lbUsername.Text = "xin chào " + username + "!";
                    btnLogin.Visible = false;
                }
                else
                {
                    lbUsername.Visible = false;
                    btnLogin.Visible = true;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            cart.DeleteCookie();
            Response.Redirect("../Account/Login.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Account/Login.aspx");
        
        }
    }
}