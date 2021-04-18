<%@ Page Title="Edit/View Customer" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditCust.aspx.cs" Inherits="Lab2.EditCust" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--            Form to Add Customer Data--%>
    <div style="width: auto; margin: 20px 20%; left: 450px;">
        <%--        <asp:Table ID="Table3" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDropDown" runat="server" Text="Choose a Customer to View"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" DataSourceID="datasrcCustomerList"
                        DataTextField="fullName"
                        DataValueField="CustomerID"
                        OnSelectedIndexChanged="CustDropDownList_SelectedIndexChanged"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCustSearch" runat="server" Text="Search by Customer Name (First or Last)"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCustSearch" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnSearch" class="btn-GreenValleyGreen" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="false" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblSearchStatus" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>--%>

        <%--                <asp:Table ID="Table5" runat="server">
                  <asp:TableRow>
                      <asp:TableCell>
                    <asp:GridView runat="server" ID="grdvwCustDisplay" AutoPostBack = "true" EmptyDataText = "No Customer Selected!" ></asp:GridView>
                         </asp:TableCell>
                    </asp:TableRow>
                 </asp:Table>
            
                      <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" SelectCommand="SELECT CustFirstName + ' ' + CustLastName as fullName, CustomerID from Customer"></asp:SqlDataSource>

                      <asp:SqlDataSource ID="datasrcServID" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" SelectCommand="SELECT ServiceID from Service"></asp:SqlDataSource>--%>

        <asp:Table ID="tblTitle" runat="server" Width="773px">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="title" runat="server" Text="Edit Customer" Font-Bold="true" Font-Size="Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Table ID="tblEditCust" runat="server" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtFirstName" SetFocusOnError="true" ForeColor="Red" Text="No Numbers or Special Characters!"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtLastName" SetFocusOnError="true" ForeColor="Red" Text="No Numbers or Special Characters!"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPhoneNo" runat="server" Text="Phone Number"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtPhoneNo" SetFocusOnError="true" ForeColor="Red" Text="FieldText Cannot Be Blank!"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid Phone number" 
                            ControlToValidate="txtPhoneNo" Forecolor="Red" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ></asp:RegularExpressionValidator> 
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </asp:TableCell><asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" Text="FieldText Cannot Be Blank!"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                     <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                             ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </asp:TableCell><asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtAddress" SetFocusOnError="true" ForeColor="Red" Text="FieldText Cannot Be Blank!"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAddress2" runat="server" Text="Address Line 2"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                </asp:TableCell><asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtCity" SetFocusOnError="true" ForeColor="Red" Text="No Numbers or Special Characters!"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                </asp:TableCell><asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtState" SetFocusOnError="true" ForeColor="Red" Text="No Numbers or Special Characters!"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblZip" runat="server" Text="Zip Code"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                </asp:TableCell><asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtZip" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell><asp:TableCell>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="txtZip" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Entry Can Only Be Numbers!" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCustomerID" runat="server" Text="Customer ID"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="true"></asp:TextBox>
                </asp:TableCell><asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtCustomerID" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="btnUpdateCust" runat="server" class="btn-GreenValleyGreen" Text="Update Customer" OnClick="btnUpdateCust_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblStatus1" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <%--            <asp:TableRow HorizontalAlign="center">
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="btnAddService" class="btn-GreenValleyGreen" runat="server" Text="Add a Service for this Customer" OnClick="btnAddService_Click" CausesValidation="false" />
                </asp:TableCell>
            </asp:TableRow>--%><%--                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2">
                         <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" />
                    </asp:TableCell>
                </asp:TableRow>--%>
        </asp:Table>
        <%--        <asp:Table ID="tblTxtBox" runat="server" Style="position: fixed; top: 80px; right: 150px;">
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
        </asp:Table>--%>
    </div>
</asp:Content>
