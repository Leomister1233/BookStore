using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static OnlineShoppingBookStore.BookManager;

namespace OnlineShoppingBookStore
{
    public partial class BookStoreManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // bind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bind();
        }
        protected void bind()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            BookManagerInfo manager = new BookManagerInfo();
            manager.BookId = txtId.Text;
            manager.BookName = txtName.Text;
            manager.BookCategory = ddlCategory.Text; 
            manager.BookAuthor = txtAuthor.Text;
            manager.BookPrice = txtPrice.Text;
            manager.BookSummary = txtSummary.Text;
           
            DataTable dt = GetDataSource(manager);
            if (dt.Rows.Count > 0)
            {

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        public DataTable GetDataSource(BookManagerInfo manager)
        {
            //get
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("BookId", typeof(string));
                dt.Columns.Add("BookName", typeof(string));
                dt.Columns.Add("BookCategory", typeof(string));
                dt.Columns.Add("BookAuthor", typeof(string));
                dt.Columns.Add("BookPrice", typeof(string));
                dt.Columns.Add("BookSummary", typeof(string));
                //调用服务获取用户信息   
                ServiceReference1.BookStoreWebServiceSoapClient ws1 = new ServiceReference1.BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
                string[] Booklist = ws1.GetBookInfoByCondition(manager.BookId,manager.BookName,manager.BookCategory,manager.BookAuthor,manager.BookPrice,manager.BookSummary);
                for (int i = 0; i < Booklist.Length; i += 6)
                {
                    dt.Rows.Add(Booklist[i], Booklist[i + 1], Booklist[i + 2], Booklist[i + 3], Booklist[i + 4], Booklist[i+5]);

                }
                return dt;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (btnAdd.Text == "添加新书")
            {
                GridView1.ShowFooter = true;
                GridView1.PageIndex = GridView1.PageCount;
                bind();
                btnAdd.Text = "取消添加";
                DropDownList ddlCategory2 = GridView1.FooterRow.FindControl("ddlCategory2") as DropDownList;
                ddlCategory2.Items.Clear();
                ddlCategory2.Items.Add("Adventure stories");
                ddlCategory2.Items.Add("Classics");
                ddlCategory2.Items.Add("Crime");
                ddlCategory2.Items.Add("Fairy Tales");
                ddlCategory2.Items.Add("Fantasy");
                ddlCategory2.Items.Add("Historical fiction");
                ddlCategory2.Items.Add("Horror");
                ddlCategory2.Items.Add("Humour");
                ddlCategory2.Items.Add("Educational");
                ddlCategory2.SelectedIndex = 0;
            }
            else
            {
                btnAdd.Text = "添加新书";
                GridView1.ShowFooter = false;
                bind();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    Image imgPhoto = e.Row.FindControl("imgPhoto") as Image;
                    Label labNo = e.Row.FindControl("labId") as Label;
                    string BookId = labNo.Text.Trim();
                    string url = "Showimage.aspx?BookId=" + BookId;
                    imgPhoto.ImageUrl = url;
                    string str = "javascript:return confirm('你确认要删除" + BookId + "记录吗?')";
                    e.Row.Cells[7].Attributes.Add("onclick", str);
                }
                //先设置当鼠标上去的时候他的背景色改变
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#CCCCFF'");
                //再设置当鼠标离开后背景色再还原
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label labNo = GridView1.Rows[e.RowIndex].FindControl("labId") as Label;
            string BookId = labNo.Text;
            ServiceReference1.BookStoreWebServiceSoapClient ws1 = new ServiceReference1.BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            if (ws1.DeleteBookInfoById(BookId))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('删除成功！');", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('删除失败！');", true);

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Label labName = GridView1.Rows[e.NewEditIndex].FindControl("labName") as Label;
            Label labCategory = GridView1.Rows[e.NewEditIndex].FindControl("labCategory") as Label;
            Label labAuthor = GridView1.Rows[e.NewEditIndex].FindControl("labAuthor") as Label;
            Label labPrice = GridView1.Rows[e.NewEditIndex].FindControl("labPrice") as Label;
            Label labSummary = GridView1.Rows[e.NewEditIndex].FindControl("labSummary") as Label;
            GridView1.EditIndex = e.NewEditIndex;
            labRowIndex1.Text = e.NewEditIndex.ToString();
            bind();      
            DropDownList ddlCategory1 = GridView1.Rows[e.NewEditIndex].FindControl("ddlCategory") as DropDownList;
            ddlCategory1.Items.Clear();
            ddlCategory1.Items.Add("Adventure stories");
            ddlCategory1.Items.Add("Classics");
            ddlCategory1.Items.Add("Crime");
            ddlCategory1.Items.Add("Fairy Tales");
            ddlCategory1.Items.Add("Fantasy");
            ddlCategory1.Items.Add("Historical fiction");
            ddlCategory1.Items.Add("Horror");
            ddlCategory1.Items.Add("Humour");
            ddlCategory1.Items.Add("Educational");
            ddlCategory1.Text = labCategory.Text;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //获取所有修改值
            TextBox txtId1 = GridView1.Rows[e.RowIndex].FindControl("txtId") as TextBox;
            TextBox txtName1 = GridView1.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            DropDownList ddlCategory1 = GridView1.Rows[e.RowIndex].FindControl("ddlCategory") as DropDownList;
            TextBox txtAuthor1 = GridView1.Rows[e.RowIndex].FindControl("txtAuthor") as TextBox;
            TextBox txtPrice1 = GridView1.Rows[e.RowIndex].FindControl("txtPrice") as TextBox;
            TextBox txtSummary = GridView1.Rows[e.RowIndex].FindControl("txtSummary") as TextBox;
            FileUpload UploadPhoto1 = GridView1.Rows[e.RowIndex].FindControl("UploadPhoto1") as FileUpload;

            BookManagerInfo manager = new BookManagerInfo();
            manager.BookId = txtId1.Text;
            manager.BookName = txtName1.Text;
            manager.BookCategory = ddlCategory1.Text;
            manager.BookAuthor = txtAuthor1.Text;
            manager.BookPrice = txtPrice1.Text;
            manager.BookSummary=txtSummary.Text;
            manager.BookImage = Convert.ToBase64String(UploadPhoto1.FileBytes);//将图片字节转换成图片字符串;
            ServiceReference1.BookStoreWebServiceSoapClient ws1 = new ServiceReference1.BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            if (ws1.UpdateBookInfoById(manager.BookId, manager.BookName, manager.BookCategory, manager.BookAuthor ,manager.BookPrice,manager.BookSummary, manager.BookImage))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('修改成功！');", true);
                GridView1.EditIndex = -1;
                bind();
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('修改失败！');", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //获取所有修改值
            TextBox txtId2 = GridView1.FooterRow.FindControl("txtId") as TextBox;
            TextBox txtName2 = GridView1.FooterRow.FindControl("txtName") as TextBox;
            DropDownList ddlCategory2 = GridView1.FooterRow.FindControl("ddlCategory2") as DropDownList;
            TextBox txtAuthor2 = GridView1.FooterRow.FindControl("txtAuthor") as TextBox;
            TextBox txtPrice2 = GridView1.FooterRow.FindControl("txtPrice") as TextBox;
            TextBox txtSummary=GridView1.FooterRow.FindControl("txtSummary") as TextBox;
            FileUpload UploadPhoto2 = GridView1.FooterRow.FindControl("UploadPhoto2") as FileUpload;
            BookManagerInfo manager = new BookManagerInfo();
            manager.BookId = txtId2.Text;
            manager.BookName = txtName2.Text;
            manager.BookCategory = ddlCategory2.Text;
            manager.BookAuthor = txtAuthor2.Text;
            manager.BookPrice= txtPrice2.Text;
            manager.BookSummary = txtSummary.Text;
            manager.BookImage = "";
            if (UploadPhoto2.HasFile)
                manager.BookImage = Convert.ToBase64String(UploadPhoto2.FileBytes);
            ServiceReference1.BookStoreWebServiceSoapClient ws1 = new ServiceReference1.BookStoreWebServiceSoapClient("BookStoreWebServiceSoap");
            if (ws1.InsertBookInfoById(manager.BookId, manager.BookName, manager.BookCategory, manager.BookAuthor, manager.BookPrice,manager.BookSummary, manager.BookImage))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('保存成功！');", true);
                bind();
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('保存失败！');", true);
        }
    }
}