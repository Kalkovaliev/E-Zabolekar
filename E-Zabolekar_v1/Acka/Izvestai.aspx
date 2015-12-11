<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Izvestai.aspx.cs" Inherits="Acka.Izvestai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script>
       
        </script>


    <asp:Label ID="lblError" runat="server"></asp:Label>
       <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    <div id="page-wrapper">
        <asp:Label ID="poraka" runat="server" Text="Label" Visible="false"></asp:Label>
        

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Статистика на завршени прегледи</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <asp:PlaceHolder ID="siteKursevi" runat="server"></asp:PlaceHolder>

                                <div>Сите прегледи</div>
                            </div>
                        </div>
                    </div>
                    <a runat="server" id="zasite">
                        <div class="panel-footer">
                            <span class="pull-left">Види детали</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <asp:PlaceHolder ID="noviKursevi" runat="server"></asp:PlaceHolder>

                                <div>Последна недела</div>
                            </div>
                        </div>
                    </div>
                    <a runat="server" id="zanovi">
                        <div class="panel-footer">
                            <span class="pull-left">Види детали</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <asp:PlaceHolder ID="posledenMesec" runat="server"></asp:PlaceHolder>

                                <div>Последен месец</div>
                            </div>
                        </div>
                    </div>
                    <a runat="server" id="zaposledenmesec">
                        <div class="panel-footer">
                            <span class="pull-left">Види детали</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <asp:PlaceHolder ID="postariKursevi" runat="server"></asp:PlaceHolder>

                                <div>Постари прегледи</div>
                            </div>
                        </div>
                    </div>
                    <a ID="zapostari" runat="server">
                        <div class="panel-footer">
                            <span class="pull-left">Види детали</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="panel panel-primary" id="pan" runat="server" visible="false">
            <div class="panel-heading">
                <h3 class="panel-title">Сите прегледи</h3>
            </div>
            <div class="panel-body">
                <asp:PlaceHolder ID="sitepreglediPlace" runat="server"></asp:PlaceHolder>
            </div>
        </div>

        <div class="panel panel-success" id="pan1" runat="server" visible="false">
            <div class="panel-heading">
                <h3 class="panel-title">Последна недела</h3>
            </div>
            <div class="panel-body">
              <asp:PlaceHolder ID="novipreglediPlace" runat="server"></asp:PlaceHolder>
            </div>
        </div>

        <div class="panel panel-warning" id="pan2" runat="server" visible="false">
            <div class="panel-heading" style="background-color: #f0ad4e">
                <h3 class="panel-title">Последен месец</h3>
            </div>
            <div class="panel-body">
                <asp:PlaceHolder ID="posledenmesecPlace" runat="server"></asp:PlaceHolder>
            </div>
       
        </div>

        <div class="panel panel-danger" id="pan3" runat="server" visible="false">
            <div class="panel-heading">
                <h3 class="panel-title">Постари прегледи</h3>
            </div>
            <div class="panel-body">
                <asp:PlaceHolder ID="postaripreglediPlace" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    
   
        
         <div class="row" style="padding-top:5%">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i>Месечен извештај
                           
                        <div class="pull-right">
                            
                        </div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area-chart"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>

                   </div>
               <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i>Статистика 
                       
                    </div>
                    <div class="panel-body">
                        <div id="morris-donut-chart"></div>
                        <a href="#" class="btn btn-default btn-block">Види детали</a>
                    </div>
                     </div>
                </div>
            </div>
             
        </div>  
 


      <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="bower_components/raphael/raphael-min.js"></script>
    <script src="bower_components/morrisjs/morris.min.js"></script>
    <script src="js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>



</asp:Content>
