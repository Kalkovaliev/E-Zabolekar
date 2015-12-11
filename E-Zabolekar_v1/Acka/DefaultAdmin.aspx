<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DefaultAdmin.aspx.cs" Inherits="Acka.DefaultAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <style>
        
.carousel-control.left,.carousel-control.right{
  background-image:none;
}


.carousel {
  height: 341px;
  margin-bottom: 60px;
}

.carousel-caption {
  z-index: 10;
}

.carousel .item {
  height: 400px;
  top:10px;
 // background-color: #777;
}
    
.carousel-inner > .item > img {
  position: absolute;
  top: 0;
  left: 0;
  min-width: 100%;
  height: 400px;
}
        </style>
  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="padding-top:1%">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/slika.jpg" alt="Chania">
    </div>

    <div class="item">
      <img src="images/slika.jpg" alt="Chania">
    </div>

    <div class="item">
      <img src="images/slika.jpg" alt="Flower">
    </div>

    <div class="item">
      <img src="images/slika.jpg" alt="Flower">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
       
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <%--<asp:Button ID="Button1" runat="server" Text="Logout momentalen" OnClick="logout" />--%>
    <asp:Label ID="lblPoraka" runat="server" Text=" "></asp:Label>
    <br />
    <br />


        

</asp:Content>
