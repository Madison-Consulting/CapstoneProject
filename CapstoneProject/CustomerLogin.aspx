﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Lab3.CustomerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="/Image/favicon.ico" />
    <title>Customer Login</title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:Image ID="Logo" runat="server" ImageUrl="/Image/GVALogo.jpg"/>
                <div style="width: auto; margin: 0 20% ">
            <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" Height="234px">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <asp:Label ID="lblWelcome" runat="server" Text="Welcome Back! Please Login to the Customer Portal." Font-Size="X-Large"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtEmail" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtPassword" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnLogin" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
