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
                <asp:Label ID="lblCustomer" runat="server" Text="Customer"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <%--Get Defult Value For DropDown--%>
                <asp:DropDownList ID="ddlCustomer" runat="server"
                    DataSourceID="dtasrcCustomer"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    AppendDataBoundItems="true">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblAddCustomer" runat="server" Text="or Add New"></asp:Label>
                <asp:Button ID="btnAddCustomer" Font-Bold="true" BackColor="#26754e" ForeColor="White" runat="server" Text="+" PostBackUrl="~/AddCust2.aspx" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblHomeType" runat="server" Text="Type of Building: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
                <asp:DropDownList ID="ddlHomeType" runat="server" AutoPostBack="true">
                    <asp:ListItem>Select Type</asp:ListItem>
                    <asp:ListItem>Apartment</asp:ListItem>
                    <asp:ListItem>House</asp:ListItem>
                    <asp:ListItem>Storage Unit</asp:ListItem>
                    <asp:ListItem>Place of Business</asp:ListItem>
                </asp:DropDownList>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDriveway" runat="server" Text="Driveway accessibility: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDriveway" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDistance" runat="server" Text="How far is the walk to the door: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDistance" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMoveSteps" runat="server" Text="Steps leading up to the house: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMoveSteps" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblLoad" runat="server" Text="Loading conditions: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtLoad" runat="server" TextMode="MultiLine" Rows="15" Width="250px" Height="140"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                 <br />
        <br />
                <asp:Label ID="lblSpecEquip" runat="server" Text="Special Equipment: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
                 <br />
        <br />
                <asp:RadioButtonList ID="rdoSpecEquip" runat="server" AutoPostBack="true">
                    <asp:ListItem>Appliance Cart</asp:ListItem>
                    <asp:ListItem>Piano Dolly</asp:ListItem>
                    <asp:ListItem>Piano Board</asp:ListItem>
                    <asp:ListItem>Gun Safe Cart</asp:ListItem>
                    <asp:ListItem>Extra Blankets</asp:ListItem>
                </asp:RadioButtonList>

            </asp:TableCell>
        </asp:TableRow>



        <asp:TableRow>
            <asp:TableCell>
                 <br />
                  <br />

                <asp:Label ID="lblMoveTrucks" runat="server" Text="Special Equipment: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
        <br />
        <br />
                <asp:RadioButtonList ID="rdoMovetrucks" runat="server" AutoPostBack="true">
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>Cube</asp:ListItem>
                    <asp:ListItem>Enclosed Trailer</asp:ListItem>
                    <asp:ListItem>Open Trailer</asp:ListItem>
                    <asp:ListItem>Van</asp:ListItem>
                </asp:RadioButtonList>

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

        <asp:SqlDataSource runat="server"
        ID="dtasrcCustomer"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT Customer.CustomerID, Customer.CustFirstName + ' ' + Customer.CustLastName AS CustomerName FROM Customer;" >
    </asp:SqlDataSource>

        </div>
</asp:Content>
