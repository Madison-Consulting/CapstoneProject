<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Lab2.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="/Image/favicon.ico" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="tblLogin" runat="server" HorizontalAlign ="center">
                <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell  ColumnSpan="2">
                            <asp:Image ID="Logo" runat="server" ImageUrl="/Image/GVALogo.jpg"/>
                        </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblUserName" runat="server" Text="Username: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtUserName" SetFocusOnError ="true" ForeColor="Red" Text ="Username cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtPassword" SetFocusOnError ="true" ForeColor="Red" Text ="Password Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>              
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnLogin" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:LinkButton ID="lnkbtnForgot" runat="server" OnClick="lnkbtnForgot_Click" CausesValidation="false">Forgot Username/Password?</asp:LinkButton>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Table ID="Table1" runat="server" HorizontalAlign = "Center">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text="" ></asp:Label>
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
