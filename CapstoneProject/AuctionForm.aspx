﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AuctionForm.aspx.cs" Inherits="CapstoneProject.AuctionForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblAuction" runat="server">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="4">
                <asp:Label ID="lblPlz" runat="server" Font-Bold="true" Text="Please, provide the following auction information:"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomer" runat="server" Text="Customer (consignor?)"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlCustomer" runat="server">
                    <asp:ListItem>-Select-</asp:ListItem>
                    <asp:ListItem>we will get this</asp:ListItem>
                    <asp:ListItem>from a sql dataset</asp:ListItem>
                    <asp:ListItem>if consignor==customer</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblAddCustomer" runat="server" Text="or Add New"></asp:Label>
                <asp:Button ID="btnAddCustomer" Font-Bold="true" BackColor="#26754e" ForeColor="White" runat="server" Text="+" PostBackUrl="~/CustomerCreate.aspx" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAuctionDate" runat="server" Text="Auction Date: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtAuctionDate" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblTempHolder2" runat="server" Text="should we have this as text box?"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhotoSpot" runat="server" Text="Photo Spot: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblTemporaryHolder" runat="server" Text="*note*is this a file upload?"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblProcurementMethod" runat="server" Text="Procurement: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RadioButtonList ID="radioBtnProcurement" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="bring-in">Consignor Bring-In</asp:ListItem>
                    <asp:ListItem Value="pick-up">GVA&M Pick-Up</asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="5">
                <%-- here we begin making a table within a tablecell --%>
                <div id="divPickup">  <%-- going to hide this div at pageload unless "pick-up" radio button is selected --%>
                    <asp:Table ID="tblPickUp" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblTruckAccess" runat="server" Text="Truck Access: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="radioBtnTruckAccess" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="yes">Yes</asp:ListItem>
                                    <asp:ListItem Value="no">No</asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="5">
                                <%-- going to hide this table at pageload unless "yes" is selected from radioBtnTruckAccess--%>
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
                                        <asp:TableCell Width="60">
                                            <asp:Button ID="btnAddTruck" runat="server" Text="<-Add" Width="75"  />
                                            <asp:Button ID="btnRemoveTruck" runat="server" Text="Remove->" Width="75"  />
                                            <%-- need to make onclick methods for these buttons; i have good example from my last project --%>
                                        </asp:TableCell>
                                        <asp:TableCell Width="180">
                                            <asp:ListBox ID="lstboxTruckInventory" runat="server"
                                                Height="150"
                                                Width="180"
                                                AutoPostBack="false"></asp:ListBox>
                                            <%-- need to add DataSourceID, DataTextField, and DataValueField with truck query to allow selection of available trucks--%>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <%-- end of truck selection table (which is hidden unless truck access is set to yes)--%>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCrewSize" runat="server" Text="Crew Size: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ColumnSpan="4">
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
                                        <asp:TableCell Width="60">
                                            <asp:Button ID="btnAddEquipment" runat="server" Text="<-Add" Width="75"  />
                                            <asp:Button ID="btnRemoveEquipment" runat="server" Text="Remove->" Width="75"  />
                                            <%-- need to make onclick methods for these buttons; i have good example from my last project --%>
                                        </asp:TableCell>
                                        <asp:TableCell Width="180">
                                            <asp:ListBox ID="lstboxEquipmentInventory" runat="server"
                                                Height="150"
                                                Width="180"
                                                AutoPostBack="false"></asp:ListBox>
                                            <%-- need to add DataSourceID, DataTextField, and DataValueField with Equipment query to allow selection of available Equipment--%>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        
        

    </asp:Table>
</asp:Content>
