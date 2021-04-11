<%@ Page Title="Move Form" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MovingForm.aspx.cs" Inherits="CapstoneProject.MovingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20% ">
    <asp:Table ID="tblMoving" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPlz" runat="server" Font-Bold="true" Text="Please, provide the following moving information!"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustName" runat="server" Text="Customer Name: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCustName" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStories" runat="server" Text="Stories within house: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtStories" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDistance" runat="server" Text="How far is the street to the house: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDistance" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblLoad" runat="server" Text="Loading conditions: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtLoad" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDriveway" runat="server" Text="Driveway accessibility: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
                <asp:DropDownList ID="ddlDriveway" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDriveway_SelectedIndexChanged">
                    <asp:ListItem>Select Type</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>

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
        </div>
</asp:Content>
