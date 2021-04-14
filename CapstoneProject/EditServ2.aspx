<%@ Page Title="Edit/View Service" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="EditServ2.aspx.cs" Inherits="Lab2.EditServ2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 149%; margin: 0 10%; height: auto;">
        <asp:Table ID="tblDrop" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblServiceTypes" runat="server" Text="Select a service type: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rbtnlistServiceType" runat="server" AutoPostBack="false" RepeatDirection="Horizontal" CellPadding="5">
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

        </asp:Table>
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
        </asp:Table>


        
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
                        AutoGenerateEditButton="true"
                        DataKeyNames="ServiceID"
                        OnRowEditing="grdvwAuctions_RowEditing" 
                        EmptyDataText="This customer has no auctions to choose from"
                        Visible="false">
                    </asp:GridView>
                    <asp:GridView runat="server" ID="grdvwMoves"
                        AutoGenerateEditButton="true"
                        DataKeyNames="ServiceID"
                        OnRowEditing="grdvwMoves_RowEditing" 
                        EmptyDataText="This customer has no moves to choose from"
                        Visible="false">
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
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMoveDate" runat="server" Text="Move Date/Time: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMoveDate" runat="server"></asp:TextBox>
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
                <asp:TableCell>

                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <asp:Table ID="tblAuctionInfo" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAuctCustomer" runat="server" Text="Customer: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAuctCustomer" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>

                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        <asp:Table ID="Table4" runat="server" Width="65%" HorizontalAlign="Center" Style="display: inline-block; margin-right: 0px;">
            <asp:TableRow HorizontalAlign="Center" Height="40">
                <asp:TableCell ColumnSpan="6">
                    <asp:Button ID="btnUpdateServ" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="Update" OnClick="btnUpdateServ_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <%--                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="3">
                            <asp:Button ID="btnClearServ" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Clear" OnClick="btnClearServ_Click" CausesValidation="false"/>
                        </asp:TableCell>
                    </asp:TableRow>--%>
        </asp:Table>


    </div>
</asp:Content>
