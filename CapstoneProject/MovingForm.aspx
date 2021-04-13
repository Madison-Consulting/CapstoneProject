<%@ Page Title="Move Form" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MovingForm.aspx.cs" Inherits="CapstoneProject.MovingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20% ">
    <asp:Table ID="tblMoving" runat="server">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="3">
                <asp:Label ID="lblPlz" runat="server" Font-Bold="true" Text="Please, provide the following moving information!"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
 <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomer" runat="server" Text="Customer"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <%--Get Defult Value For DropDown--%>
                <asp:DropDownList ID="ddlCustomer" runat="server"
                    DataSourceID="dtasrcCustomer"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    AppendDataBoundItems="true">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                </asp:DropDownList>
                &nbsp
                <asp:Label ID="lblAddCustomer" runat="server" Text="or Add New"></asp:Label>
                &nbsp
                <asp:Button ID="btnAddCustomer" Font-Bold="true" BackColor="#26754e" ForeColor="White" runat="server" Text="+" PostBackUrl="~/AddCust2.aspx" />
            </asp:TableCell>
        </asp:TableRow>
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
                        <asp:Table ID="tblTxtBox" runat="server" Style="position:fixed; top: 80px; right: 50px;">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="15" Width="250px" Height="140"></asp:TextBox>
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
