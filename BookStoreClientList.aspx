<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="BookStoreClientList.aspx.cs" Inherits="OnlineShoppingBookStore.BookStoreClientList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 874px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="animate.min.css" rel="stylesheet" /> 
    <div class="auto-style31" style="align-content:center">
    <div class="container" style="margin:0px auto 88px auto; width:800px;">
     <div class="inner animated fadeInDown"> 
    <div class="auto-style31" style="align-content:center">
         <div>

             <table class="auto-style5" style="background-color:bisque; margin-left: auto; margin-right: auto; margin-top: 0px;" >
                 <tr>
                     <td class="auto-style32">User Name&nbsp; :
                         <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                     </td>
                     <td class="auto-style33">
                         Phone:&nbsp;&nbsp;&nbsp;
                         <asp:TextBox ID="txtPhone" runat="server" Width="117px"></asp:TextBox>
                     </td>
                     <td class="auto-style34">Gender:&nbsp;
                         <asp:DropDownList ID="ddlGender" runat="server">
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
                     <td class="auto-style29">&nbsp;
                         <asp:TextBox ID="txtPassword" runat="server" Visible="False"></asp:TextBox>
                     </td>
                     <td class="auto-style30">&nbsp;Email :
                         <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                     </td>
                     <td>
                         Address:<asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                     </td>
                 </tr>
             </table>

         </div>
       <div class="auto-style36">
         <asp:GridView ID="GridView1" runat="server" style="background-color:aliceblue; margin-left: auto; margin-right: auto; margin-top: 0px;" CellPadding="4" ForeColor="Black" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" Width="876px" Height="16px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" CssClass="auto-style35">
                     <AlternatingRowStyle BackColor="#CCFFCC" BorderColor="#FFCC99" />
                     <Columns>
                         <asp:TemplateField HeaderText="Username">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtUsername" runat="server" Text='<%# Bind("username") %>' ></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="labUsername" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Password">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtPassWord" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="labPassWord" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Phone">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="labPhone" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Gender">
                             <EditItemTemplate>
                                 <asp:DropDownList ID="ddlGender" runat="server">
                                 </asp:DropDownList>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="labGender" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Email">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="labEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Address">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="labAddress" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        <asp:TemplateField HeaderText="编辑" ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
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
        </div>
        </div>
</asp:Content>
