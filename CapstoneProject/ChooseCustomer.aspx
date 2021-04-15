<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseCustomer.aspx.cs" Inherits="CapstoneProject.ChooseCustomer" %>

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
            <asp:Table ID="Table1" runat="server">
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
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblSearchStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName1" runat="server" Text="First Name: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName1" runat="server" Text="Last Name: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPhoneNo1" runat="server" Text="Phone Number: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblPhoneNo" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmail1" runat="server" Text="Email: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAddress1" runat="server" Text="Address: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCity1" runat="server" Text="City: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblCity" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblState1" runat="server" Text="State: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblState" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblZip1" runat="server" Text="Zip Code: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblZip" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCustomerID1" runat="server" Text="Customer ID: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblCustomerID" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3">
                        <asp:Button ID="btnSelect" runat="server" Text="Select this Customer" class="btn-GreenValleyGreen" OnClick="btnSelect_Click" />
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>


            <asp:Table ID="tblTxtBox" runat="server" Style="position: fixed; top: 140px; right: 78px; left: 923px;">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell>
                        <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="15" Width="250px" Height="200"></asp:TextBox>
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
