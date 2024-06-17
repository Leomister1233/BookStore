using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoppingBookStore
{
    public partial class BookStore1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"].ToString() == "")
                {
                    Session["username"] = "";
                    Session["password"] = "";
                    Response.Redirect("Login.aspx");
                }
                labName.Text = Session["Username"].ToString() + "，您好！";

            }
        }


        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["password"] = "";
            Response.Redirect("Login.aspx");
        }
    }
}