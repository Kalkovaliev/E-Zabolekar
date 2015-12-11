<%@ Page Title="Почетна" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Acka._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  

    <style>
        .carousel-control.left, .carousel-control.right {
            background-image: none;
        }


        .carousel {
            height: 341px;
            margin-bottom: 60px;
            padding-top:1%;
        }

        .carousel-caption {
            z-index: 10;
      
        }

        .carousel .item {
            height: 400px;
            top: 10px;
           
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
    <div id="myCarousel" class="carousel slide" data-ride="carousel" >
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
                <img src="images/slika1.jpg" alt="Chania">
            </div>

            <div class="item">
                <img src="images/slika2.jpg" alt="Flower">
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

    <div class="jumbotron">
        <p style="font-size: 50px">ДОБРЕДОЈДОВТЕ</p>
        
        <p style="font-size: 20px">Нашите заболекари ке се погрижат за вашите расипани заби :)</p>
    </div>

    <br />
    <br />
    
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Последни новости</h3>
                    </div>
                    
                        
                        <div class="list-group">
                                <asp:PlaceHolder ID="placeZanovosti" runat="server"></asp:PlaceHolder>
                        </div>
                    
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Анкети</h3>
                    </div>
                    <div class="panel-body">
                        Нема активни анкети моментално.
                    </div>
                </div>
            </div>
        </div>

    </div>


    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" ViewStateMode="Enabled" Visible="False">
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
    
    <%-- <asp:Button ID="Button1" runat="server" Text="Logout momentalen" OnClick="logout" />--%>
    <asp:Label ID="lblPoraka" runat="server" Text=" "></asp:Label>
    <br />
    <br />




</asp:Content>
