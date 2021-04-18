<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Lab2.Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--    <asp:Table ID="tblViewServices" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnPopulateInv" runat="server" Text="Populate"  OnClick="btnPopulateInv_Click" CausesValidation ="false"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
            </asp:TableCell>
        </asp:TableRow>
             
    </asp:Table>--%>



    <div style="width: auto; margin: 0 20%;">

        <asp:Table ID="tblTitle" runat="server" Width="773px">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="title" runat="server" Text="Move Inventory" Font-Bold="true" Font-Size="Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Table ID="Table5" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView runat="server" ID="grdvwServDisplay" EmptyDataText="No Service Selected!"></asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <%--       <asp:Table ID="tblDropInv" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDropDownListnv" runat="server" Text="Choose a Service to View Inventory For"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlInv" runat="server" AutoPostBack="true" DataSourceID="datasrcInvList"
                        DataTextField="fullDate"
                        DataValueField="CustomerID"
                        OnSelectedIndexChanged="ddlInv_SelectedIndexChanged1"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>--%>

        <%--        <asp:SqlDataSource ID="datasrcInvList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" SelectCommand="SELECT Customer.CustLastName + ' ' + Service.ServiceDate as fullDate, Customer.CustomerID FROM Customer INNER JOIN Service ON Customer.CustomerID = Service.CustomerID WHERE Service.ServiceType = 'Move'"></asp:SqlDataSource>--%>


        <asp:Table ID="Table1" runat="server" Width="654px">

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirstName" runat="server" ReadOnly="true"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtFirstName" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLastName" runat="server" ReadOnly="true"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtLastName" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblItemName" runat="server" Text="Item Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtItemName1" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtItemName1" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblItemCost" runat="server" Text="Item Cost"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtItemCost1" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="txtItemCost1" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Entry Can be only numbers" />
                </asp:TableCell></asp:TableRow><asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblInventoryDate" runat="server" Text="Inventory Date"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtInventoryDate1" runat="server" TextMode="Date"></asp:TextBox>
                </asp:TableCell><asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtInventoryDate1" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell><asp:TableCell>
                    <asp:CompareValidator ID="CompareValidator14" runat="server" Operator="DataTypeCheck" Type="Date"
                        ControlToValidate="txtInventoryDate1" ForeColor="Red" ErrorMessage="MM/DD/YYYY" />
                </asp:TableCell></asp:TableRow><asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtServiceID1" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtCustID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell></asp:TableRow><asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="btnAddInv" class="btn-GreenValleyGreen" runat="server" Text="Add" OnClick="btnAddInv_Click" />
                </asp:TableCell><asp:TableCell>
                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                </asp:TableCell></asp:TableRow><asp:TableRow HorizontalAlign="center">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="btnViewAllInv" class="btn-GreenValleyGreen" runat="server" Text="View All Items in Inventory for this Customer" OnClick="btnViewAllInv_Click" CausesValidation="false" />
                </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="Table2" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView ID="grdviewInvDisplay" runat="server"></asp:GridView>
                </asp:TableCell></asp:TableRow></asp:Table><%--                        <asp:Table ID="tblTxtBox" runat="server" Style="position:fixed; top: 80px; right: 100px;">
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
        </asp:Table>--%></div></asp:Content>