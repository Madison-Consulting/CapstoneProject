﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseCustomer.aspx.cs" Inherits="CapstoneProject.ChooseCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Choose a Customer</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="/Image/favicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: auto; margin: 0 20%">

            <asp:Table ID="Table2" runat="server">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Image ID="Logo" runat="server" ImageUrl="/Image/GVALogo.jpg" />
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2">
                        <asp:LinkButton ID="lnkAdd" runat="server" OnClick="lnkAdd_Click" CausesValidation="false">Add a New Customer     </asp:LinkButton>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="btn-GreenValleyGreen" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCustSearch" runat="server" Text="Search by Customer Name (First or Last)"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCustSearch" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnSearch" class="btn-GreenValleyGreen" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="false" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnViewAll" runat="server" Text="View All Customers" Onclick="btnViewAll_Click" class="btn-GreenValleyGreen"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblSearchStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateSelectButton="true" OnSelectedIndexChanged="GridView2_SelectedIndexChanged"></asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
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
