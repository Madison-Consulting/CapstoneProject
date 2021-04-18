<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Completion.aspx.cs" Inherits="CapstoneProject.Completion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 20px 20%; position: relative;">
        <asp:Table ID="tblTitle" runat="server" Width="773px">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="title" runat="server" Text="Completion Form" Font-Bold="true" Font-Size="Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Table ID="Table1" runat="server" Width="452px">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl1" runat="server" Text="Customer First Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFN" runat="server" ReadOnly="true"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RFVtxtFN" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtFN" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtFN" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*" ForeColor="Red" ></asp:RegularExpressionValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl2" runat="server" Text="Last Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLN" runat="server" ReadOnly="true"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RFVtxtLN" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtLN" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtLN" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*" ForeColor="Red" ></asp:RegularExpressionValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl" runat="server" Text="Phone Number:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RFVtxtPhoneNo" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtPhoneNo" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid Phone number"
                        ControlToValidate="txtPhoneNo" ForeColor="Red" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"></asp:RegularExpressionValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl3" runat="server" Text="Customer Email:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                     <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                             ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAddress" runat="server" Text="Move Address"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtAddress" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAddress2" runat="server" Text="Move Address 2"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCity" runat="server" Text="Move City"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtCity" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtCity" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*" ForeColor="Red" ></asp:RegularExpressionValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblState" runat="server" Text=" Move State"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtState" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtState" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*" ForeColor="Red" ></asp:RegularExpressionValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblZip" runat="server" Text="Move Zip Code"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtZip" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="txtZip" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Enter Valid Zip Code" />

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl4" runat="server" Text="Service Type:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtServType" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtServType" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl5" runat="server" Text="Service Date:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtDate" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFinalCost" runat="server" Text="Final Cost:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFinalCost" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtFinalCost" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="txtFinalCost" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Entry can be only numbers" />

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPaymentRec" runat="server" Text="Payment Received?"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rdoYN" runat="server">
                        <asp:ListItem Value="Yes" Selected="True">Yes</asp:ListItem>
                        <asp:ListItem Value="No">No</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblComments" runat="server" Text="Comments:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="15" Height="130px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="valGroup1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtDate" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblExperince" runat="server" Text="Service Experience?"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rdobtnPosNeg" runat="server">
                        <asp:ListItem Value="Positive" Selected="True">Positive</asp:ListItem>
                        <asp:ListItem Value="Negative">Negative</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtCustID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow HorizontalAlign="center">
                <asp:TableCell ColumnSpan="3">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="valGroup1" class="btn-GreenValleyGreen" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtServID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
