<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddServ.aspx.cs" Inherits="Lab2.AddServ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<%--    <asp:Table ID="tblAddServ" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnPopulateServ" runat="server" Text="Populate" OnClick="btnPopulateServ_Click" CausesValidation="false" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnClearServ" runat="server" Text="Clear" OnClick="btnClearServ_Click" CausesValidation="false" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>--%>


    <div style="width: 99%; margin: 0 10%;">
        <asp:Table ID="Table3" runat="server" Width="54%" HorizontalAlign="Center" Style="display: inline-block; margin-right: 0px;">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAddServEvent" runat="server" Text="Add a New Service Event" Font-Size="X-Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblServiceType" runat="server" Text="Service Type:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rdoServType" runat="server">
                        <asp:ListItem ID="chkMoveAsses" runat="server" Value="Move Assessment" Text="Move Assessment"></asp:ListItem>
                        <asp:ListItem ID="chkAuctionLookAt" runat="server" Value="Auction Look At" Text="Auction Look At"></asp:ListItem>
                        <asp:ListItem ID="chkAppraisal" runat="server" Value="Appraisal" Text="Appraisal"></asp:ListItem>
                        <asp:ListItem ID="chkMove" runat="server" Value="Move" Text="Move"></asp:ListItem>
                        <asp:ListItem ID="chkAuctionPickUp" runat="server" Value="Auction Pick Up" Text="Auction Pick Up"></asp:ListItem>
                        <asp:ListItem ID="chkAuctionBringIn" runat="server" Value="Auction Bring In" Text="Auction Bring In"></asp:ListItem>
                        <asp:ListItem ID="chkConsignmentShop" runat="server" Value="Consignment Shop" Text="Consignment Shop"></asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>

            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFN" runat="server" Text="Customer First Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFN" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLN" runat="server" Text="Customer Last Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLN" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
<%--            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCustomer" runat="server" Text="Customer: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlCustomers" runat="server"
                        DataSourceID="dtasrcCustomers"
                        DataTextField="CustName"
                        DataValueField="CustomerID"
                        AutoPostBack="false"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-Select-</asp:ListItem>
                        <asp:ListItem Value="">This is temporary dropdown.</asp:ListItem>
                        <asp:ListItem Value="">we need a search box here</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>--%>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDate" runat="server" Text="Service Date: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate1" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator"
                        ControlToValidate="txtDate1" Operator="DataTypeCheck" Type="Date" ForeColor="Red" Text="Entry must be a Date!"></asp:CompareValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEstCost" runat="server" Text="Estimated Cost"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEstCost1" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="CompareValidator"
                        ControlToValidate="txtEstCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text="Entry must be a monetary value!"></asp:CompareValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCompDate" runat="server" Text="Completion Date"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCompDate1" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="CompareValidator"
                        ControlToValidate="txtCompDate1" Operator="DataTypeCheck" Type="Date" ForeColor="Red" Text="Entry must be a Date!"></asp:CompareValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="btnCommitServ" Font-Bold="true" ForeColor="White" BackColor="#325f57" runat="server" Text="Add Service" OnClick="btnCommitServ_Click" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblStatus1" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <asp:Table ID="tblTxtBox" runat="server" Style="position:fixed; top: 80px; right: 200px;">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="15" Width="250px" Height="200"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtCustomerID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

    </div>
    <asp:SqlDataSource runat="server"
        ID="dtasrcCustomers"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT CustomerID, CustFirstName + ' ' + CustLastName AS CustName FROM Customer">
    </asp:SqlDataSource>
</asp:Content>
