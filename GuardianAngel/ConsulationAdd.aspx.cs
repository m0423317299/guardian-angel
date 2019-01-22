using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class ConsulationAdd : System.Web.UI.Page
    {
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        string uId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            uId = Session["Uid"].ToString();

            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(connstr);
                string strsql = "SELECT * FROM Oldman_Data WHERE U_id = "+uId;

                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test");

                DropDownList1.DataTextField = "O_name";
                DropDownList1.DataValueField = "O_id";

                DropDownList1.DataSource = ds.Tables["test"].DefaultView;
                DropDownList1.DataBind();
            }
        }
        protected void btnOK_Click(object sender, EventArgs e)
        {

            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";

            sds.InsertCommand = getInsertSql();
            sds.Insert();

            lblMsg.Visible = true;
            lblMsg.Text = "新預約【" + tbxClinic.Text + "】資料新增成功！";
            btnOK.Enabled = false;


            //跳出訊息告知新增成功
            //Response.Write("<script language=javascript>alert('資料新增成功！將返回資料頁')</script>");
            //Response.Redirect("GaCare.aspx");
        }

        private string getInsertSql()
        {


            string strSql = "";
            strSql += "Insert into Consulation(C_name,C_address,C_date,C_phone,O_id) values(";

            int i = Int32.Parse(DropDownList1.SelectedValue);
            strSql += "'" + tbxClinic.Text + "',";
            strSql += "'" + tbxAddress.Text + "',";
            strSql += "'" + Calendar1.SelectedDate.ToShortDateString() + "',";
            strSql += "'" + tbxPhone.Text + "',";
            strSql += "'" + DropDownList1.SelectedValue + "')";
            return (strSql);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ini();
            return;
        }

        protected void ini()
        {
            tbxClinic.Text = "";
            tbxAddress.Text = "";
            tbxPhone.Text = "";


        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsulationV3.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            btnOK.Enabled = true;
            ini();
        }
    }
}