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
    public partial class hintadd : System.Web.UI.Page
    {
        String connstr = ConfigurationManager.ConnectionStrings["Guardian_Angel"].ConnectionString;
        String strG = "";
        string uId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            dbLoad();
            uId = Session["Uid"].ToString();
        }
        protected void dbLoad() //load資料
        {


            uId = Session["Uid"].ToString();
            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(connstr);
                string strsql = "SELECT * FROM Oldman_Data WHERE U_id = "+ uId ;

                SqlDataAdapter da = new SqlDataAdapter(strsql, connstr);
                DataSet ds = new DataSet();
                da.Fill(ds, "test");

                DropDownList1.DataTextField = "O_name";
                DropDownList1.DataValueField = "O_id";

                DropDownList1.DataSource = ds.Tables["test"].DefaultView;
                DropDownList1.DataBind();

                TextBox2.Attributes.Add("onFocus", "this.value=''");//一點擊TextBox1後，裡面的字馬上被清空
            }



        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                SqlConnection con = new SqlConnection(connstr);
                //儲存影像  into 資料庫
                string str = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "//img//" + str);
                //string path = "~//Uploads//" + str.ToString();
                string path = str.ToString();
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Message values ('" + path + "','" + TextBox2.Text + "','" + Calendar1.SelectedDate.ToShortDateString() + "','" + DropDownList1.SelectedValue + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Image Uploaded Successfully";






            }
            else
            {
                Label1.Text = "請選擇上傳的圖片";
            }
        }
        protected void btnhint_Click(object sender, EventArgs e)
        {
            Response.Redirect("hint.aspx");
        }
    }
}