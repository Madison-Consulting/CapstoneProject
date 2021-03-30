<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerServInfo.aspx.cs" Inherits="Lab3.CustomerServInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:Image ID="Logo" runat="server" ImageUrl="/Image/GVALogo.jpg"/>
             <div style="width: auto; margin: 0 20% ">
            <asp:Label ID="lblLoggedIn" runat="server" Text=""></asp:Label>

            <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblWelcome" runat="server" Text="Welcome to Green Valley's Customer Portal" Font-Size="X-Large"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEmail" runat="server" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblRequestService" runat="server" Text="Request a Service Here!"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServInterested" runat="server" Text="What Service Are you Interested in Today?"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButtonList ID="rdobtnServ" runat="server">
                            <asp:ListItem Value="Auction">Auction</asp:ListItem>
                            <asp:ListItem Value="Moving">Moving</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDate" runat="server" Text="Possible Service Date?"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDate" runat="server" AutoPostBack="true" TextMode="Date"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtDate" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
               </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblNeeds" runat="server" Text="Description of Needs?"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNeeds" runat="server" TextMode="MultiLine" Rows ="5"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtNeeds" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
               </asp:TableRow>
                <asp:TableRow HorizontalAlign="Right">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnSubmitRequest" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Submit Service Request" OnClick="btnSubmitRequest_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Left">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnLogout" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Logout" OnClick ="btnLogout_Click" CausesValidation="false"/>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
        </div>
    </form>
</body>
</html>
