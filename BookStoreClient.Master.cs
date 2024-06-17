using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineShoppingBookStore.ServiceReference1;
using static OnlineShoppingBookStore.Profile;


namespace OnlineShoppingBookStore
{
    public partial class BookStoreClient : System.Web.UI.MasterPage
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
                labName.Text = Session["username"].ToString() + "，您好！";
            }
            string username = Session["username"].ToString();
            ServiceReference1.BookStoreWebServiceSoapClient ws1 = new BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            string[] photolist = ws1.GetProfilePhotobyUsername(username);
            if (photolist != null)
            {
                string url = "ShowProfilePhoto.aspx?username=" + username;
                if (url!= null)
                {
                  imgPhoto.ImageUrl = url;
                }
            }
            else
            {
                imgPhoto.ImageUrl = "/backgrounds/loginimg.png";
            }
        }

       
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["password"] = "";
            Response.Redirect("Login.aspx");
        }

        protected void imgPhoto_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("InsertProfilePhoto.aspx");
        }
    }
}