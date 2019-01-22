using System;
using System. Data;
using System. Web. UI;
using System. Web. UI. WebControls;

namespace WebPro. web. mPurpose_master
{
    public partial class GaCare_Update : System. Web. UI. Page
    {
        int intId = 0; int[] arrayQrid = new int[6]; //qrid亂數
        string uId = "";
        int intuId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            intId = Convert.ToInt32(Session["oId"]); //暫存主頁傳來的id值            
            //intId = 3; //測試用(可刪)
            tbxId.Text = intId.ToString();
            intuId = Convert.ToInt32(Session["uId"]); //暫存主頁傳來的id值  

            if ((intId == 0) && (intuId == 0))
            {
                Server.Transfer("sign_in.aspx");
            }
            else
            {
                btnOK.Attributes["OnClick"] = "return confirm('確定要修改嗎?')";
                dbLoad();
            }


        }

        protected void dbLoad() //load資料
        {
            if (!IsPostBack)
            {
                SqlDataSource sds = new SqlDataSource();
                sds. ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
                sds. SelectCommand = "select O_name, O_birthday, O_phone, O_blood, O_disease, O_address," +
                    " O_qrcode from Oldman_Data where O_id =" + intId;
                DataView dv = sds. Select(DataSourceSelectArguments. Empty) as DataView;
                //讀值代入表格
                //tbxId.Text = intId.ToString();
                tbxName. Text = dv. Table. Rows[0]["O_name"]. ToString();
                tbxBirth. Text = dv. Table. Rows[0]["O_birthday"]. ToString();
                tbxPhone. Text = dv. Table. Rows[0]["O_phone"]. ToString();
                DdBlood. Text = dv. Table. Rows[0]["O_blood"]. ToString();
                tbxDisease. Text = dv. Table. Rows[0]["O_disease"]. ToString();
                tbxAddress. Text = dv. Table. Rows[0]["O_address"]. ToString();
                imgQrcodd. ImageUrl = dv. Table. Rows[0]["O_qrcode"]. ToString();

                lblOld. Text = tbxName. Text;
            }
        }

        protected void btnBack_Click1(object sender, EventArgs e)
        {
            Response. Redirect("GaCare.aspx");
        }

        protected void btnOK_Click1(object sender, EventArgs e)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.UpdateCommand = "Update Oldman_Data set O_name=@O_name, O_birthday=@O_birthday, O_phone=@O_phone," +
                " O_blood=@O_blood, O_disease=@O_disease, O_address=@O_address where O_id =" + intId;
            if (tbxName.Text == null)
                sds.UpdateParameters.Add("O_name", "");
            else
                sds.UpdateParameters.Add("O_name", tbxName.Text);

            if (tbxName.Text == null)
                sds.UpdateParameters.Add("O_name", "");
            else
                sds.UpdateParameters.Add("O_name", tbxPhone.Text);

            if (tbxName.Text == null)
                sds.UpdateParameters.Add("O_name", "");
            else
                sds.UpdateParameters.Add("O_name", DdBlood.SelectedValue);

            if (tbxName.Text == null)
                sds.UpdateParameters.Add("O_name", "");
            else
                sds.UpdateParameters.Add("O_name", tbxDisease.Text);

            if (tbxName.Text == null)
                sds.UpdateParameters.Add("O_name", "");
            else
                sds.UpdateParameters.Add("O_name", tbxAddress.Text);

            //sds.DataBind();

            //lblMsg.Visible = true;
            //lblMsg.Text = "資料修改成功";
        }
        /*
        protected void ibtnGM_Click(object sender, ImageClickEventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("SetGps.aspx");
        }

        protected void ibtnGill_Click(object sender, ImageClickEventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("OldRemind_List.aspx");
        }

        protected void ibtnEvent_Click(object sender, ImageClickEventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("respond_oldV3.aspx");
        }

        protected void ibtnHospital_Click(object sender, ImageClickEventArgs e)
        {
            Session["oId"] = intId;
            //Server.Transfer("respond_oldV3.aspx");
        }
        */
        protected void ibtnGM_Click1(object sender, ImageClickEventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("SetGps.aspx");
        }

        protected void ibtnGill_Click1(object sender, ImageClickEventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("OldRemind_List.aspx");
        }

        protected void ibtnEvent_Click1(object sender, ImageClickEventArgs e)
        {
            Session["oId"] = intId;
            Server.Transfer("respond_oldV3.aspx");
        }

        protected void ibtnHospital_Click1(object sender, ImageClickEventArgs e)
        {
            //Session["oId"] = intId;
            //Server.Transfer("respond_oldV3.aspx");
        }

    }
}