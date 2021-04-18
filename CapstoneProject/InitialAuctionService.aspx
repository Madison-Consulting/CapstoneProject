<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InitialAuctionService.aspx.cs" Inherits="CapstoneProject.IntialAuctionService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 20px 20% ">
                <asp:Table ID="tblTitle" runat="server" Width="773px">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="title" runat="server" Text="Initial Auction Service Form" Font-Bold="true" Font-Size="Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Table runat="server" Width="770px"> 
            <asp:TableRow ID="IntialAuctionTable" runat="server">
                <asp:TableCell> 
                    <asp:Label ID="lblItemBeingSold" runat="server" Text="Items Being Sold"></asp:Label>
            </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtItemsSell" runat="server" Width="250px" Height="20px"></asp:TextBox> 
                    <asp:Button ID="btnAddItemtoList" runat="server" Text="Add Item" OnClick="btnAddItemtoList_Click" Height="25px" class="btn-GreenValleyGreen" />
                </asp:TableCell>
                 <asp:TableCell>
                    <asp:DropDownList ID="ddlStorageLocations" runat="server" AutoPostBack="true"
                        DataSourceID="datasrcStroageLocation"
                        DataTextField="StorageName"
                        DataValueField="LocationID"
                        OnSelectedIndexChanged="ddlStorageLocations_SelectedIndexChanged"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">- Select Storage Location -</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                     <asp:DropDownList ID="ddlAuctions" runat="server" AutoPostBack="true"
                        DataSourceID="datasrcAuctions"
                        DataTextField="AuctionDate"
                        DataValueField="AuctionID"
                        OnSelectedIndexChanged="ddlAuctionDate_SelectedIndexChanged"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">- Select Auction -</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtDisplayItemsSell" runat="server" TextMode="MultiLine" Height="200px" Width="200px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox ID="chkbxBringIn" runat="server" Text="Bring In" AutoPostBack="true" /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:CheckBox ID="chkbxPickUp" runat="server" Text="Pick Up" AutoPostBack="true" OnCheckedChanged="chkbxPickUp_CheckedChanged" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblPickUp" runat="server" Text="Pick Up/Look At Address" Visible="false"></asp:Label><asp:TextBox ID="txtAuctionPickUpAddress" runat="server" Visible="false" ></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblCity" runat="server" Text="City" Visible="false"></asp:Label><asp:TextBox ID="txtCity" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblState" runat="server" Text="State" Visible="false"></asp:Label><asp:TextBox ID="txtState" runat="server" Width="50" Visible="false"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblZip" runat="server" Text="Zip Code" Visible="false"></asp:Label> <asp:TextBox ID="txtZip" runat="server" Width="100" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
        <asp:Table runat="server" Width="870px">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblReason" runat="server" Text="Reason For Auction"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtReasonfor" runat="server"></asp:TextBox>
                </asp:TableCell>
                
                <asp:TableCell>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Label ID="lblDeadline" runat="server" Text="Deadline: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButton ID="rbtnDeadN" runat="server" Text="No" AutoPostBack="true" />
                    &nbsp&nbsp&nbsp
                    <asp:RadioButton ID="rbtnDeadY" runat="server" Text="Yes" AutoPostBack="true" OnCheckedChanged="rbtnDeadY_CheckedChanged" />
                    &nbsp&nbsp&nbsp
                    <asp:TextBox ID="txtDeadDate" runat="server" Enabled="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblExtraServiceNeeded" runat="server" Text="Extra Service Needed: "></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                    <asp:TableCell>
                    <asp:CheckBoxList ID="chkNeedSch" runat="server" AutoPostBack="true">
                        <asp:ListItem ID="chkBringIn" runat="server" Value="BringIn" Text="Bring In"></asp:ListItem>
                        <asp:ListItem ID="chkTrashRemoval" runat="server" Value="Trash" Text="Trash Removal & Donation Hauling"></asp:ListItem>
                    </asp:CheckBoxList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                 <asp:TableCell>
                     <asp:CheckBox ID="chkAuctionWalkthrough" runat="server" Text="Auction Walk Through" AutoPostBack="true" OnCheckedChanged="chkAuctionWalkthrough_CheckedChanged"/>
                </asp:TableCell>
            </asp:TableRow>
    </asp:Table>
    </div>
         <div class="divAuctionWalk" id="divAuctionWalk" runat="server" style="width: auto; margin: 0 20% " visible="false">
    <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:CheckBox ID="chkCustReq" runat="server" Text="Customer Requested" AutoPostBack="true"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:CheckBox ID="chkGreenReq" runat="server" Text="Green Valley Required" AutoPostBack="true" />
                </asp:TableCell>
                
            </asp:TableRow>
</asp:Table>
    </div>
    <div class="divNaviagtion" id="divNav" runat="server" style="width: auto; margin: 20px 20% " visible="true">
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnCommitIntialAuction" class= "btn-GreenValleyGreen" runat="server" Text="Save" OnClick="btnCommitIntialAuction_Click" Height="25px" Width="75px" />
                </asp:TableCell>
            </asp:TableRow>
            
        </asp:Table>

         <asp:SqlDataSource runat="server"
            ID="datasrcStroageLocation"
            ConnectionString="<%$ ConnectionStrings:Lab3 %>"
            SelectCommand="SELECT LocationID, StorageName FROM StorageLocation;" >
        </asp:SqlDataSource>

        <asp:SqlDataSource runat="server"
            ID="datasrcAuctions"
            ConnectionString="<%$ ConnectionStrings:Lab3 %>"
            SelectCommand="SELECT AuctionID, AuctionDate FROM AuctionSchedule;" >
        </asp:SqlDataSource>
        </div>
</asp:Content>
