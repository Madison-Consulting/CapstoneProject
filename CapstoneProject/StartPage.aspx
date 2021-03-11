<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="Lab3.StartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="tblStartPage" runat="server">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                <asp:Label ID="lblWelcome" runat="server" Text="Welcome! Employee or Customer Login?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnNewEmp" runat="server" Text="New Employee" OnClick="btnNewEmp_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnEmployee" runat="server" Text=" Existing Employee" OnClick="btnEmployee_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnCustomer" runat="server" Text="New Customer" OnClick="btnCustomer_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnExistingCustomer" runat="server" Text="Existing Customer" OnClick="btnExistingCustomer_Click" />
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
 