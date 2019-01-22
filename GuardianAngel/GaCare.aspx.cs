using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.web.mPurpose_master
{
    public partial class GaCare : System.Web.UI.Page
    {
        int intPage = 0;
        string strG = "";

        int intoId = 0;
        string oId = "";
        int intuId = 0;
        string uId = "";

        int intSelect = 0;
        List<object> arrayDelete = new List<object>();



        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            lblMsg.Visible = false;

            intuId = Convert.ToInt32(Session["uId"]); //暫存主頁傳來的id值           
            //intuId = 1;

            if (intuId == 0)
            {
                Server.Transfer("Login.aspx");
            }
            else
            {

                //load資料
                if (!this.IsPostBack)
                {
                    dbLoad();
                }

                //刪除資料前確認
                btnDelete.Attributes["OnClick"] = "return confirm('確定要刪除嗎?')";
            }
        }



        protected void dbLoad() //load資料
        {

            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.SelectCommand = "select O_id as '編號', O_name as '姓名', O_phone as '電話'" +
                " from Oldman_Data where U_id =" + intuId;
            GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);
            GridView1.Font.Name = "微軟正黑體";
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
            //GridView1.Font.Size = 14;
            GridView1.Font.Bold = true;
            GridView1.HeaderStyle.Height = 45;
            GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.RowStyle.Height = 40;
            //GridView1.RowStyle.Width = 250;
            //GridView1.Width = 350;
            // GridView1. Height = 200;
            GridView1.DataBind();
            //GridView1.Columns[1]. Visible = false;

        }

        // public TemplateField();  

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session["uId"] = Convert.ToString(intuId);
            Response.Redirect("GaCare_Add.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow != null)
            {
                int id = 0;
                strG = GridView1.SelectedRow.Cells[1].Text; //暫存被刪除的id(string)
                Session["uId"] = Convert.ToString(intuId);
                Session["oId"] = strG;
                Server.Transfer("GaCare_Update.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>alert('請先選取欲修改之資料')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //if (GridView1.SelectedRow != null)
            //{
            int id = 0;
            string strName = "";// GridView1.SelectedRow.Cells[2].Text; //暫存刪除名
            string sql = "";
            List<object> parameters = new List<object>();
            List<object> parameters_value = new List<object>();

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox cbx = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (cbx.Checked == true)
                {
                    strName += GridView1.Rows[i].Cells[3].Text + ".";
                    parameters.Add("@O_id");
                    parameters_value.Add(GridView1.Rows[i].Cells[2].Text);
                }

            }

            if (parameters.Count != 0)
            {
                //刪除
                SqlDataSource sds = new SqlDataSource();
                sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";

                //strG = GridView1.SelectedRow.Cells[1].Text; //暫存被刪除的id(string)
                //id = Int32.Parse(strG);  

                for (int i = 0; i < parameters.Count; i++)
                {
                    sql += "delete Oldman_Data where O_id='" + parameters_value[i] + "' ";
                }
                sds.DeleteCommand = sql;
                sds.Delete();
                //sds.DeleteCommand = "delete Oldman_Data where O_id=" + id;
                //sds. Delete();

                GridView1.Font.Name = "微軟正黑體";
                GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
                GridView1.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
                GridView1.Font.Size = 12;
                GridView1.Width = 300;
                GridView1.Height = 100;
                dbLoad();

                lblMsg.Visible = true;
                lblMsg.Text = "【" + strName + "】資料已刪除";
            }
            else
            {
                Response.Write("<script language=javascript>alert('請先選取欲刪除之資料')</script>");
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.SelectCommand = "select O_id as '編號', O_name as '姓名', O_phone as '電話'" +
               " from Oldman_Data where O_name like @O_name  and U_id =" + intuId;
            sds.SelectParameters.Add("O_name", "%" + tbxSearch.Text + "%");
            GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);
            GridView1.Font.Name = "微軟正黑體";
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
            GridView1.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.Font.Size = 12;
            GridView1.Width = 300;
            GridView1.Height = 100;

            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.SelectCommand = "select O_id as '編號', O_name as '姓名', O_phone as '電話'" +
                " from Oldman_Data where U_id =" + intuId;
            GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.Font.Name = "微軟正黑體";
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
            GridView1.EmptyDataRowStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.Font.Size = 12;
            GridView1.Width = 300;
            // GridView1.Height = 100;

            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int intTmpId = 0; //暫存被選取的id值
            intSelect = GridView1.SelectedIndex;
            intTmpId = Convert.ToInt32(GridView1.Rows[intSelect].Cells[2].Text);
            Session["oId"] = intTmpId;

            Server.Transfer("GaCare_Update.aspx");
        }



    }
}