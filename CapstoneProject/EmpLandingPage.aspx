﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EmpLandingPage.aspx.cs" Inherits="CapstoneProject.EmpLandingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20%;"">
        
  <%--      add place for customer name--%>


        <asp:Table ID="tblLanding" runat="server" Height="329px" Width="499px" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Right">
                    <asp:Image ID="LogoFadded" runat="server" ImageUrl="/Image/GVALogoFadded.jpg" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

   </div>


</asp:Content>
