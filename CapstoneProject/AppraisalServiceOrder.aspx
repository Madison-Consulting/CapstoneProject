<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AppraisalServiceOrder.aspx.cs" Inherits="CapstoneProject.AppraisalServiceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20%;"">

        <asp:Table ID="tblTitle" runat="server" Width="773px">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="title" runat="server" Text="Appraisal Service Order Form" Font-Bold="true" Font-Size="Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

<%--                <asp:Table ID="tblTxtBox" runat="server" Style="position:fixed; top: 206px; right: 329px;" Width="120px">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="8" Width="250px"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>--%>

            <asp:Table ID="Table3" runat="server" Style="left:250px; top: 100px; margin:10px;" Width="700px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtFirstName" runat="server" ReadOnly="true"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtFirstName" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtLastName" runat="server" ReadOnly="true"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtLastName" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
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
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter valid Phone number" 
                            ControlToValidate="txtPhoneNo" Forecolor="Red" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ></asp:RegularExpressionValidator> 

                     </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtPhoneNo" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                         <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtEmail" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell><asp:TableCell>
                         <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                             ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                     </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                          <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtAddress" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                       <asp:TableCell>
                        <asp:Label ID="lblAddress2" runat="server" Text="Address Line 2"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                          <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                         <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtCity" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell><asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtCity" ValidationExpression="^[A-Za-z]*$" ForeColor="Red" ></asp:RegularExpressionValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                          <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                            ControlToValidate="txtState" ValidationExpression="^[A-Za-z]*$" ForeColor="Red" ></asp:RegularExpressionValidator>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtState" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblZip" runat="server" Text="Zip Code"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                         <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="txtZip" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Entry can be only numbers" />
                    </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="tblAppraisalAssessment" runat="server" Width="551px"  Style="top:360px; left: 250px; margin:10px;">
          <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPurpose1" runat="server" Text="Purpose of Appraisal"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                         <asp:RadioButtonList ID="rdoPurpose" runat="server" >
                            <asp:ListItem Value="Estate Appraisal">Estate Appraisal</asp:ListItem>
                            <asp:ListItem Value="Family Division Appraiasal">Family Division Appraiasal</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDeadline" runat="server" Text="Is there a deadline?"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                          <asp:RadioButtonList ID="rdobtnDeadline" runat="server" >
                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                            <asp:ListItem Value="no">No</asp:ListItem>
                        </asp:RadioButtonList>
                      </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDeadline1" runat="server" Text="What is the deadline?"></asp:Label>
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtDeadline1" runat="server" TextMode="Date"></asp:TextBox>
            </asp:TableCell><asp:TableCell>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtDeadline1" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblSize" runat="server" Text="Size of Appraisal"></asp:Label>
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtSize" runat="server"></asp:TextBox>
            </asp:TableCell><asp:TableCell>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtSize" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>

            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhotos" runat="server" Text="Photos"></asp:Label>
            </asp:TableCell><asp:TableCell>
                <asp:FileUpload ID="upldPhoto" runat="server" allowmultiple="true" accept=".png,.jpg,.jpeg,.gif,.svg,.jfif" />
            </asp:TableCell><asp:TableCell>
                <asp:Button ID="btnUpload" class= "btn-GreenValleyGreen" runat="server" Text="Upload" OnClick="btnUpload_Click" CausesValidation="false" />
            </asp:TableCell><asp:TableCell>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblInventory" runat="server" Text="Inventory"></asp:Label>
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtInventory" runat="server" TextMode="MultiLine" Rows="1"></asp:TextBox>
            </asp:TableCell></asp:TableRow><asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="Save" runat="server" Text="Save" class="btn-GreenValleyGreen" OnClick="Save_Click"/>
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>
                    <asp:Label ID="lblSaveStatus" runat="server" Text=""></asp:Label>
            </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="Table1" runat="server" style="margin:20px;">
        <asp:TableRow>
            
            <asp:TableCell>
                <asp:Label ID="lblAddlServ" runat="server" Text="Additional Services?"></asp:Label>
            </asp:TableCell><asp:TableCell>
                <asp:Button ID="btnMoveAssess" class= "btn-GreenValleyGreen" runat="server" Text="Move Assessment" OnClick="btnMoveAssess_Click" CausesValidation="false" />
            </asp:TableCell><asp:TableCell>
                <asp:Button ID="btnAuctionAssess" class= "btn-GreenValleyGreen" runat="server" Text="Auction Assessment" OnClick="btnAuctionAssess_Click" CausesValidation="false"/>
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtCustomerID" runat="server" Visible="false"></asp:TextBox>
            </asp:TableCell></asp:TableRow></asp:Table></div></asp:Content>