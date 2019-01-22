using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.GA.less
{
    public partial class OldRemind_View : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                dbLoad();
            }
            btnDelete.Attributes["OnClick"] = "return confirm('再一次確認,你確定要刪除這些資料嗎?')";
            btnDelete.Enabled = false;
            DetailsView1.Rows[0].Visible = false;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                Label myID = (Label)GridView1.Rows[i].FindControl("Label1");
                myID.Visible = false;
            }
                

        }
        protected void dbLoad() //load資料
        {
            //SqlConnection con = new SqlConnection(scsb.ToString()); //資料庫連線
            //con.Open(); //開啟資料庫
            //string strSQL = "select * from StudentInformation";
            //SqlCommand cmd = new SqlCommand(strSQL, con); //SqlCommand(SQL語法,連線物件):執行sql命令
            //SqlDataReader reader = cmd.ExecuteReader();

            SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True");
            //sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            con.Open();
            string strSQL = "select T_hour,T_minute from [dbo].[Time] where [N_id]=" + DetailsView1.Rows[0].Cells[1].Text;
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataReader reader = cmd.ExecuteReader();
            string strMsg = "";
            while (reader.Read() == true)  //Read()代表讀資料,有讀到資料則會回傳true,執行到讀不到資料為止
            {
                strMsg += string.Format("{0}:{1}\n\n", reader["T_hour"], reader["T_minute"]);
            }
            DetailsView1.Rows[2].Cells[1].Text = strMsg;
            reader.Close();
            con.Close();

            //sds.SelectCommand = "select T_hour+':'+T_minute from [dbo].[Time] where [N_id]="+ DetailsView1.Rows[0].Cells[1].Text;

            //DetailsView1.Rows[2].Cells[1].DataBind();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string myMessage = null;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                Label myID = (Label)GridView1.Rows[i].FindControl("Label1");
                if (myCheckBox.Checked == true)
                    myMessage = myMessage + myID.Text + "or[P_id]=";
            }
            int index = myMessage.LastIndexOf("or[P_id]=");
            if (index > 0)
                myMessage = myMessage.Substring(0, index);
            //lblMsg.Text += myMessage;
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.DeleteCommand = "delete NPGrouping where [N_id]=" + DetailsView1.Rows[0].Cells[1].Text + "and ([P_id]=" + myMessage+")";
            sds.Delete();
            Response.Redirect(Request.Url.ToString());
        }

        
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            int count = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (myCheckBox.Checked == true)  count++;
            }
            if(count>0) btnDelete.Enabled = true;
            else btnDelete.Enabled = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("OldRemind_List.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("OldRemind_AddPill.aspx?nid=" + DetailsView1.Rows[0].Cells[1].Text);
        }
    }
}