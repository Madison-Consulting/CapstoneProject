<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestMP.aspx.cs" Inherits="CapstoneProject.TestMP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="Content/bootstrap.css" rel="stylesheet" />

</head>

<body>
    <form id="form1" runat="server">
        <div>
          <div class="sidenav">
              <a href="/EmpLandingPage.aspx">Home</a>
              <button class="dropdown-btn">Customer
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-container">
                  <a href="InitialContact.aspx">Initial Contact Form</a>
                <a href="/AddCust2.aspx">Add a New Customer</a>
                <a href="/EditCust.aspx">Edit or View an Existing Customer</a>
              </div>
                <button class="dropdown-btn">Services
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-container">
                <a href="/AddServ.aspx">Add a Service Event</a>
                <a href="/EditServ2.aspx">Edit or View an Existing Service</a>
              </div>
              <a href="/Inventory.aspx">Move Inventory</a>
              <a href="/AppraisalServiceOrder.aspx">Appraisal Service Order Form</a>
               </div>
                <button class="dropdown-btn">Auction Services
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-container">
                <a href="/AuctionForm.aspx">Auction Form</a>
                <a href="/IntiialAuctionService.aspx">Initial Auction Service Form</a>
              </div>
                <button class="dropdown-btn">Moving Services
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-container">
                <a href="/MovingForm.aspx">Moving Form</a>
                <a href="#">...</a>
              </div>
     
</div>
       
        <div class="main">
         <asp:Table ID="header" runat="server" Height="16px" Width="649px" HorizontalAlign="Center">
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell  Width ="110px" ColumnSpan="2">
                            <asp:Image ID="Logo" runat="server" ImageUrl="/Image/GVALogo.jpg"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblUserLoggedIn" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ColumnSpan="7" HorizontalAlign="Right"> 
                             <div class="dropdown">
                                  <button class=" btn-sm dropdown-toggle" data-toggle="dropdown" type="button" id="btnNotifs" aria-haspopup="true" aria-expanded="false">
                                    <img src="/Image/UserIcon.jpg" height="30" width="30"/>
                                  </button>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="/Notifications.aspx">Notifications</a>
                                    <a class="dropdown-item" href="/LoginPage.aspx" onclick="btnLogout_Click">Logout</a>
                                  </div>
                                </div>
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
