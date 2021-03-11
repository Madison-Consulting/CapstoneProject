<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="Lab3.Notifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell>
                <asp:Label ID="lblNotifications" runat="server" Text="Notifications"></asp:Label>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell>
                <asp:ListBox ID="lstNotifications" runat="server" Width="800" OnLoad="lstNotifications_Load"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnAddInitialContact" runat="server" Text="Add Initial Contact Info" OnClick="btnAddInitialContact_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
