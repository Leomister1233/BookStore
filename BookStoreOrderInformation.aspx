<%@ Page Title="" Language="C#" MasterPageFile="~/BookStoreClient.Master" AutoEventWireup="true" CodeBehind="BookStoreOrderInformation.aspx.cs" Inherits="OnlineShoppingBookStore.BookStoreOrderInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
       .auto-style6 {
            width: 706px;
            height: 234px;
        }
        .auto-style7 {
            width: 554px;
        }
    .auto-style8 {
        width: 554px;
        height: 26px;
    }
    .auto-style9 {
        height: 26px;
        width: 690px;
    }
    .auto-style10 {
        width: 690px;
    }
        .auto-style11 {
            height: 96px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="animate.min.css" rel="stylesheet" /> 
    <div class="auto-style31" style="align-content:center">
    <div class="container" style="margin:0px auto 88px auto; width:800px;">
     <div class="inner animated fadeInDown"> 
    <h1 style="text-align:center;color:aliceblue" class="auto-style11">Payment Information </h1>
    <table class="auto-style6" style="background-color:bisque; margin-left: auto; margin-right: auto; margin-top: 0px;">
        <tr>
            <td class="auto-style7" style="text-align:right">
                <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="Client Name" ></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8"  style="text-align:right">
                <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Client Phone Number"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7"  style="text-align:right">
                <asp:Label ID="Label4" runat="server" ForeColor="Black" Text="Client Email"></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7"  style="text-align:right">
                <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="Address"></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="auto-style7"  style="text-align:right">
                <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Total Amount to Pay"></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
         </div>
        </div>
        </div>
</asp:Content>
