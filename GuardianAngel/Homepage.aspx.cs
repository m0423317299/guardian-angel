using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class IndexNew : System.Web.UI.Page
    {
        string initUid = ""; //字串 初始id
        string fname = "";
        string lname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Uid"] == null)
            {
                Server.Transfer("Login.aspx");
            }
            else
            {
                initUid = Session["Uid"].ToString();          
                if (!IsPostBack) //第一次呈現網頁
                {
                    if (Session["sign_in_succes"] != null) {                
                        firstLoad();
                        Session["sign_in_succes"] = null ;
                    }                   
                }
            }
        }

        protected void firstLoad() {

            Response.Write("<Script language='JavaScript'>alert('登入成功！');</Script>");
        }


    }
}