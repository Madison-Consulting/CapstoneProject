<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="CustomerSearch.aspx.cs" Inherits="Lab3.CustomerSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                    <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label ID="lblSearch" runat="server" Text="Enter Customer Name : "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2">
                        <asp:TextBox ID="txtSearch" runat="server" Width="200"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblSearchStatus" runat="server" Text="" Width="200"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="tblListBox" runat="server" Width="391px" Height="275px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:ListBox ID="lstBoxViewDetails" runat="server" Width="800" AutoPostBack="true" ></asp:ListBox>      
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>


</asp:Content>
