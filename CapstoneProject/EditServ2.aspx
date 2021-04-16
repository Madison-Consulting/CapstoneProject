<%@ Page Title="Edit/View Service" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="EditServ2.aspx.cs" Inherits="Lab2.EditServ2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20%;">
        <asp:Table ID="tblDrop" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblServiceTypes" runat="server" Text="Select a service type: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rbtnlistServiceType" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" CellPadding="5" OnSelectedIndexChanged="rbtnlistServiceType_SelectedIndexChanged">
                        <asp:ListItem Value="auction">Auction</asp:ListItem>
                        <asp:ListItem Value="move">Move</asp:ListItem>
                        <asp:ListItem Value="other">Other</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDropDownList" runat="server" Text="Choose a Customer to View"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlCustomer" runat="server" AutoPostBack="true"
                        DataSourceID="datasrcCustomerList"
                        DataTextField="fullName"
                        DataValueField="CustomerID"
                        OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="30"></asp:TableRow>
        </asp:Table>
        <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" SelectCommand="SELECT CustFirstName + ' ' +  CustLastName AS fullName, Customer.CustomerID FROM Customer"></asp:SqlDataSource>

        <asp:Table ID="tblHistory" runat="server" Style="display: inline-block" BorderColor="Green" BackColor="LightYellow" BorderStyle="Double">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEditServTicket" runat="server" Text="Edit Service Ticket History" Font-Size="X-Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblHistID" runat="server" Text="Ticket History ID"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtHistID" runat="server" Text="Auto-Filled"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDateTime" runat="server" Text="Date and Time of History Change"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDateTime" runat="server" AutoPostBack="true" TextMode="DateTime"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtDateTime" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblYourName" runat="server" Text="Your Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtYourName" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtServTicketID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="btnTicketHistorySubmit" class= "btn-GreenValleyGreen" runat="server" Text="Submit New Ticket History" OnClick="btnTicketHistorySubmit_Click" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="center">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="btnHistory" class= "btn-GreenValleyGreen" runat="server" Text="View Full Service History" OnClick="btnHistory_Click" CausesValidation="false" />
                </asp:TableCell>
            </asp:TableRow>

<%--        </asp:Table>
         <asp:Table ID="tblTxtBox" runat="server" Style="position:fixed; top: 80px; right: 50px;">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="15" Width="200px" Height="200"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>--%>


        
        <asp:Table ID="tblServiceTicket" runat="server" Style="display: block;">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView runat="server" ID="grdvwTicketDisplay1" EmptyDataText="No Service Selected!" OnRowDataBound="grdvwTicketDisplay_RowDataBound"></asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="40"></asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView runat="server" ID="grdvwAuctions"
                        AutoGenerateColumns="false"
                        EnableViewState="false"
                        DataKeyNames="ServiceID, AuctionItemID"
                        OnRowCommand="grdvwAuctions_RowCommand"
                        EmptyDataText="This customer has no auctions to choose from"
                        Visible="false">
                        <Columns>
                            <asp:ButtonField ButtonType="Button" Text="Edit" HeaderText="" CommandName="editRow" />
                            <asp:BoundField DataField="ItemDescription" HeaderText="Item" />
                            <asp:BoundField DataField="ItemQuantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="AuctionItemID" HeaderText="AuctionItemID" Visible="false" />
                            <asp:BoundField DataField="ServiceID" HeaderText="ServiceID" Visible="false" />
                        </Columns>
                    </asp:GridView>
                    <asp:GridView runat="server" ID="grdvwMoves"
                        AutoGenerateColumns="false"
                        EnableViewState="false"
                        DataKeyNames="ServiceID, MoveFormID"
                        OnRowCommand="grdvwMoves_RowCommand"
                        EmptyDataText="This customer has no moves to choose from"
                        Visible="false">
                        <Columns>
                            <asp:ButtonField ButtonType="Button" Text="Edit" HeaderText="" CommandName="editRow" />
                            <asp:BoundField DataField="Move Date" HeaderText="Move Date" />
                            <asp:BoundField DataField="Origin City" HeaderText="Origin City" />
                            <asp:BoundField DataField="Origin State" HeaderText="Origin State" />
                            <asp:BoundField DataField="Destination City" HeaderText="Destination City" />
                            <asp:BoundField DataField="Destination State" HeaderText="Destination State" />
                            <asp:BoundField DataField="MoveFormID" HeaderText="MoveFormID" Visible="false" />
                            <asp:BoundField DataField="ServiceID" HeaderText="ServiceID" Visible="false" />
                        </Columns>
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>


        <asp:Table ID="tblMoveInfo" runat="server" Visible="false" Width="65%" HorizontalAlign="Center" Style="display: inline-block; margin-right: 0px;">
            <asp:TableRow Height="40"></asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCustomer" runat="server" Text="Customer: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCustomer" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtHiddenMoveServiceID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtHiddenMoveFormID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMoveDate" runat="server" Text="Move Date: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMoveDate" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblMoveTime" runat="server" Text="Move Time: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMoveTime" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblOriginAddress" runat="server" Text="Origin Address:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOriginAddress" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblOriginCity" runat="server" Text="City: "></asp:Label>
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
                <asp:TableCell>
                    <asp:Label ID="lblOriginZip" runat="server" Text="Origin Zip: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOriginZip" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDestinationAddress" runat="server" Text="Destination Address: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDestinationAddress" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblDestinationCity" runat="server" Text="City: "></asp:Label>
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
                <asp:TableCell>
                    <asp:Label ID="lblDestinationZip" runat="server" Text="Destination Zip: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDestinationZip" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFoodCost" runat="server" Text="Food Cost: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFoodCost" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblFuelCost" runat="server" Text="Fuel Cost: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFuelCost" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLodgingCost" runat="server" Text="Lodging Cost: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLodgingCost" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblHomeType" runat="server" Text="Home Type: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtHomeType" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLoadingCondition" runat="server" Text="Loading Condition: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLoadingCondition" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblTruckDistance" runat="server" Text="Truck Distance: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtTruckDistance" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDrivewayAccess" runat="server" Text="Driveway Accessible: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rbtnlistDrivewayAccess" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                        <asp:ListItem Value="No">No</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="5">
                    <asp:Table ID="tblSelectMoveTrucks" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblMoveTrucksNeeded" runat="server" Text="Trucks Needed: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblMoveTrucksAvailable" runat="server" Text="Available: "></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Height="150">
                            <asp:TableCell Width="160">
                                <asp:ListBox ID="lstboxMoveTruckUsed" runat="server"
                                    Height="150"
                                    Width="180"
                                    AutoPostBack="false"></asp:ListBox>
                            </asp:TableCell>
                            <asp:TableCell Width="90">
                                <asp:Button ID="btnAddMoveTruck" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="<-Add" Width="90" OnClick="btnAddMoveTruck_Click" />
                                <asp:Button ID="btnRemoveMoveTruck" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="Remove->" Width="90" OnClick="btnRemoveMoveTruck_Click" />
                            </asp:TableCell>
                            <asp:TableCell Width="180">
                                <asp:ListBox ID="lstboxMoveTruckInventory" runat="server"
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
                    <asp:Table ID="tblSelectMoveEquipment" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblMoveMoveEquipmentNeeded" runat="server" Text="Equipment Needed: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblEquipmentAvailable" runat="server" Text="Available: "></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Height="150">
                            <asp:TableCell Width="160">
                                <asp:ListBox ID="lstboxMoveEquipmentUsed" runat="server"
                                    Height="150"
                                    Width="180"
                                    AutoPostBack="false"></asp:ListBox>
                            </asp:TableCell>
                            <asp:TableCell Width="90">
                                <asp:Button ID="btnAddMoveEquipment" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="<-Add" Width="90" OnClick="btnAddMoveEquipment_Click" />
                                <asp:Button ID="btnRemoveMoveEquipment" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="Remove->" Width="90" OnClick="btnRemoveMoveEquipment_Click" />
                            </asp:TableCell>
                            <asp:TableCell Width="180">
                                <asp:ListBox ID="lstboxMoveEquipmentInventory" runat="server"
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
            <asp:TableRow HorizontalAlign="Center" Height="40">
                <asp:TableCell ColumnSpan="6">
                    <asp:Button ID="btnUpdateMove" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="Update" OnClick="btnUpdateMove_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <%-- <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="3">
                    <asp:Button ID="btnClearServ" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Clear" OnClick="btnClearServ_Click" CausesValidation="false"/>
                </asp:TableCell>
            </asp:TableRow>--%>
        </asp:Table>



        <asp:Table ID="tblAuctionInfo" runat="server" Visible="false">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAuctCustomer" runat="server" Text="Customer: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAuctCustomer" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtHiddenAuctionServiceID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtHiddenAuctionItemID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblItemDesc" runat="server" Text="Item: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtItemDesc" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblItemQuant" runat="server" Text="Quantity: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtItemQuant" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="40"></asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAuctionDate" runat="server" Text="Auction Date: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAuctionDate" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPhotoSpot" runat="server" Text="Photo Spot: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPhotoSpot" runat="server"></asp:TextBox>
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
                    <div class="divPickup" id="divPickup" runat="server">
                        <%-- going to hide this div at pageload unless "pick-up" radio button is selected --%>
                        <asp:Table ID="tblPickUp" runat="server">
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="5">
                                    <asp:Label ID="lblTruckAccess" runat="server" Text="Truck Access: "></asp:Label>
                                    <asp:RadioButtonList ID="radioBtnTruckAccess" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="yes">Yes</asp:ListItem>
                                        <asp:ListItem Value="no">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="5">
                                    <%-- going to hide this table at pageload unless "yes" is selected from radioBtnTruckAccess--%>
                                    <asp:Table ID="tblSelectAuctionTrucks" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblAuctionTrucksNeeded" runat="server" Text="Trucks Needed: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblAuctionTrucksAvailable" runat="server" Text="Available: "></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow Height="150">
                                        <asp:TableCell Width="160">
                                            <asp:ListBox ID="lstboxAuctionTruckUsed" runat="server"
                                                Height="150"
                                                Width="180"
                                                AutoPostBack="false"></asp:ListBox>
                                        </asp:TableCell>
                                        <asp:TableCell Width="90">
                                            <asp:Button ID="btnAddAuctionTruck" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="<-Add" Width="90" OnClick="btnAddAuctionTruck_Click"  />
                                            <asp:Button ID="btnRemoveAuctionTruck" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Remove->" Width="90" OnClick="btnRemoveAuctionTruck_Click"  />
                                        </asp:TableCell>
                                        <asp:TableCell Width="180">
                                            <asp:ListBox ID="lstboxAuctionTruckInventory" runat="server"
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
                                <asp:Label ID="lblAuctionCrewSize" runat="server" Text="Crew Size: "></asp:Label>
                                <asp:TextBox ID="txtAuctionCrewSize" runat="server" MaxLength="5" Width="70"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <%-- another table inside of a tablecell, this is for selecting equipment that should be used to pick up auctioned item --%>
                                <asp:Table ID="tblSelectAuctionEquipment" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblAuctionEquipmentNeeded" runat="server" Text="Equipment Needed: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblAuctionEquipmentAvailable" runat="server" Text="Available: "></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow Height="150">
                                        <asp:TableCell Width="160">
                                            <asp:ListBox ID="lstboxAuctionEquipmentUsed" runat="server"
                                                Height="150"
                                                Width="180"
                                                AutoPostBack="false"></asp:ListBox>
                                        </asp:TableCell>
                                        <asp:TableCell Width="90">
                                            <asp:Button ID="btnAddAuctionEquipment" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="<-Add" Width="90" OnClick="btnAddAuctionEquipment_Click"  />
                                            <asp:Button ID="btnRemoveAuctionEquipment" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Remove->" Width="90" OnClick="btnRemoveAuctionEquipment_Click"  />
                                        </asp:TableCell>
                                        <asp:TableCell Width="180">
                                            <asp:ListBox ID="lstboxAuctionEquipmentInventory" runat="server"
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
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center" Height="40">
                <asp:TableCell ColumnSpan="6">
                    <asp:Button ID="btnUpdateAuction" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="Update" OnClick="btnUpdateAuction_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <%-- <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="3">
                    <asp:Button ID="btnClearServ" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Clear" OnClick="btnClearServ_Click" CausesValidation="false"/>
                </asp:TableCell>
            </asp:TableRow>--%>
        </asp:Table>

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
