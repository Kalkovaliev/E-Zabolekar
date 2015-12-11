<%@ Page Title="Закажени термини" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ZakazeniTermini.aspx.cs" Inherits="Acka.ZakazeniTermini" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 2%">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Закажени термини</h3>

            </div>
             <button class="btn btn-info btn-sm" data-toggle="modal" style="margin-left:2%" data-target="#complete ">Избери датум</button>
            <div class="panel-body" style="margin-left:25%">
                <%-- modal za izbiranje na data --%>
               

                <div id="complete" class="modal fade" tabindex="-1">
                
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Избери Датум</h4>
            </div>
            <div class="modal-body">
                <br/>
                   <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Затвори</button>
             
            </div>
        </div>
    </div>
         </div>   
                    
                <div style="margin-left:-34%">
                      <div ID="greska" runat="server" visible="false" class="alert alert-dismissible alert-danger" style="max-width:50%;margin-left:27%">
  <button type="button" class="close" data-dismiss="alert">×</button>
 
    <asp:Label ID="poraka" runat="server" Font-Size="Larger"></asp:Label>
      
</div>
                
                </div>
                <asp:PlaceHolder ID="zakazanitermini" runat="server"></asp:PlaceHolder>

                

            </div>
        </div>

    </div>

</asp:Content>
