<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MovingForm.aspx.cs" Inherits="CapstoneProject.MovingForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Table ID="tblMoving" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPlz" runat="server" Font-Bold="true" Text="Please, provide the following moving information!"></asp:Label>
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
                <asp:Button ID="btnCommit" runat="server" Text="Commit" OnClick="btnCommit_Click" />
                <asp:LinkButton ID="lnkAnother" runat="server" OnClick="lnkAnother_Click" Visible="False">Create Another</asp:LinkButton>
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click"/>
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
