using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.web.mPurpose_master
{
    public partial class GaCare_Add : System.Web.UI.Page
    {
        String strQR = ""; //暫存qrcode
        int[] arrayQrid = new int[6]; //qrid亂數
        string uId = "";
        int intuId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //uId = Session["uId"].ToString();
            intuId = Convert.ToInt32(Session["uId"]); //暫存主頁傳來的id值 

            if (intuId == 0)
            {
                Server.Transfer("sign_in.aspx");
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {

            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True";
            sds.InsertCommand = getInsertSql();
            sds.Insert();

            //新增成功通知
            //btnOK.Attributes["OnClick"] = "return confirm('資料新增成功！')";
            Response.Write("<script language=javascript>alert('資料新增成功！');</script>");
            //lblMsg.Visible = true;
            //lblMsg.Text = "被照顧者【" + tbxName.Text + "】資料新增成功！";
            //btnOK.Enabled = false;

            //跳出訊息告知新增成功
            //Response.Write("<script language=javascript>alert('資料新增成功！將返回資料頁')</script>");
            //Response.Redirect("GaCare.aspx");


            btnOK.Visible = false;
            btnNext.Visible = true;
        }

        private string getInsertSql()
        { //新增欄位讀取
            string strSql = "";

            //亂數取qrid
            String strRan = ""; //暫存亂數
            Random ran = new Random();
            for (int i = 0; i < 6; i++)
            {
                arrayQrid[i] = ran.Next(10);
                strRan += arrayQrid[i];
            }

            strSql += "Insert into Oldman_Data(O_name, O_birthday, O_phone,O_blood, O_disease, " +
                 "O_address, Ｏ_qrid, O_qrcode, U_id) values(";
            strSql += "'" + tbxName.Text + "',";
            strSql += "'" + tbxBirth.Text + "',";
            strSql += "'" + tbxPhone.Text + "',";
            strSql += "'" + DdBlood.Text + "',";
            strSql += "'" + tbxDisease.Text + "',";
            strSql += "'" + tbxAddress.Text + "',";
            strSql += "'" + strRan + "',";
            strSql += "'https://chart.googleapis.com/chart?chs=120x120&cht=qr&chl='+'"
                + strRan + "'+'&choe=UTF-8&chld=M|2', ";
            strSql += intuId + ")";

            strQR = "https://chart.googleapis.com/chart?chs=120x120&cht=qr&chl="
                   + strRan + "&choe=UTF-8&chld=M|2";
            imgQrcodd.ImageUrl = strQR;
            return (strSql);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ini();
            return;
        }

        protected void ini()
        {
            tbxName.Text = "";
            tbxBirth.Text = "";
            tbxPhone.Text = "";
            tbxDisease.Text = "";
            DdBlood.Text = "";
            tbxAddress.Text = "";
            imgQrcodd.ImageUrl = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("GaCare.aspx");
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            btnOK.Visible=true;
            btnNext.Visible = false;
            ini();
        }
    }
}