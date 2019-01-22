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
    public partial class respond_oldV3 : System.Web.UI.Page
    {
        string uId = "";
        string oId = "";
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //避免跳回原值
            oId = Session["Oid"].ToString();
            uId = Session["Uid"].ToString();

            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(connstr);
                string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id where U_id = " + uId + " and Oldman_Data.O_id = " + oId + "  ORDER BY A_date DESC";
                //  "select distinct  LNAME,SSN  from employee inner join works_on on SSN = ESSN";


                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test");

                GridView1.DataSource = ds.Tables["test"].DefaultView;
                GridView1.DataBind();
            }
        }
    }
}