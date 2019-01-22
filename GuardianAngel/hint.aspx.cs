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
    public partial class hint : System.Web.UI.Page
    {

        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        string oId = "";
        string uId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            
            uId = Session["Uid"].ToString();
            dbLoad();
        }

        protected void dbLoad() //load資料
        {
            if (!IsPostBack)
            {
                uId = Session["Uid"].ToString();
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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string in_put = DropDownList1.SelectedValue.ToString();
            Session["Oid"] = in_put;
            Response.Redirect("hintselect.aspx");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}