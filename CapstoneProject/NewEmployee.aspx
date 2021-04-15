<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewEmployee.aspx.cs" Inherits="Lab3.NewEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="/Image/favicon.ico" />
    <title>Create New Employee</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: auto; margin: 0 20%">
            <asp:Image ID="Logo" runat="server" ImageUrl="/Image/GVALogo.jpg" />

            <asp:Table ID="tblCustLogin" runat="server" HorizontalAlign="Center" Width="719px">
                <asp:TableRow HorizontalAlign="Center">

                    <asp:TableCell ColumnSpan="2">
                        <asp:Label ID="lblWelcomeEmp" runat="server" Text="Welcome New Employee! Please Enter your Information Below to Create an Account." Font-Bold="true" Font-Size="Large"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtFirstName" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                               <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtLastName" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPosition" runat="server" Text="Position"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPosition" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtPosition" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCell" runat="server" Text="Cell Number"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCell" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtCell" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtUsername" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
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
                            ControlToValidate="txtPassword" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtConfirmPassword" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CompareValidator ID="ComparePass" runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtPassword"
                            ErrorMessage="Passwords must match!"
                            SetFocusOnError="true"
                            ForeColor="red" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnCreateNewEmp" class="btn-GreenValleyGreen" runat="server" Text="Submit" OnClick="btnCreateNewEmp_Click" />
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
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>

</html>
