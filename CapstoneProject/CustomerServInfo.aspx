<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerServInfo.aspx.cs" Inherits="Lab3.CustomerServInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="/Image/favicon.ico" />
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
                    <asp:TableCell ColumnSpan="3">
                        <asp:Button ID="btnLogout" class="btn-GreenValleyGreen" runat="server" Text="Logout" OnClick ="btnLogout_Click" CausesValidation="false"/>
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
                        <asp:ListItem ID="chkMoveAsses" runat="server" Value="Move Assessment" Text="Move Assessment"></asp:ListItem>
                        <asp:ListItem ID="chkAuctionLookAt" runat="server" Value="Auction Look At" Text="Auction Look At"></asp:ListItem>
                        <asp:ListItem ID="chkAppraisal" runat="server" Value="Appraisal" Text="Appraisal"></asp:ListItem>
                        <asp:ListItem ID="chkMove" runat="server" Value="Move" Text="Move"></asp:ListItem>
                        <asp:ListItem ID="chkAuctionPickUp" runat="server" Value="Auction Pick Up" Text="Auction Pick Up"></asp:ListItem>
                        <asp:ListItem ID="chkAuctionBringIn" runat="server" Value="Auction Bring In" Text="Auction Bring In"></asp:ListItem>
                        <asp:ListItem ID="chkConsignmentShop" runat="server" Value="Consignment Shop" Text="Consignment Shop"></asp:ListItem>
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
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPhotos" runat="server" Text="Upload Photos"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:FileUpload ID="FileUpload1" runat="server" allowmultiple="true"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnUpload" class="btn-GreenValleyGreen" runat="server" Text="Upload" OnClick="btnUpload_Click" causesvalidation="false"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblUploadStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3">
                        <asp:Button ID="btnSubmitRequest" class="btn-GreenValleyGreen" runat="server" Text="Submit Service Request" OnClick="btnSubmitRequest_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Left">

                    <asp:TableCell>
                        <asp:TextBox ID="txtCustomerID" runat="server" Visible="false"></asp:TextBox>
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
