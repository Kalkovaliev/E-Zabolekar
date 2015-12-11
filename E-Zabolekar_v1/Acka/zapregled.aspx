<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="zapregled.aspx.cs" Inherits="Acka.zapregled" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="За да закажете термин мора прво да се најавите!!"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Button ID="btnnajava" runat="server" Text="Најава" OnClick="btn_najava" />

</asp:Content>
