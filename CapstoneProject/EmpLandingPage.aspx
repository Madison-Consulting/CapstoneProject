<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EmpLandingPage.aspx.cs" Inherits="CapstoneProject.EmpLandingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20% ">
                <asp:Table ID="Table1" runat="server">
                          <asp:TableRow>
                      <asp:TableCell>
                          <asp:Label ID="lblCustSearch" runat="server" Text="Search by Customer Name (First or Last)"></asp:Label>
                      </asp:TableCell>
                      <asp:TableCell>
                          <asp:TextBox ID="txtCustSearch" runat="server"></asp:TextBox>
                      </asp:TableCell>
                      <asp:TableCell>
                          <asp:Button ID="btnSearch" class= "btn-GreenValleyGreen" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="false"/>
                      </asp:TableCell>
                      </asp:TableRow>
                  <asp:TableRow>
                      <asp:TableCell>
                          <asp:Label ID="lblSearchStatus" runat="server" Text=""></asp:Label>
                      </asp:TableCell>
                  </asp:TableRow>
            </asp:Table>
        <asp:Table ID="Table2" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName1" runat="server" Text="First Name: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName1" runat="server" Text="Last Name: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPhoneNo1" runat="server" Text="Phone Number: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblPhoneNo" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmail1" runat="server" Text="Email: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAddress1" runat="server" Text="Address: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCity1" runat="server" Text="City: "></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lblCity" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblState1" runat="server" Text="State: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblState" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblZip1" runat="server" Text="Zip Code: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblZip" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCustomerID1" runat="server" Text="Customer ID: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblCustomerID" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                    </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="btnSelect" runat="server" Text="Select this Customer" class="btn-GreenValleyGreen" />
                    </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
<%--        <asp:Table ID="tblLanding" runat="server" Height="329px" Width="499px" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                    <asp:Image ID="LogoFadded" runat="server" ImageUrl="/Image/GVALogoFadded.jpg" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>--%>

   </div>
</asp:Content>
