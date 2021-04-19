<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerCreate.aspx.cs" Inherits="Lab3.CustomerCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="/Image/favicon.ico" />
    <title>Create an Account</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image ID="Logo" runat="server" ImageUrl="/Image/GVALogo.jpg" />
        <div style="width: auto; margin: 5% 25%">
            <asp:Table ID="tblCustLogin" runat="server" HorizontalAlign="Center" Width="1024px" Style="margin-bottom: 50px;">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label ID="lblWelcomeCust" runat="server" Text="Welcome! Please Enter your Information Below to Create an Account." Font-Bold="true" Font-Size="X-Large"></asp:Label>
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
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtFirstName" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*" ForeColor="Red"></asp:RegularExpressionValidator>
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
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtLastName" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*$" ForeColor="Red"></asp:RegularExpressionValidator>

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtLastName" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
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
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
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
                    <asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator"
                            ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$"
                            ControlToValidate="txtPassword" Text="Must contain 1 Uppercase, 1 Lowercase, 1 Number, and 1 Special Character" ForeColor="Red"></asp:RegularExpressionValidator>
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
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtAddress" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAddress2" runat="server" Text="Address Line 2"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtCity" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*" ForeColor="Red"></asp:RegularExpressionValidator>

                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtCity" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtState" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtState" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblZip" runat="server" Text="Zip Code"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtZip" MaxLength="5" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="txtZip" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Entry can be only numbers" />
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtZip" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell><asp:TableCell>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPhoneNo" runat="server" Text="Phone Number"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter valid Phone number"
                            ControlToValidate="txtPhoneNo" ForeColor="Red" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"></asp:RegularExpressionValidator>

                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtPhoneNo" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblHearAbout" runat="server" Text="How did you hear about us?"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtHearAbout" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtHearAbout" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow HorizontalAlign="center">
                    <asp:TableCell ColumnSpan="3">
                        <asp:Button ID="btnCreateAccount" class="btn-GreenValleyGreen" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
                    </asp:TableCell></asp:TableRow><asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
