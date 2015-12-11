<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Acka.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            background: url('images/back.png');
            background-color: #444;
            background: url('images/pinlayer2.png'),url('images/pinlayer1.png'),url('images/back.png');
        }

        .vertical-offset-100 {
            padding-top: 100px;
        }



        .panel-login {
            border-color: #ccc;
            -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
            -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
            box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
        }

            .panel-login > .panel-heading {
                color: #00415d;
                background-color: #fff;
                border-color: #fff;
                text-align: center;
            }

                .panel-login > .panel-heading a {
                    text-decoration: none;
                    color: #666;
                    font-weight: bold;
                    font-size: 15px;
                    -webkit-transition: all 0.1s linear;
                    -moz-transition: all 0.1s linear;
                    transition: all 0.1s linear;
                }

                    .panel-login > .panel-heading a.active {
                        color: #029f5b;
                        font-size: 18px;
                    }

                .panel-login > .panel-heading hr {
                    margin-top: 10px;
                    margin-bottom: 0px;
                    clear: both;
                    border: 0;
                    height: 1px;
                    background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
                    background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
                    background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
                    background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
                }

            .panel-login input[type="text"], .panel-login input[type="email"], .panel-login input[type="password"] {
                height: 45px;
                border: 1px solid #ddd;
                font-size: 16px;
                -webkit-transition: all 0.1s linear;
                -moz-transition: all 0.1s linear;
                transition: all 0.1s linear;
            }

            .panel-login input:hover,
            .panel-login input:focus {
                outline: none;
                -webkit-box-shadow: none;
                -moz-box-shadow: none;
                box-shadow: none;
                border-color: #ccc;
            }



        .btn-register {
            background-color: #1CB94E;
            outline: none;
            color: #fff;
            font-size: 14px;
            height: auto;
            font-weight: normal;
            padding: 14px 0;
            text-transform: uppercase;
            border-color: #1CB94A;
        }

            .btn-register:hover,
            .btn-register:focus {
                color: #fff;
                background-color: #1CA347;
                border-color: #1CA347;
            }

        .colorgraph {
            height: 5px;
            border-top: 0;
            background: #c4e17f;
            border-radius: 5px;
            background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
        }
    </style>

    <webopt:BundleReference runat="server" Path="~/Content/css" />

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="Scripts/TweenLite.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $("#register-form").hide();
                $(document).mousemove(function (event) {

                    TweenLite.to($('body'),

                    .5,

                    {
                        css:

                        {

                            backgroundPosition: "" + parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / '12') + "px, " + parseInt(event.pageX / '15') + "px " + parseInt(event.pageY / '15') + "px, " + parseInt(event.pageX / '30') + "px " + parseInt(event.pageY / '30') + "px"

                        }

                    });

                });
                $("#btnLogIn").click(function () {
                    $("#txtUserName").prop('required', true);
                    $("#txtPassword").prop('required', true);

                });
                $("#RegisterSubmit").click(function () {
                    $("#txtFirstName").prop('required', true);
                    $("#txtLastName").prop('required', true);
                    $("#txtUsernam").prop('required', true);
                    $("#txtPasswordd").prop('required', true);
                    
                    $("#txtTelefone").prop('required', true);
                    $("#txtLocation").prop('required', true);

                });
              

                var pickerOpts = {
                    dateFormat: "dd-mm-yy"
                };
                $("#txtDadumRaganje").datepicker(pickerOpts);

                //$("#RegisterSubmit").click(function () {
                //    $("#txtFirstName").prop('required', true);
                //    $("#txtLastName").prop('required', true);
                //    $("#txtEmail").prop('required', true);
                //    $("#txtPasswordRegister").prop('required', true);
                //    $("#txtConfirmPassword").prop('required', true);
                //    $("#txtDadumRaganje").prop('required', true);
                //});
            });
            //$(function () {

            //    $('#login-form-link').click(function (e) {
            //        $("#login-form").delay(100).fadeIn(100);
            //        $("#register-form").fadeOut(100);
            //        $('#register-form-link').removeClass('active');
            //        $(this).addClass('active');
            //        e.preventDefault();
            //    });
            //    $('#register-form-link').click(function (e) {
            //        $("#register-form").delay(100).fadeIn(100);
            //        $("#login-form").fadeOut(100);
            //        $('#login-form-link').removeClass('active');
            //        $(this).addClass('active');
            //        e.preventDefault();
            //    });

            //});


       
        </script>

        <div class="container" style="padding-top: 50px">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <span style="font-size: x-large; font-weight: bold">Login/Register</span>

                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" role="form" style="display: block;">
                                          <div ID="greska" runat="server" visible="false" class="alert alert-dismissible alert-danger">
  <button type="button" class="close" data-dismiss="alert">×</button>
  <strong>
 <asp:Label ID="lblPoraka1" runat="server" Text=""></asp:Label>
      </strong>
</div>

                                       
                                        <div class="form-group">
                                            <asp:TextBox ID="txtUserName" class="form-control" placeholder="Username" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPassword" class="form-control" placeholder="Password" name="password" type="password" value="" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:CheckBox ID="isKorisnik" runat="server" Text="Корисник" />
                                        <asp:Button ID="btnLogIn" runat="server" class="btn btn-lg btn-success btn-block" Text="Login" OnClick="btnLogIn_Click" />
                                        <!--OnClick="btnLogIn_Click"-->


                                        <div style="padding-top: 20px" role="form">
                                            <hr class="colorgraph">
                                            <div class="form-group">
                                                <asp:TextBox TabIndex="1" class="form-control" placeholder="First Name" ID="txtFirstName" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox TabIndex="1" class="form-control" placeholder="Last Name" ID="txtLastName" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox TabIndex="1" class="form-control" placeholder="Username" ID="txtUsernam" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox type="password" value="" TabIndex="1" class="form-control" placeholder="Password" ID="txtPasswordd" runat="server"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <asp:TextBox ID="txtTelefone"  TabIndex="2" class="form-control" placeholder="Telefone" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox TabIndex="3" ID="txtLocation" class="form-control" placeholder="Location" runat="server"></asp:TextBox>
                                            </div>

                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-sm-6 col-sm-offset-3">
                                                        <asp:Button Style="display: block;" runat="server" ID="RegisterSubmit" class="form-control btn btn-register" Text="Register Now" Font-Bold="True" OnClick="btnRegister_Click" />
                                                        <!-- OnClick="RegisterSubmit_Click" /> -->

                                                    </div>
                                                </div>
                                            </div>

                                            <asp:Label ID="lblPoraka" runat="server" Text=""></asp:Label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
