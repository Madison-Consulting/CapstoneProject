<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InitialAuctionService.aspx.cs" Inherits="CapstoneProject.IntialAuctionService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20% ">
        <asp:Table runat="server"> 
            <asp:TableRow ID="IntialAuctionTable" runat="server">
                <asp:TableCell> 
                    <asp:Label ID="lblItemBeingSold" runat="server" Text="Items Being Sold"></asp:Label> 
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtItemsSell" runat="server" Width="250px" Height="20px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnAddItemtoList" runat="server" Text="Add Item" OnClick="btnAddItemtoList_Click" Height="25px" Font-Bold="true" ForeColor="White"  BackColor="#325f57" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtDisplayItemsSell" runat="server" TextMode="MultiLine" Height="200px" Width="200px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
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
                    <asp:CheckBoxList ID="chkNeedSch" runat="server" AutoPostBack="true">
                        <asp:ListItem ID="chkBringIn" runat="server" Value="Bring In" Text="Move Assessment"></asp:ListItem>
                        <asp:ListItem ID="chkPickUp" runat="server" Value="Appraisal" Text="Pick Up"></asp:ListItem>
                        <asp:ListItem ID="chkTrashRemoval" runat="server" Value="Move" Text="Trash Removal"></asp:ListItem>
                    </asp:CheckBoxList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                 <asp:TableCell>
                     <asp:CheckBox ID="chkAuctionWalkthrough" runat="server" Text="Auction Look At" AutoPostBack="true" OnCheckedChanged="chkAuctionWalkthrough_CheckedChanged"/>
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
    <div class="divNaviagtion" id="divNav" runat="server" style="width: auto; margin: 0 20% " visible="false">
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnCommitIntialAuction" class= "btn-GreenValleyGreen" runat="server" Text="Save" OnClick="btnCommitIntialAuction_Click" Height="25px" Width="75px" Font-Bold="true" ForeColor="White"  BackColor="#325f57" />
                </asp:TableCell>
            </asp:TableRow>
            
        </asp:Table>
        </div>
</asp:Content>
