using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.web.mPurpose_master
{
    public partial class OldRemind_List : System.Web.UI.Page
    {
        int oid;

        protected void Page_Load(object sender, EventArgs e)
        {
            oid = Convert.ToInt32(Session["oId"]);
            SqlDataSource1.SelectCommand = "select * from [dbo].[Notice] where [O_id]="+ oid ;
            btnDelete.Attributes["OnClick"] = "return confirm('再一次確認,你確定要刪除這些資料嗎?')";
            btnDelete.Enabled = false;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                Label myID = (Label)GridView1.Rows[i].FindControl("Label1");
                myID.Visible = false;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string myMessage = null;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                Label myID = (Label)GridView1.Rows[i].FindControl("Label1");
                if (myCheckBox.Checked == true)
                    myMessage = myMessage + myID.Text + "or[N_id]=";
            }
            int index = myMessage.LastIndexOf("or[N_id]=");
            if (index > 0)
                myMessage = myMessage.Substring(0, index);
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.DeleteCommand = "delete NPGrouping where [N_id]=" + myMessage + ";" + "delete Notice where [N_id]=" + myMessage;
            sds.Delete();
            Response.Redirect(Request.Url.ToString()); //畫面重整:按下刪除鈕後,導向一開始的畫面
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("OldRemind_Add.aspx");
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            int count = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (myCheckBox.Checked == true) count++;
            }
            if (count > 0) btnDelete.Enabled = true;
            else btnDelete.Enabled = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("GaCare.aspx");
        }

        protected void btnBack_Click1(object sender, EventArgs e)
        {
            Response.Redirect("GaCare.aspx");
        }
    }
}