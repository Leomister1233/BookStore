using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static OnlineShoppingBookStore.BookManager;
using static OnlineShoppingBookStore.BookStore;

namespace OnlineShoppingBookStore
{
    public partial class BookStoreClientList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bind();
        }
        protected void bind()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            BookStore user = new BookStore();
            user.UserName = txtUsername.Text;
            user.PassWord = txtPassword.Text;
            user.Phone = txtPhone.Text;
            user.Gender = ddlGender.Text;
            user.Email = txtEmail.Text;
            user.Address=txtAddress.Text;
            DataTable dt = GetDataSource(user);
            if (dt.Rows.Count > 0)
            {

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        public DataTable GetDataSource(BookStore user)
        {
            //get
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("username", typeof(string));
                dt.Columns.Add("password", typeof(string));
                dt.Columns.Add("phone", typeof(string));
                dt.Columns.Add("gender", typeof(string));
                dt.Columns.Add("email", typeof(string));
                dt.Columns.Add("address", typeof(string));
                //调用服务获取用户信息   
                ServiceReference1.BookStoreWebServiceSoapClient ws1 = new ServiceReference1.BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
                string[] Booklist = ws1.GetUserInfoByCondition(user.UserName, user.PassWord, user.Phone, user.Gender, user.Email, user.Address);
                for (int i = 0; i < Booklist.Length; i += 6)
                {
                    dt.Rows.Add(Booklist[i], Booklist[i + 1], Booklist[i + 2], Booklist[i + 3], Booklist[i + 4], Booklist[i+5]);

                }
                return dt;
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    //Image imgPhoto = e.Row.FindControl("imgPhoto") as Image;
                    Label labUsername = e.Row.FindControl("labUsername") as Label;
                    string username = labUsername.Text.Trim();
                    //string url = "Showimage.aspx?BookId=" + BookId;
                    //imgPhoto.ImageUrl = url;
                    string str = "javascript:return confirm('你确认要删除学号" + username + "记录吗?')";
                    e.Row.Cells[6].Attributes.Add("onclick", str);
                }
                //先设置当鼠标上去的时候他的背景色改变
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#CCCCFF'");
                //再设置当鼠标离开后背景色再还原
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label labName = GridView1.Rows[e.RowIndex].FindControl("labUsername") as Label;
            string Username = labName.Text;
            ServiceReference1.BookStoreWebServiceSoapClient ws1 = new ServiceReference1.BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            ServiceReference1.BookStoreWebServiceSoapClient ws2 = new ServiceReference1.BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            ServiceReference1.BookStoreWebServiceSoapClient ws3 = new ServiceReference1.BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            if (ws2.DeleteBookCartInfoById(Username) && ws3.DeleteProfilePhotoByUsername(Username)) { 
                if (ws1.DeleteUserInfo(Username))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('删除成功！');", true);
                }
                else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('删除失败！');", true);
            }
                
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Label labName = GridView1.Rows[e.NewEditIndex].FindControl("labUsername") as Label;
            Label labPassWord = GridView1.Rows[e.NewEditIndex].FindControl("labPassWord") as Label;
            Label labPhone = GridView1.Rows[e.NewEditIndex].FindControl("labPhone") as Label;
            Label labGender = GridView1.Rows[e.NewEditIndex].FindControl("labGender") as Label;
            Label labEmail = GridView1.Rows[e.NewEditIndex].FindControl("labEmail") as Label;
            Label labAddress = GridView1.Rows[e.NewEditIndex].FindControl("labAddress") as Label;
            GridView1.EditIndex = e.NewEditIndex;
            labRowIndex1.Text = e.NewEditIndex.ToString();
            bind();
            DropDownList ddlGender = GridView1.Rows[e.NewEditIndex].FindControl("ddlGender") as DropDownList;
            ddlGender.Items.Clear();
            ddlGender.Items.Add("Male");
            ddlGender.Items.Add("Female");
            ddlGender.Text = labGender.Text;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtusername1 = GridView1.Rows[e.RowIndex].FindControl("txtUsername") as TextBox;
            TextBox txtPassWord = GridView1.Rows[e.RowIndex].FindControl("txtPassWord") as TextBox;
            TextBox txtPhone = GridView1.Rows[e.RowIndex].FindControl("txtPhone") as TextBox;
            DropDownList ddlGender = GridView1.Rows[e.RowIndex].FindControl("ddlGender") as DropDownList;
            TextBox txtEmail = GridView1.Rows[e.RowIndex].FindControl("txtEmail") as TextBox;
            TextBox txtAddress = GridView1.Rows[e.RowIndex].FindControl("txtAddress") as TextBox;
            //FileUpload UploadPhoto1 = GridView1.Rows[e.RowIndex].FindControl("UploadPhoto1") as FileUpload;
            BookStoreInfo user = new BookStoreInfo();
            user.username = txtusername1.Text;
            user.password = txtPassWord.Text;
            user.phone = txtPhone.Text;
            user.gender = ddlGender.Text;
            user.email=txtEmail.Text;
            user.address=txtAddress.Text;
            ServiceReference1.BookStoreWebServiceSoapClient ws1 = new ServiceReference1.BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            if (ws1.UpdateUserInfoByUsername(user.username,user.password,user.phone,user.gender,user.email,user.address))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('修改成功！');", true);
                GridView1.EditIndex = -1;
                bind();
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('修改失败！');", true);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bind();
        }
    }
}