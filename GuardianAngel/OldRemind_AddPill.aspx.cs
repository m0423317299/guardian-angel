using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.web.mPurpose_master
{
    public partial class OldRemind_AddPill : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            btnOK.Attributes["OnClick"] = "return confirm('你確定要新增這些資料嗎?')";
            btnOK.Enabled = false;
            lblMessage.Visible = false;
            GridView2.AllowPaging = false;
            DetailsView1.Visible = false;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                Label pid = (Label)GridView2.Rows[i].FindControl("Label1");
                for (int j = 0; j < GridView3.Rows.Count; j++)
                {
                    if (pid.Text.Equals(GridView3.Rows[j].Cells[0].Text))
                    {
                        GridView2.Rows[i].Visible = false;
                    }
                }
            }
            GridView3.Visible = false;
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string myMessage = null;
            string nid=DetailsView1.Rows[0].Cells[1].Text;  

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                Label pid = (Label)GridView2.Rows[i].FindControl("Label1");
                DropDownList quantity  = (DropDownList)GridView2.Rows[i].FindControl("dropDownList1");
                if (myCheckBox.Checked == true)
                {
                    myMessage = myMessage + "(" + pid.Text + "," + nid + "," + quantity.SelectedValue + ")"+",";
                }
            }
            myMessage = myMessage.TrimEnd(',');
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.InsertCommand = "insert [dbo].[NPGrouping]([P_id],[N_id],[P_number]) values" + myMessage;
            sds.Insert();
            Response.Redirect("OldRemind_View.aspx?nid="+ nid);
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            int count = 0;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                if (myCheckBox.Checked == true) count++;
            }
            if (count > 0) btnOK.Enabled = true;
            else btnOK.Enabled = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int count = 0;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                if (GridView2.Rows[i].Cells[1].Text.Contains(tbxSearch.Text))
                {
                    GridView2.Rows[i].Visible = true;
                    count++;                       
                }
                else
                {
                    GridView2.Rows[i].Visible = false;
                }
            }

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                Label pid = (Label)GridView2.Rows[i].FindControl("Label1");
                for (int j = 0; j < GridView3.Rows.Count; j++)
                {
                    if (pid.Text.Equals(GridView3.Rows[j].Cells[0].Text))
                    {
                        GridView2.Rows[i].Visible = false;
                    }
                }
            }

            if (count == 0)
            {
                lblMessage.Visible = true;
                GridView2.Visible = false;
                lblMessage.Text = "沒有符合條件的資料!";
            }
            else
            {
                lblMessage.Visible = false;
                GridView2.Visible = true;
            }
        }
    }
}