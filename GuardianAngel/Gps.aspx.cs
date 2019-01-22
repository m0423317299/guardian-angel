using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class maptest : System.Web.UI.Page
    {
        string initUid = "1"; //字串 初始id Session用
        string initOid = "1"; //字串 初始守護對象id Session用

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uid"] == null)
            {
                Server.Transfer("sign_in.aspx");

                if (Session["Oid"] == null)
                {
                    Server.Transfer("GaCare_Update.aspx");
                }
            }
            else
            {
                initUid = Session["Uid"].ToString();
                initOid = Session["Oid"].ToString();
            }
        }

        protected void sqlLoad()
        {
            SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True");
            string sqlUser = "select U_id,U_lname, U_fname, U_password, U_account, U_Phone,U_address " +
                            "from User_Data where U_id =" + initUid;  //sds.指令設定
            string sqlOld = "select O_name " + "from Oldman_Data where O_id =" + initOid;
        }
    }
}