<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="BookStoreManager.aspx.cs" Inherits="OnlineShoppingBookStore.BookStoreManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style28 {
            width: 926px;
            margin-bottom: 0px;
        }
        .auto-style30 {
            width: 283px;
        }
        .auto-style31 {
            width: 1557px;
            height: 877px;
        }
        .auto-style33 {
            width: 283px;
            height: 21px;
        }
        .auto-style34 {
            height: 21px;
        }
        .auto-style35 {
            margin-bottom: 0px;
        }
        .auto-style36 {
            width: 310px;
            height: 21px;
        }
        .auto-style37 {
            width: 310px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <link href="animate.min.css" rel="stylesheet" /> 
    <div class="auto-style31" style="align-content:center">
    <div class="container" style="margin:0px auto 88px auto; width:800px;">
     <div class="inner animated fadeInDown"> 
  
         <div>

             <table class="auto-style28" style="background-color:bisque; margin-left: auto; margin-right: auto; margin-top: 0px;" >
                 <tr>
                     <td class="auto-style36">Book Name&nbsp; :
                         <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                     </td>
                     <td class="auto-style33">
                         BookId :&nbsp;&nbsp;&nbsp;
                         <asp:TextBox ID="txtId" runat="server" Width="117px"></asp:TextBox>
                     </td>
                     <td class="auto-style34">Category:&nbsp;
                         <asp:DropDownList ID="ddlCategory" runat="server">
                             <asp:ListItem></asp:ListItem>
                             <asp:ListItem>Adventure stories</asp:ListItem>
                             <asp:ListItem>Classics</asp:ListItem>
                             <asp:ListItem>Crime</asp:ListItem>
                             <asp:ListItem>Fairy tales</asp:ListItem>
                             <asp:ListItem>Fantasy</asp:ListItem>
                             <asp:ListItem>Historical fiction</asp:ListItem>
                             <asp:ListItem>Horror</asp:ListItem>
                             <asp:ListItem>Humour</asp:ListItem>
                         </asp:DropDownList>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style37">Book Author:&nbsp;
                         <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
                     </td>
                     <td class="auto-style30">&nbsp;Book Price :
                         <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                     </td>
                     <td>
                         &nbsp;
                         <asp:TextBox ID="txtSummary" runat="server" Visible="False" Width="74px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btnAdd" runat="server" Text="添加新书" OnClick="btnAdd_Click" />
                     &nbsp;&nbsp;&nbsp;
                     </td>
                 </tr>
             </table>

         </div>
        
         <asp:GridView ID="GridView1" runat="server" style="background-color:aliceblue; margin-left: auto; margin-right: auto; margin-top: 0px;" CellPadding="4" ForeColor="Black" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" Width="927px" Height="16px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" CssClass="auto-style35" PageSize="20" BackColor="#CCFF99" BorderColor="#FFCC66" BorderStyle="Inset">
                     <AlternatingRowStyle BackColor="#FFCC99" BorderColor="#FFCC99" BorderStyle="Inset" />
                     <Columns>
                         <asp:TemplateField HeaderText="Id">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtId" runat="server" Text='<%# Bind("BookId") %>' ></asp:TextBox>
                             </EditItemTemplate>
                             <FooterTemplate>
                                 <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                             </FooterTemplate>
                             <ItemTemplate>
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="labId" runat="server" Text='<%# Bind("BookId") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Name">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <FooterTemplate>
                                 <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                             </FooterTemplate>
                             <ItemTemplate>
                                 &nbsp;&nbsp;
                                 <asp:Label ID="labName" runat="server" Text='<%# Bind("BookName") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Category">
                             <EditItemTemplate>
                                 <asp:DropDownList ID="ddlCategory" runat="server">
                                 </asp:DropDownList>
                             </EditItemTemplate>
                             <FooterTemplate>
                                 <asp:DropDownList ID="ddlCategory2" runat="server">
                                 </asp:DropDownList>
                             </FooterTemplate>
                             <ItemTemplate>
                                 &nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="labCategory" runat="server" Text='<%# Bind("BookCategory") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Author">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtAuthor" runat="server" Text='<%# Bind("BookAuthor") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <FooterTemplate>
                                 <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
                             </FooterTemplate>
                             <ItemTemplate>
                                 &nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="labAuthor" runat="server" Text='<%# Bind("BookAuthor") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Price">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("BookPrice") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <FooterTemplate>
                                 <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                             </FooterTemplate>
                             <ItemTemplate>
                                 &nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="labPrice" runat="server" Text='<%# Bind("BookPrice") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Detailed">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtSummary" runat="server" Text='<%# Bind("BookSummary") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <FooterTemplate>
                                 <asp:TextBox ID="txtSummary" runat="server"></asp:TextBox>
                             </FooterTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="labSummary" runat="server" Text='<%# Bind("BookSummary") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="照片">
                             <EditItemTemplate>
                                 <asp:FileUpload ID="UploadPhoto1" runat="server" />
                             </EditItemTemplate>
                             <FooterTemplate>
                                 <asp:FileUpload ID="UploadPhoto2" runat="server" />
                             </FooterTemplate>
                             <ItemTemplate>
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Image ID="imgPhoto" runat="server" Height="102px" Width="93px" />
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        <asp:TemplateField HeaderText="编辑" ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保存" />
                </FooterTemplate>
                <ItemTemplate>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
                     </Columns>
                     <FooterStyle BackColor="#FFCC99" BorderColor="#FFCC99" HorizontalAlign="Center" VerticalAlign="Middle" />
                     <HeaderStyle BackColor="#FFCC99" HorizontalAlign="Center" VerticalAlign="Middle" />
                     <PagerStyle BackColor="#FFCC99" BorderColor="#FF9999" BorderStyle="Double" HorizontalAlign="Center" VerticalAlign="Middle" />
                 </asp:GridView>
           <asp:Label ID="labRowIndex1" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
            </div>
         </div>
</asp:Content>
