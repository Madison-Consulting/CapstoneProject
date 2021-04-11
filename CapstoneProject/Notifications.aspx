<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="Lab3.Notifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 684px; margin: 0 10%">
    <asp:Table ID="Table1" runat="server" Width="700px">
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
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell>
                <asp:Button ID="btnAddInitialContact"  class= "btn-GreenValleyGreen" runat="server" Text="Add Initial Contact Info" OnClick="btnAddInitialContact_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        </div>
</asp:Content>
