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
    public partial class ConsulationV3 : System.Web.UI.Page
    {
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        String strG = "";
        string uId = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            

            uId = Session["Uid"].ToString();
            dbLoad();
            //load資料


            //刪除資料前確認
            btnDelete.Attributes["OnClick"] = "return confirm('確定要刪除嗎?')";
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



                SqlDataSource sds = new SqlDataSource();
                sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
                sds.SelectCommand = "SELECT * FROM Consulation INNER JOIN Oldman_Data ON Oldman_Data.O_Id = Consulation.O_id where U_id = "+uId+" and C_date >= GETDATE() ORDER BY O_name DESC";
                GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);

                GridView1.Font.Name = "微軟正黑體";
                GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
                GridView1.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
                GridView1.Font.Size = 12;
                GridView1.Width = 1000;
                GridView1.Height = 400;
                GridView1.DataBind();

            }



        }
        protected void dbLoad1() //load資料
        {
            try
            {
                uId = Session["Uid"].ToString();
                string in_put = DropDownList1.SelectedValue;
                string strsql = "SELECT * FROM Consulation INNER JOIN Oldman_Data ON Oldman_Data.O_Id = Consulation.O_id where U_id = "+ uId + " and Consulation.O_id = " + in_put + " and C_date >= GETDATE() ORDER BY O_name DESC";

                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                GridView1.Columns.Clear();
                GridView1.DataBind();
            }
        }
        protected void dbLoad2() //load資料
        {
            uId = Session["Uid"].ToString();
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.SelectCommand = "SELECT * FROM Consulation INNER JOIN Oldman_Data ON Oldman_Data.O_Id = Consulation.O_id where U_id = "+ uId + " and C_date >= GETDATE() ORDER BY O_name DESC";
            GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);

            GridView1.Font.Name = "微軟正黑體";
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
            GridView1.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.Font.Size = 12;
            GridView1.Width = 1000;
            GridView1.Height = 400;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsulationAdd.aspx");
        }
        protected void btnedit_Click(object sender, EventArgs e)
        {

            List<object> parameters = new List<object>();
            List<object> parameters_value = new List<object>();
            var x = "";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (cb.Checked == true)
                {
                    parameters.Add("@C_id");
                    parameters_value.Add(GridView1.Rows[i].Cells[2].Text);
                    x = GridView1.Rows[i].Cells[2].Text;

                }

            }

            if (parameters.Count > 1)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "test", "alert('請選擇一個選項');", true);
            }
            else
            {

                Session["Cid"] = x;
                Response.Redirect("ConsulationEdit.aspx");

            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            List<object> parameters = new List<object>();
            List<object> parameters_value = new List<object>();

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (cb.Checked == true)
                {
                    parameters.Add("@C_id");
                    parameters_value.Add(GridView1.Rows[i].Cells[2].Text);
                }

            }


            if (parameters.Count != 0)
            {
                
                string sql = "";
                //刪除
                SqlDataSource sds = new SqlDataSource();
                sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";

                for (int i = 0; i < parameters.Count; i++)
                {
                    sql += "delete Consulation where C_id='" + parameters_value[i].ToString() + "';";
                }
                sds.DeleteCommand = sql;
                sds.Delete();
            }
            else
            {
                Response.Write("<script language=javascript>alert('請先選取欲刪除之資料')</script>");
            }
            dbLoad2();


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {


            try
            {
                string in_put = DropDownList1.SelectedValue;
                string strsql = "SELECT * FROM Consulation INNER JOIN Oldman_Data ON Oldman_Data.O_Id = Consulation.O_id where U_id = "+ uId +" and Consulation.O_id = " + in_put + " and C_date >= GETDATE() ORDER BY O_name DESC";

                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test1");

                GridView1.DataSource = ds.Tables["test1"].DefaultView;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                GridView1.Columns.Clear();
                GridView1.DataBind();
            }



        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
            int id = 0;
            strG = GridView1.SelectedRow.Cells[4].Text; //暫存被刪除的id(string)
            id = int.Parse(strG);
            Session["Cid"] = strG;
            */
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.SelectCommand = "@Data Source =.; Initial Catalog = Guardian_Angel; Integrated Security = True";
            sds.SelectCommand = "SELECT * FROM Consulation INNER JOIN Oldman_Data ON Oldman_Data.O_Id = Consulation.O_id where U_id = "+ uId + " and C_date >= GETDATE() ORDER BY O_name DESC";
            GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);
            GridView1.PageIndex = e.NewPageIndex;

            GridView1.Font.Name = "微軟正黑體";
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
            GridView1.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.Font.Size = 12;
            GridView1.Width = 1000;
            GridView1.Height = 400;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int strCurrentRowIndex = row.RowIndex;
            var id = GridView1.Rows[strCurrentRowIndex].Cells[2].Text;

            //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "test", "alert('"+id+"');",true);       
            Session["Cid"] = id;

            Response.Redirect("ConsulationEdit.aspx");
        }
    }
}