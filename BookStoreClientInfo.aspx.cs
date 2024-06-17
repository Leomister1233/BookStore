using OnlineShoppingBookStore.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static OnlineShoppingBookStore.BookStore;
using static OnlineShoppingBookStore.Profile;

namespace OnlineShoppingBookStore
{
    public partial class BookStoreClientInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            BookStoreInfo book = new BookStoreInfo();
            book.username = txtUser.Text;
            book.password = txtPassWord.Text;
            book.phone = txtPhone.Text;
            book.gender = RadioGender.Text;
            book.email = txtEmail.Text;
            book.address = txtAddress.Text;
            ServiceReference1.BookStoreWebServiceSoapClient ws1 = new BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            ServiceReference1.BookStoreWebServiceSoapClient ws2 = new BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            if (ws1.UpdateUserInfoByUsername(book.username, book.password, book.phone, book.gender, book.email, book.address))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('保存成功！');", true);
                txtUser.Text = "";
                txtPassWord.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
                txtAddress.Text = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('保存失败！');", true);
            }
                

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUser.Text = "";
            txtPassWord.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
        }
    }
}