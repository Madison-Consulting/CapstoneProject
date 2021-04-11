﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="Lab3.StartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="/Image/favicon.ico" />
    <title>Green Valley Auctions</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: auto; margin: 0 20% ">
            <asp:Table ID="tblStartPage" runat="server" HorizontalAlign="Center" Height="192px" BackColor="White">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3" HorizontalAlign="Center">
                <asp:Label ID="lblWelcome" runat="server" Text="Welcome! Employee or Customer" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Right">
                        <asp:Button ID="btnNewEmp" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="New Employee" OnClick="btnNewEmp_Click" Height="40px" Width="250px" />
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                         <asp:Button ID="btnCustomer"  Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="New Customer" OnClick="btnCustomer_Click" Height="40px" Width="250px" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Right">
                        <asp:Button ID="btnEmployee" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text=" Existing Employee" OnClick="btnEmployee_Click" Height="40px" Width="250px" />
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:Button ID="btnExistingCustomer"  Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Existing Customer" OnClick="btnExistingCustomer_Click" Height="40px" Width="250px" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
          <script src="Scripts/jquery-3.5.1.min.js"></script>
        <script src="Scripts/popper.min.js"></script>
        <script src="Scripts/bootstrap.bundle.min.js"></script>
    </form>
          </body>
</html>
 