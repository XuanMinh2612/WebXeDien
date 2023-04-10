using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webbanxe.ChucNang;
using System.Data;

namespace webbanxe.userCode
{
    public partial class Cart : System.Web.UI.Page
    {
        modelUser cart = new modelUser();
        DataTable dt = new DataTable();
        public void show()
        {
            grvCart.DataSource = (DataTable)HttpContext.Current.Session["Cart"];
            grvCart.DataBind();
            if (cart.tongtien() != 0)
            {

            lbtong.Text = "Tổng Tiền: " + cart.tongtien().ToString("0,0") + " VND";
            }
            else
            {
                lbtong.Text = "";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show();
            }

        }

        protected void gvgh_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvCart.EditIndex = e.NewEditIndex;
            show();
        }

        protected void gvgh_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String masp = grvCart.DataKeys[e.RowIndex].Value.ToString().Trim();
            int soluong = int.Parse(((TextBox)grvCart.Rows[e.RowIndex].Cells[4].Controls[1]).Text);
            cart.capnhat(masp, soluong);
            grvCart.EditIndex = -1;
            show();
        }

        protected void grvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string MaXe = grvCart.DataKeys[e.RowIndex].Value.ToString();
            DataTable dt = (DataTable)Session["Cart"];
            DataRow[] rows = dt.Select("MaXe='" + MaXe + "'");
            if (rows.Length > 0)
            {
                dt.Rows.Remove(rows[0]);
            }
            Session["Cart"] = dt;
            show();
        }

        protected void grvCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvCart.EditIndex = -1;
            show();
        }

        protected void grvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && grvCart.EditIndex == -1)
            {
                ((LinkButton)e.Row.Cells[7].Controls[2]).OnClientClick = "return confirm('Are u sure??');";
            }
        }
    }
}