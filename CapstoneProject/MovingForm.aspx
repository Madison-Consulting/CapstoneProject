<%@ Page Title="Move Form" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MovingForm.aspx.cs" Inherits="CapstoneProject.MovingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20% ">

        <asp:Table ID="InitialMove" runat="server">

         <asp:TableRow>

            <asp:TableCell>
                <asp:Label ID="lblDateTime" runat="server" Text="What is the date you have to be out of your current address?: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
                <asp:TextBox ID="txtDateTime" runat="server" TextMode="Date"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDateWindow" runat="server" Text="What is the window of days you can move?: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDateWindow" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblOriginAddress" runat="server" Text="Origin Address: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtOriginAddress" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblOriginCity" runat="server" Text="Origin City: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtOriginCity" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblOriginState" runat="server" Text="Origin State: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtOriginState" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationAddress" runat="server" Text="Destination Address: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDestinationAddress" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationCity" runat="server" Text="Destination City: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDestinationCity" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationState" runat="server" Text="Destination State: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDestinationState" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMlsList" runat="server" Text="Is there a MLS Listing?: "></asp:Label>
            </asp:TableCell>
             <asp:TableCell>

                <asp:DropDownList ID="ddlMlsList" runat="server" AutoPostBack="true">
                    <asp:ListItem>Select Value</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                 </asp:TableCell>

        </asp:TableRow>

          <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhotoNeed" runat="server" Text="Can you send photos if we need them?: "></asp:Label>
            </asp:TableCell>
             <asp:TableCell>

                <asp:DropDownList ID="ddlPhotoNeed" runat="server" AutoPostBack="true">
                    <asp:ListItem>Select Value</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                 </asp:TableCell>

        </asp:TableRow>
        
             <asp:TableRow>

            <asp:TableCell>
                <br />
                <br />

                <asp:Label ID="lblAddlServ" runat="server" Text="Do you need Auction Services?: "></asp:Label>
            </asp:TableCell>
           
            <asp:TableCell>
                <br />
                <br />
                <asp:Button ID="btnAuctionAssess" class= "btn-GreenValleyGreen" runat="server" Text="Auction Assessment" OnClick="btnAuctionAssess_Click"/>
            </asp:TableCell>

        </asp:TableRow>

    </asp:Table>
    <asp:Table ID="tblMoving" runat="server">

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblHomeType" runat="server" Text="Type of Building: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
                <asp:DropDownList ID="ddlHomeType" runat="server" AutoPostBack="true">
                    <asp:ListItem>Select Type</asp:ListItem>
                    <asp:ListItem>Apartment</asp:ListItem>
                    <asp:ListItem>House</asp:ListItem>
                    <asp:ListItem>Storage Unit</asp:ListItem>
                    <asp:ListItem>Place of Business</asp:ListItem>
                </asp:DropDownList>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDriveway" runat="server" Text="Driveway accessibility: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDriveway" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDistance" runat="server" Text="How far is the walk to the door: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDistance" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMoveSteps" runat="server" Text="Steps leading up to the house: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMoveSteps" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblLoad" runat="server" Text="Loading conditions: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtLoad" runat="server" TextMode="MultiLine" Rows="15" Width="250px" Height="140"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell ColumnSpan="5">
                <asp:Table ID="tblSelectTrucks" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblTrucksNeeded" runat="server" Text="Trucks Needed: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblTrucksAvailable" runat="server" Text="Available: "></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="150">
                        <asp:TableCell Width="160">
                            <asp:ListBox ID="lstboxTruckUsed" runat="server"
                                Height="150"
                                Width="180"
                                AutoPostBack="false"></asp:ListBox>
                        </asp:TableCell>
                        <asp:TableCell Width="90">
                            <asp:Button ID="btnAddTruck" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="<-Add" Width="90" OnClick="btnAddTruck_Click" />
                            <asp:Button ID="btnRemoveTruck" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="Remove->" Width="90" OnClick="btnRemoveTruck_Click" />
                        </asp:TableCell>
                        <asp:TableCell Width="180">
                            <asp:ListBox ID="lstboxTruckInventory" runat="server"
                                Height="150"
                                Width="180"
                                DataSourceID="dtasrcTruckInventory"
                                DataTextField="EquipmentDescription"
                                DataValueField="EquipmentID"
                                AutoPostBack="false"></asp:ListBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="5">
                <%-- another table inside of a tablecell, this is for selecting equipment that should be used in move --%>
                <asp:Table ID="tblSelectEquipment" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblEquipmentNeeded" runat="server" Text="Equipment Needed: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblEquipmentAvailable" runat="server" Text="Available: "></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="150">
                        <asp:TableCell Width="160">
                            <asp:ListBox ID="lstboxEquipmentUsed" runat="server"
                                Height="150"
                                Width="180"
                                AutoPostBack="false"></asp:ListBox>
                        </asp:TableCell>
                        <asp:TableCell Width="90">
                            <asp:Button ID="btnAddEquipment" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="<-Add" Width="90" OnClick="btnAddEquipment_Click" />
                            <asp:Button ID="btnRemoveEquipment" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="Remove->" Width="90" OnClick="btnRemoveEquipment_Click" />
                        </asp:TableCell>
                        <asp:TableCell Width="180">
                            <asp:ListBox ID="lstboxEquipmentInventory" runat="server"
                                Height="150"
                                Width="180"
                                DataSourceID="dtasrcEquipment"
                                DataTextField="EquipmentDescription"
                                DataValueField="EquipmentID"
                                AutoPostBack="false"></asp:ListBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>


        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnBack" class= "btn-GreenValleyGreen" runat="server" Text="Back" OnClick="btnBack_Click" />
                <asp:Button ID="btnCommit" class= "btn-GreenValleyGreen" runat="server" Text="Next" OnClick="btnCommit_Click" />

                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
                        <asp:Table ID="tblTxtBox" runat="server" Style="position:fixed; top: 120px; right: 50px;">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="15" Width="150px" Height="140"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <asp:SqlDataSource runat="server"
            ID="dtasrcCustomer"
            ConnectionString="<%$ ConnectionStrings:Lab3 %>"
            SelectCommand="SELECT Customer.CustomerID, Customer.CustFirstName + ' ' + Customer.CustLastName AS CustomerName FROM Customer;" >
        </asp:SqlDataSource>

        <asp:SqlDataSource runat="server"
            ID="dtasrcTruckInventory"
            ConnectionString="<%$ ConnectionStrings:Lab3 %>"
            SelectCommand="SELECT Equipment.EquipmentID, Equipment.EquipmentName, Equipment.EquipmentDescription FROM Equipment WHERE Equipment.EquipmentName = 'truck';" >
        </asp:SqlDataSource>

        <asp:SqlDataSource runat="server"
            ID="dtasrcEquipment"
            ConnectionString="<%$ ConnectionStrings:Lab3 %>"
            SelectCommand="SELECT Equipment.EquipmentID, Equipment.EquipmentName, Equipment.EquipmentDescription FROM Equipment WHERE Equipment.EquipmentName != 'truck';" >
        </asp:SqlDataSource>

        </div>
</asp:Content>
