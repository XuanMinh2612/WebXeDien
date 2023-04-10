
using System;
using System.Data;
using System.Web.UI.WebControls;
using webbanxe.ChucNang;

namespace webbanxe
{
    public partial class user : System.Web.UI.Page
    {
        modelUser cart = new modelUser();
        DataTable dt = new DataTable();
        //cart cart = new cart();
        public void hienthi()
        {
            //dt.Columns.Add();
            Repeater1.DataSource = cart.trave();
            Repeater1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hienthi();
            }
        }

        //protected void btntk_Click(object sender, EventArgs e)
        //{
            
        //}

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "addsp")
            {
                string user = cart.GetCookie();
                if(user != null)
                {
                    string masp = e.CommandArgument.ToString();
                    if (cart.KTMH(masp) == true)
                    {
                        cart.tangsl(masp);
                    }
                    else
                    {
                        DataTable dt = cart.travechitiet(masp);
                        DataRow dr = dt.Rows[0];
                        string tensp = dr["tenxe"].ToString();
                        int dongia = int.Parse(dr["giaban"].ToString());
                        string hinhanh = dr["anh"].ToString();
                        cart.them(masp, tensp, hinhanh, 1, dongia);
                        Response.Redirect(Request.Url.ToString());
                    }
                }
                else
                {
                    Response.Redirect("../Account/Login.aspx");
                }
            }
        }
        //protected void lssp_ItemCommand(object source, DataListCommandEventArgs e)
        //{
        //    String masp = lssp.DataKeys[e.Item.ItemIndex].ToString();

        //    if (cart.KTMH(masp) == true)
        //    {
        //        cart.tangsl(masp);
        //    }
        //    else
        //    {
        //        DataTable dt = cart.travechitiet(masp);
        //        DataRow dr = dt.Rows[0];
        //        String tensp = dr["TenXe"].ToString();
        //        int dongia = int.Parse(dr["GiaBan"].ToString());
        //        String hinhanh = dr["Anh"].ToString();
        //        cart.them(masp, tensp, hinhanh, 1, dongia);
        //        lbsosp.Text = cart.demsp().ToString();
        //    }
        //}

        //protected void lssp_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
    }
}