<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreClient.Master" AutoEventWireup="true" CodeBehind="BookStoreClientInfo.aspx.cs" Inherits="OnlineShoppingBookStore.BookStoreClientInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="animate.min.css" rel="stylesheet" /> 
    <div class="auto-style31" style="align-content:center">
    <div class="container" style="margin:0px auto 88px auto; width:800px;">
     <div class="inner animated fadeInDown"> 
    <table style="margin:0px auto 88px auto; width:800px;background:border-box; background-color:transparent">
        <tr>
            <td class="auto-style1" style="text-align:right;" aria-atomic="True" aria-autocomplete="list" aria-dropeffect="none">
                &nbsp;</td>
            <td class="auto-style7">
            &nbsp
                <asp:HyperLink ID="HyperLink4" runat="server" ForeColor="White" NavigateUrl="~/InsertProfilePhoto.aspx">Update User Photo</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align:right;" aria-atomic="True" aria-autocomplete="list" aria-dropeffect="none">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="用户：" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
            &nbsp
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="请输入用户" ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align:right">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Text="密码：" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" Width="122px"></asp:TextBox>
            &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassWord" ErrorMessage="请输入密码" ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align:right">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Larger" Text="确认密码：" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="txtConPass" runat="server" TextMode="Password"></asp:TextBox>
            &nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassWord" ControlToValidate="txtConPass" ErrorMessage="请输入确认密码" ForeColor="White"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align:right">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Larger" Text="电话：" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="请输入电话号码" ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align:right">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Larger" Text="性别：" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:RadioButtonList ID="RadioGender" runat="server" RepeatDirection="Horizontal" Height="18px" Width="174px" ForeColor="White">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RadioGender" ErrorMessage="请选性别" ForeColor="White"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align:right">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Larger" Text="邮件:" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="请输入邮件" ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td class="auto-style1" style="text-align:right">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Larger" Text="地址：" ForeColor="White"></asp:Label>
             </td>
            <td class="auto-style7">
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
             &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="请输入地址" ForeColor="White"></asp:RequiredFieldValidator>
             </td>
        </tr>
         <tr>
            <td class="auto-style1" style="text-align:right">&nbsp;</td>
            <td class="auto-style7">
                <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Update" />
&nbsp;&nbsp;
                <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="取消" />
&nbsp;&nbsp;
                </td>
        </tr>
    </table>
         </div>
        </div>
        </div>
</asp:Content>
