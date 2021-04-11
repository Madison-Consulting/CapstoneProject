<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="testNotifications.aspx.cs" Inherits="CapstoneProject.testNotifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblReqServ" runat="server" Text="Requested Services" Font-Bold="true"></asp:Label>
            </asp:TableCell>
                    <asp:TableCell>
                     <asp:dropDownList ID="ddlNotifs" runat="server" AutoPostBack="true" DataSourceID="datasrcNotifsList" 
                         DataTextField="fullName" 
                         DataValueField="CustomerID" 
                         AppendDataBoundItems="true" OnSelectedIndexChanged="ddlNotifs_SelectedIndexChanged">
                         <asp:ListItem Value="">- Select -</asp:ListItem>
                     </asp:dropDownList>
                    </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lbl1" runat="server" Text="Customer First Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblFN" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lbl2" runat="server" Text="Customer Last Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblLN" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lbl3" runat="server" Text="Customer Email:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lbl4" runat="server" Text="Service Type:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblServiceType" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lbl5" runat="server" Text="Service Date:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lbl6" runat="server" Text="Status:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lbl7" runat="server" Text="Details:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblDetails" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnAddInitial" class= "btn-GreenValleyGreen" runat="server" Text="Add Initial Contact Information for this Customer" OnClick="btnAddInitial_Click"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnAddService" class= "btn-GreenValleyGreen" runat="server" Text="Add a Service for this Customer" OnClick="btnAddService_Click"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCustID" runat="server" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

<asp:SqlDataSource ID="datasrcNotifsList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" SelectCommand="SELECT Customer.CustFirstName + ' ' + Customer.CustLastName + ': ' + ServiceRequest.ServiceType + ' ' +  ServiceRequest.ServiceDate as fullName, Customer.CustomerID from Customer INNER JOIN ServiceRequest ON Customer.CustomerID = ServiceRequest.CustomerID WHERE TicketStatus = 'Unassigned';"></asp:SqlDataSource>

</asp:Content>
