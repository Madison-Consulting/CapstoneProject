<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="IntialAuctionService.aspx.cs" Inherits="CapstoneProject.IntialAuctionService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20% ">
        <asp:Table runat="server">
            <asp:TableRow ID="IntialAuctionTable" runat="server">
                <asp:TableCell>
                    <asp:Label ID="lblItemBeingSold" runat="server" Text="Items Being Sold"></asp:Label> 

                </asp:TableCell>
                <asp:TableCell>
<%--                    Notes--%>
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
                    <asp:RadioButton ID="rbtnDeadN" runat="server" Text="No" />
                    &nbsp&nbsp&nbsp
                    <asp:RadioButton ID="rbtnDeadY" runat="server" Text="Yes" />
                    &nbsp&nbsp&nbsp
                    <asp:TextBox ID="txtDeadDate" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblBringIn" runat="server" Text="Bring In: "></asp:Label>
                    <asp:RadioButton ID="rbtnBringIn" runat="server" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblPickUp" runat="server" Text="Pick Up: "></asp:Label>
                    <asp:RadioButton ID="rbtnPickUp" runat="server" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblWalkthr" runat="server" Text="Walk Through Needed: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    &nbsp&nbsp&nbsp<asp:RadioButton ID="rbtnWY" runat="server" Text="Yes" />
                </asp:TableCell>
                <asp:TableCell>
                   <asp:RadioButton ID="rbtnWN" runat="server" Text="No" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>

                </asp:TableCell>
            </asp:TableRow>

        </asp:Table>


    </div>
</asp:Content>
