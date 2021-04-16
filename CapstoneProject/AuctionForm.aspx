<%@ Page Title="Auction Form" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AuctionForm.aspx.cs" Inherits="CapstoneProject.AuctionForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 20px 20% ">

    <asp:Table ID="tblAuction" runat="server">
        
        <asp:TableRow>
            <asp:TableCell ColumnSpan="4">
                <asp:Label ID="lblPlz" runat="server" Font-Bold="true" Text="Please, provide the following auction information:"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblFN" runat="server" Text="Customer Name:"></asp:Label>
            </asp:TableCell>
              <asp:TableCell>
                <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
            </asp:TableCell>
<%--            <asp:TableCell>
                Get Defult Value For DropDown
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
                <asp:Button ID="btnAddCustomer" Font-Bold="true" BackColor="#26754e" ForeColor="White" runat="server" Text="+" PostBackUrl="~/AddCust.aspx" />
            </asp:TableCell>--%>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAuctionDate" runat="server" Text="Auction Date: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtAuctionDate" runat="server" TextMode="Date"></asp:TextBox>
            </asp:TableCell>
<%--            <asp:TableCell>
                <asp:Label ID="lblTempHolder2" runat="server" Text="should we have this as text box?"></asp:Label>
            </asp:TableCell>--%>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhotoSpot" runat="server" Text="Photos: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:FileUpload ID="PhotoAuction" runat="server" allowmultiple="true"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnUpload" runat="server" Text="Upload Images" OnClick="btnUpload_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblUploadStatus" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblProcurementMethod" runat="server" Text="Procurement: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell ColumnSpan="5">
                <asp:RadioButtonList ID="radioBtnProcurement" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" CellPadding="10" OnSelectedIndexChanged="radioBtnProcurement_SelectedIndexChanged">
                    <asp:ListItem Value="bringin">Consignor Bring-In</asp:ListItem>
                    <asp:ListItem Value="pickup">GVA&M Pick-Up</asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="5">
                <%-- here we begin making a table within a tablecell --%>
                <div class="divPickup" id="divPickup" runat="server">  <%-- going to hide this div at pageload unless "pick-up" radio button is selected --%>
                    <asp:Table ID="tblPickUp" runat="server">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="5">
                                <asp:Label ID="lblTruckAccess" runat="server" Text="Truck Access: "></asp:Label>
                                <asp:RadioButtonList ID="radioBtnTruckAccess" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" >
                                    <asp:ListItem Value="yes">Yes</asp:ListItem>
                                    <asp:ListItem Value="no">No</asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="5">
                                <%-- going to hide this table at pageload unless "yes" is selected from radioBtnTruckAccess--%>
                                <asp:Table ID="tblSelectTrucks" runat="server" OnLoad="tblSelectTrucks_Load">
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
                                            <asp:Button ID="btnAddTruck" class="btn-GreenValleyGreen" runat="server" Text="<-Add" Width="90" OnClick="btnAddTruck_Click"  />
                                            <asp:Button ID="btnRemoveTruck" class="btn-GreenValleyGreen"  runat="server" Text="Remove->" Width="90" OnClick="btnRemoveTruck_Click"  />
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
                                <%-- end of truck selection table (which is hidden unless truck access is set to yes)--%>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCrewSize" runat="server" Text="Crew Size: "></asp:Label>
                                <asp:TextBox ID="txtCrewSize" runat="server" MaxLength="5" Width="70"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <%-- another table inside of a tablecell, this is for selecting equipment that should be used to pick up auctioned item --%>
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
                                            <asp:Button ID="btnAddEquipment" class="btn-GreenValleyGreen"  runat="server" Text="<-Add" Width="90" OnClick="btnAddEquipment_Click"  />
                                            <asp:Button ID="btnRemoveEquipment" class="btn-GreenValleyGreen"  runat="server" Text="Remove->" Width="90" OnClick="btnRemoveEquipment_Click"  />
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
                    </asp:Table>
                </div>
                <%-- end of hideable "pickup" div --%>
                <asp:Button ID="btnCommit" class= "btn-GreenValleyGreen" runat="server" Text="Save" OnClick="btnCommit_Click"/>
            </asp:TableCell>
        </asp:TableRow>
        
        

    </asp:Table>

<%--            <asp:Table ID="tblTxtBox" runat="server" Style="position:fixed; top: 80px; right: 130px;">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="15" Width="230px" Height="150"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>--%>

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

        <asp:SqlDataSource runat="server"
        ID="dtasrcCustomer"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT Customer.CustomerID, Customer.CustFirstName + ' ' + Customer.CustLastName AS CustomerName FROM Customer;" >
    </asp:SqlDataSource>

        <asp:TextBox ID="txtCustomerID" runat="server" Visible="false"></asp:TextBox>

        </div>
            </asp:Content>
