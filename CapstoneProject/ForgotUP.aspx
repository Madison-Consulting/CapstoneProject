<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotUP.aspx.cs" Inherits="Lab2.ForgotUP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">'    
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="/Image/favicon.ico" />
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
                        <asp:Button ID="btnSend" class= "btn-GreenValleyGreen" runat="server" Text="Send a Reset Link" />
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
              <script src="Scripts/jquery-3.5.1.min.js"></script>
        <script src="Scripts/popper.min.js"></script>
        <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
