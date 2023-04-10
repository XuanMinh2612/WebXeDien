using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webbanxe.model;
using webbanxe.ChucNang;
using System.Data;
using System.Text.RegularExpressions;

namespace webbanxe
{
    public partial class admin : System.Web.UI.Page
    {
        cookies cookie;
        modelUser cart;
        modelAdmin db = new modelAdmin();

        void getData()
        {
            var data = db.TraData();
            foreach (DataRow row in data.Rows)
            {
                row["giaban"] = int.Parse(row["giaban"].ToString()).ToString("C0");
            }
            grvData.DataSource = data;

            grvData.DataBind();

        }
        void clearALL()
        {
            txtMa.Text = "";
            txtTenXe.Text = "";
            txtHangXe.Text = "";
            txtNamSX.Text = "";
            txtKieuDang.Text = "";
            txtMota.Text = "";
            txtGiaBan.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            cookie = new cookies();
            cart = new modelUser();
            string adminname = cookie.GetCookie();
            if (!IsPostBack)
            {
                getData();
                if (adminname != null)
                {
                    lbUsername.Text = "xin chào " + adminname + "!";
                    btnLogin.Visible = false;
                    btnLogout.Visible = true;
                }
                else
                {
                    lbUsername.Visible = false;
                    btnLogin.Visible = true;
                    Response.Redirect("../Account/Login.aspx");
                }
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            string maxe = txtMa.Text;
            string tenxe = txtTenXe.Text;
            string tenhang = txtHangXe.Text;
            string namsx = txtNamSX.Text;
            string kieudang = txtKieuDang.Text;
            string mota = txtMota.Text;
            string hinhanh = "";
            string giaban = Regex.Replace(txtGiaBan.Text, @"[^0-9]", "");
            int soluong = 0;
            try
            {
                hinhanh = fileAnh.FileName;
                fileAnh.SaveAs(Server.MapPath("~/img/") + hinhanh);
            }
            catch (Exception)
            {
                throw;
            }
            xedien xe = new xedien(maxe, tenxe, tenhang, namsx, kieudang, mota, hinhanh, giaban, soluong);
            if (db.Them(xe) == true)
            {
                Label2.Text = "Thêm thành công";
                getData();
                clearALL();
            }
            else
            {
                Label2.Text = "Trùng mã xe òi";
                txtMa.Focus();
                getData();
            }
        }





        protected void grvData_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvData.EditIndex = e.NewEditIndex;
            getData();
        }

        protected void grvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvData.EditIndex = -1;
            getData();
        }

        protected void grvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String xe = grvData.DataKeys[e.RowIndex].Value.ToString().Trim();
            db.Delete(xe);
            getData();
        }

        protected void grvData_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow && grvData.EditIndex == -1)
            {
                ((LinkButton)e.Row.Cells[8].Controls[2]).OnClientClick = "return confirm('Are u sure??');";
            }
            //if (e.Row.RowType == DataControlRowType.DataRow && grvData.EditIndex == -1)
            //{
            //    ((LinkButton)e.Row.Cells[8].Controls[2]).OnClientClick = "return confirm('Are u sure??');";
            //    //decimal giaBan = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "GiaBan"));
            //    string formattedGiaBan = giaBan.ToString("#,##0");
            //    e.Row.Cells[7].Text = formattedGiaBan + " VNĐ";
            //}
        }

        protected void grvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string maxe = grvData.DataKeys[e.RowIndex].Value.ToString().Trim();
            string tenxe = ((TextBox)grvData.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string tenhang = ((TextBox)grvData.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string namsx = ((TextBox)grvData.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string kieudang = ((TextBox)grvData.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string mota = ((TextBox)grvData.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
            FileUpload hinhanh = (FileUpload)grvData.Rows[e.RowIndex].Cells[6].Controls[1]/*.FindControl("fileSua")*/;
            string giaban = ((TextBox)grvData.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
            giaban = Regex.Replace(giaban, @"[^0-9]", "");
            int soluong = 0; //run
            string anh = "";
            if (hinhanh.FileName != "")
            {
                anh = hinhanh.FileName;
                hinhanh.SaveAs(Server.MapPath("~/img/") + anh);
            }
            xedien xe = new xedien(maxe, tenxe, tenhang, namsx, kieudang, mota, anh, giaban, soluong);
            if (db.Update(xe) == true)
            {
                Label3.Text = "Sửa thành công!!!";
            }
            else
            {
                Label3.Text = " Sửa Thất Bại!!!";

            }
            grvData.EditIndex = -1;
            getData();
        }

        protected void grvData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            cookie.DeleteCookie();
            Response.Redirect("../Account/Login.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Account/Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            txtMa.Text = "";
            txtTenXe.Text = "";
            txtHangXe.Text = "";
            txtNamSX.Text = "";
            txtKieuDang.Text = "";
            txtMota.Text = "";
            txtGiaBan.Text = "";
        }
    }
}