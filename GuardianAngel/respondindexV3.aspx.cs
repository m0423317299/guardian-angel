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
    public partial class respondindexV3 : System.Web.UI.Page
    {
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        String strG = "";
        string uId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //load資料
            
            uId = Session["Uid"].ToString();
            dbLoad();
            //刪除資料前確認
            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(connstr);
                string strsql = "SELECT * FROM Oldman_Data WHERE U_id = "+ uId;

                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test");

                DropDownList1.DataTextField = "O_name";
                DropDownList1.DataValueField = "O_id";

                DropDownList1.DataSource = ds.Tables["test"].DefaultView;
                DropDownList1.DataBind();



                SqlConnection conn2 = new SqlConnection(connstr);
                string strsql2 = "SELECT DISTINCT A_style FROM Accident;";

                SqlDataAdapter da2 = new SqlDataAdapter(strsql2, connstr);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2, "test");

                DropDownList2.DataTextField = "A_style";
                DropDownList2.DataValueField = "A_style";

                DropDownList2.DataSource = ds2.Tables["test"].DefaultView;
                DropDownList2.DataBind();



            }
        }
        protected void dbLoad() //load資料
        {
            uId = Session["Uid"].ToString();
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.SelectCommand = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id where U_id = " + uId +"  ORDER BY A_date DESC";
            GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);

            GridView1.Font.Name = "微軟正黑體";
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
            GridView1.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.Font.Size = 12;
            GridView1.Width = 1000;
            GridView1.Height = 400;
            GridView1.DataBind();


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {


            try
            {
                string in_put = DropDownList1.SelectedValue;
                string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id AND U_id = " + uId + " where Oldman_Data.O_Id = " + in_put + "ORDER BY A_date DESC";

                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();
                DropDownList2.ClearSelection();
                DropDownList3.ClearSelection();
            }
            catch (Exception ex)
            {
                GridView1.Columns.Clear();
                GridView1.DataBind();
            }



        }



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {



        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }





        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {


            try
            {
                string in_put = DropDownList2.SelectedValue;
                string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id AND U_id = " + uId + " where Accident.A_style = " + in_put + "ORDER BY A_date DESC";

                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

                DropDownList1.ClearSelection();
                DropDownList3.ClearSelection();
            }
            catch (Exception ex)
            {
                GridView1.Columns.Clear();
                GridView1.DataBind();
            }



        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

            string in_put = DropDownList3.SelectedValue;
            if (in_put == "1")
            {
                string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id AND U_id = " + uId + " where  A_date>=dateadd(mm, -1 , getdate()) ORDER BY A_date DESC";
                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

                DropDownList2.ClearSelection();
                DropDownList1.ClearSelection();

            }
            else if (in_put == "2")
            {
                string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id AND U_id = " + uId + " where  A_date>=dateadd(mm, -6 , getdate()) ORDER BY A_date DESC";
                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

                DropDownList2.ClearSelection();
                DropDownList1.ClearSelection();
            }
            else if (in_put == "3")
            {
                string strsql = "SELECT * FROM Oldman_Data INNER JOIN Accident ON Oldman_Data.O_Id = Accident.O_Id AND U_id = " + uId + " where  A_date>=dateadd(yy, -1 , getdate()) ORDER BY A_date DESC";
                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

                DropDownList2.ClearSelection();
                DropDownList1.ClearSelection();
            }
            else if (in_put == "0")
            {
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("respondindexV3.aspx");
        }
    }
}