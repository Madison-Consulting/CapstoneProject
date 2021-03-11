<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotUP.aspx.cs" Inherits="Lab2.ForgotUP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server"  HorizontalAlign="Center">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label ID="lblForgotUP" runat="server" Text="Forgot Username or Password?" Font-Size="X-Large"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                        <asp:Label ID="lblEnterEmail" runat="server" Text="Please enter your email to retrieve your username or reset your password:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEnterEmail" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnSend" runat="server" Text="Send a Reset Link" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnBacktoLogin" runat="server" Text="Return to Login Page" OnClick="btnBacktoLogin_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
