<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="MoiTerminiAdmin.aspx.cs" Inherits="Acka.MoiTerminiAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function najdi(terminid,korisnikid,zaboekar_id) {
            var kkk = korisnikid;
            document.getElementById("ace").innerHTML = "";
            document.getElementById('<%= pregledid.ClientID %>').innerHTML = terminid;
            document.getElementById('<%= korisnikidd.ClientID %>').innerHTML = korisnikid;
     //       document.getElementById('<%= zabolekaridd.ClientID %>').innerHTML = zaboekar_id;

            var label = document.getElementById("<%=zabolekaridd.ClientID %>");
            label.innerHTML = zaboekar_id;
            document.getElementById('<%=hidden.ClientID %>').value = label.innerHTML;

            var label1 = document.getElementById("<%=korisnikidd.ClientID %>");
            label1.innerHTML = korisnikid;
            document.getElementById('<%=hidden1.ClientID %>').value = label1.innerHTML;

            var label2 = document.getElementById("<%=pregledid.ClientID %>");
            label2.innerHTML = terminid;
            document.getElementById('<%=hidden2.ClientID %>').value = label2.innerHTML;

            
        }
        </script>

     <div class="container" style="margin-top: 2%">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Закажени термини</h3>
            </div>
             <button class="btn btn-info btn-sm" data-toggle="modal" style="margin-left: 2%" data-target="#complete ">Избери датум</button>
            <div id="complete" class="modal fade" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Избери Датум</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Calendar ID="Calendar3" runat="server" OnSelectionChanged="Calendar3_SelectionChanged"></asp:Calendar>

                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-primary">Затвори</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body" style="margin-left:25%">
                <div style="margin-left: -34%">
                    <div id="greska" runat="server" visible="false" class="alert alert-dismissible alert-danger" style="max-width: 50%; margin-left: 27%">
                        <button type="button" class="close" data-dismiss="alert">×</button>

                        <asp:Label ID="poraka" runat="server" Text="Label"></asp:Label>

                    </div>
                </div>
                <asp:PlaceHolder ID="zakazanitermini" runat="server"></asp:PlaceHolder>

               


                <br />
                <br />
                <br />
                <br />
                

               

            </div>
        </div>

    </div>


                 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Заврши го прегледот</h4>
        </div>
        <div class="modal-body">
          <p id="ace">е тука да са измисле убаво как шо, ама со ке са мисле требе да са заврше прегледо :D.</p>
            <asp:Label ID="pregledid" runat="server" ForeColor="White"></asp:Label>
            <asp:Label ID="korisnikidd" runat="server" ForeColor="White"   ></asp:Label>
            <asp:Label ID="zabolekaridd" runat="server"  ForeColor="White" ></asp:Label>
          <asp:HiddenField ID="hidden" runat="server" />
              <asp:HiddenField ID="hidden1" runat="server" />
              <asp:HiddenField ID="hidden2" runat="server" />

      
            <asp:Label ID="Label3" runat="server" Text="Детали за прегледот:"></asp:Label>
             <br/>  <br/>
         <asp:Label ID="Label1" runat="server" Text="Наслов: "></asp:Label>   <asp:TextBox ID="naslov" runat="server"></asp:TextBox>
                <br/>
             <br/>
               <asp:Label ID="Label2" runat="server" Text="Опис: "></asp:Label>
             <br/>
            <asp:TextBox ID="opis" TextMode="multiline" runat="server" Height="300px" Width="400px"></asp:TextBox>
            <br/>
            <br/>
            <asp:Button  class="btn btn-raised btn-success"   ID="zavrsiPregled" runat="server" OnClick="zavrsiPregled_click" Text="Заврши го прегледот" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Затвори</button>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
