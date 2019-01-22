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
    public partial class ConsulationEdit : System.Web.UI.Page
    {
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        string cId = "";
        string uId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            cId = Session["Cid"].ToString();
            uId = Session["Uid"].ToString();

            if (!IsPostBack)
            {
                SqlDataSource sds = new SqlDataSource();
                sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
                sds.SelectCommand = "SELECT * FROM Consulation WHERE C_id = " + "'" + cId + "'";


                DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

                tbxClinic.Text = dv.Table.Rows[0]["C_name"].ToString();
                tbxAddress.Text = dv.Table.Rows[0]["C_address"].ToString();
                tbxPhone.Text = dv.Table.Rows[0]["C_phone"].ToString();
                //Calendar1.SelectedDate = dv.Table.Rows[0]["C_date"].ToString();


                SqlConnection conn = new SqlConnection(connstr);
                string strsql = "SELECT * FROM Oldman_Data WHERE U_id = "+ uId;

                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test");

                DropDownList1.DataTextField = "O_name";
                DropDownList1.DataValueField = "O_id";

                DropDownList1.DataSource = ds.Tables["test"].DefaultView;
                DropDownList1.DataBind();

            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsulationV3.aspx");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";

            sds.InsertCommand = getInsertSql();
            sds.Insert();
            lblMsg.Visible = true;
            lblMsg.Text = "【" + tbxClinic.Text + "】資料修改成功！";
            btnSave.Enabled = false;


        }
        private string getInsertSql()
        {


            string strSql = "";
            strSql += "UPDATE Consulation SET C_name = ";
            strSql += "'" + tbxClinic.Text + "'";
            strSql += ", C_address =  ";
            strSql += "'" + tbxAddress.Text + "'";
            strSql += ", C_date =  ";
            strSql += "'" + Calendar1.SelectedDate.ToShortDateString() + "'";
            strSql += ", C_phone =  ";
            strSql += "'" + tbxPhone.Text + "'";
            strSql += ", O_id =  ";
            strSql += "'" + DropDownList1.SelectedValue + "'";
            strSql += "1 WHERE C_id = ";
            strSql += "'" + cId + "'";


            return (strSql);



        }
    }
}