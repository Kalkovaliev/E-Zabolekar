<%@ Page Title="Мој профил" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MojProfil.aspx.cs" Inherits="Acka.MojProfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>

         body {background: #EAEAEA;}
.user-details {position: relative; padding: 0;}
.user-details .user-image {position: relative;  z-index: 1; width: 100%; text-align: center;}
 .user-image img { clear: both; margin: auto; position: relative;}

.user-details .user-info-block {width: 100%; position: absolute; top: 55px; background: rgb(255, 255, 255); z-index: 0; padding-top: 35px;}
 .user-info-block .user-heading {width: 100%; text-align: center; margin: 10px 0 0;}
 .user-info-block .navigation {float: left; width: 100%; margin: 0; padding: 0; list-style: none; border-bottom: 1px solid #428BCA; border-top: 1px solid #428BCA;}
  .navigation li {float: left; margin: 0; padding: 0;}
   .navigation li a {padding: 20px 30px; float: left;}
   .navigation li.active a {background: #428BCA; color: #fff;}
 .user-info-block .user-body {float: left; padding: 5%; width: 90%;}
  .user-body .tab-content > div {float: left; width: 100%;}
  .user-body .tab-content h4 {width: 100%; margin: 10px 0; color: #333;}
    tr {
        font-size:125%;
    }
         </style>
    <div class="container" style="margin-top: 2%">

      <div class="panel panel-primary" style="padding-bottom:40%">
            <div class="panel-heading">
                <h3 class="panel-title">Мој профил</h3>
            </div>
            <div class="panel-body">
                <div class="container" style="margin-left:33%">
	<div class="row">
		<div class="col-sm-4 col-md-4 user-details">
            <div class="user-image">
                <asp:Image ID="Slika" class="img-circle" style="width:100px;height:100px;" runat="server" />
            </div>
            <div class="user-info-block">
                <div class="user-heading">
                    <asp:PlaceHolder ID="userInfo" runat="server">

                    </asp:PlaceHolder>
                   
                </div>
                <ul class="navigation">
                    <li class="active">
                        <a data-toggle="tab" href="#information">
                            <span class="glyphicon glyphicon-user"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#settings">
                            <span class="glyphicon glyphicon-cog"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#email">
                            <span class="glyphicon glyphicon-envelope"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#events">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </a>
                    </li>
                </ul>
                <div class="user-body">
                    <div class="tab-content">
                        <div id="information" class="tab-pane active">
                            <h3>Податоци за корисник</h3>
                            <asp:PlaceHolder ID="AccountInformation" runat="server"></asp:PlaceHolder>

                        </div>
                        <div id="settings" class="tab-pane">
                            <h3>Опции</h3>
                 <asp:button class="btn btn-primary" data-toggle="modal" data-target="#complete-fak"  runat="server" Text="Промени корисничко име" ></asp:button>
        </br>
                  <asp:button class="btn btn-primary" data-toggle="modal" data-target="#complete-fak1" style="width:87%" runat="server" Text="Промени лозинка" ></asp:button>
       </br>
        
                <asp:button class="btn btn-primary" data-toggle="modal" data-target="#complete-fak2" style="width:87%" runat="server" Text="Промени телефон" ></asp:button>
       <br/>
                <asp:button class="btn btn-primary" data-toggle="modal" data-target="#complete-fak3" style="width:87%"  runat="server" Text="Промени локација" ></asp:button>
  <br/>
                <asp:button class="btn btn-primary" data-toggle="modal" data-target="#complete-fak4" style="width:87%"  runat="server" Text="Промени слика" ></asp:button>

                        </div>
                        <div id="email" class="tab-pane">
                            <h4>Send Message</h4>
                        </div>
                        <div id="events" class="tab-pane">
                            <h4>Events</h4>
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>
     <asp:PlaceHolder ID="UserInfoemation" runat="server" Visible="false"></asp:PlaceHolder>


        <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>


          </div>

      </div>

        

         </div>

    

                            <div id="complete-fak" class="modal fade" tabindex="-1">

            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" >Промени корисничко име</h4>
                    </div>
                    <div class="modal-body" style="padding-top: 5%">
                      
                                             <table> 
                               <tr>
                                    <td>
                                        <asp:Label ID="lblStaroIme" runat="server" Text="Старо корисничко име: "></asp:Label> 


                                    </td> 
                                  
                                   <td> 
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;" ReadOnly="true" class="form-control"  ID="staroIME" runat="server"></asp:TextBox>

                                   </td>

                               </tr>
                               <tr>
                                    <td>
                                        <asp:Label ID="lblNovoIme" runat="server" Text="Ново корисничко име: "></asp:Label>

                                    </td> 
                                   <td> 
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;"  class="form-control"  ID="novoIME" runat="server"></asp:TextBox>

                                   </td>

                               </tr>
                              

                         </table>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Затвори</button>
                        <asp:button type="button" class="btn btn-primary" OnClick="PromeniIme" runat="server" Text="Промени име"></asp:button>
                    </div>

                </div>
            </div>

        </div>

                               <div id="complete-fak1" class="modal fade" tabindex="-1">

            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" >Промени лозинка</h4>
                    </div>
                    <div class="modal-body" style="padding-top: 5%">

                         
                         
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;" placeholder="Стара лозинка" class="form-control" type="password" ID="txtStaraLozinka" runat="server" ></asp:TextBox>

                                 
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;"  placeholder="Нова лозинка" class="form-control"  type="password" ID="txtNovaLozinka" runat="server"></asp:TextBox>

                              
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;" placeholder="Потврди нова лозинка" class="form-control"  type="password"  ID="txtPotvrdiNova" runat="server"></asp:TextBox>

                               
                            

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Затвори</button>
                        <asp:button type="button" ID="Promeni" class="btn btn-primary" OnClick="promeniPassword" runat="server" Text="Промени лозинка"></asp:button>
                    </div>

                </div>
            </div>

        </div>

                               <div id="complete-fak2" class="modal fade" tabindex="-1">

            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" >Додади новост</h4>
                    </div>
                    <div class="modal-body" style="padding-top: 5%">

                                    <table> 
                               <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Претходен телефонски број : "></asp:Label> 


                                    </td> 
                                  
                                   <td> 
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;"  class="form-control" ReadOnly="true" ID="txtStarTelefon" runat="server"></asp:TextBox>

                                   </td>

                               </tr>
                               <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Нов телефонски број: "></asp:Label>

                                    </td> 
                                   <td> 
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;"  class="form-control"  ID="txtNovTelefon" runat="server"></asp:TextBox>

                                   </td>

                               </tr>
                              

                         </table>
                            

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Затвори</button>
                        <asp:button type="button" class="btn btn-primary" OnClick="PromeniTelefon" runat="server" Text="Промени Телефон"></asp:button>
                    </div>

                </div>
            </div>

        </div>

     <div id="complete-fak4" class="modal fade" tabindex="-1">

            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" >Промени слика</h4>
                    </div>
                    <div class="modal-body" style="padding-top: 5%">
                      
                                             <table> 
                               <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Име: "></asp:Label> 


                                    </td> 
                                 
                                   <td> 
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;"  class="form-control"  ID="txtImeSlika" runat="server"></asp:TextBox>

                                   </td>

                               </tr>
                                               
                               <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Најди слика: "></asp:Label>

                                    </td> 
                                   
                                   <td> 
                                      
                                       <asp:FileUpload ID="fajl" text="browse.." runat="server" />
                                   </td>

                               </tr>
                                                
                              

                         </table>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Затвори</button>
                        <asp:button type="button" class="btn btn-primary" OnClick="kopceUpload_Click" runat="server" Text="Промени слика"></asp:button>
                    </div>

                </div>
            </div>

        </div>

                               <div id="complete-fak3" class="modal fade" tabindex="-1">

            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" >Промени локација</h4>
                    </div>
                    <div class="modal-body" style="padding-top: 5%">

                          <table> 
                               <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Претходна локација : "></asp:Label> 


                                    </td> 
                                  
                                   <td> 
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;"  class="form-control" ReadOnly="true" ID="txtStaraLokacija" runat="server"></asp:TextBox>

                                   </td>

                               </tr>
                               <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Нова локација: "></asp:Label>

                                    </td> 
                                   <td> 
                                      
                                   <asp:TextBox TabIndex="1" style=" max-width: 100%;"  class="form-control"  ID="txtNovaLokacija" runat="server"></asp:TextBox>

                                   </td>

                               </tr>
                              

                         </table>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Затвори</button>
                        <asp:button type="button" class="btn btn-primary" OnClick="PromeniLokacija" runat="server" Text="Промени локација"></asp:button>
                    </div>

                </div>
            </div>

        </div>

</asp:Content>
