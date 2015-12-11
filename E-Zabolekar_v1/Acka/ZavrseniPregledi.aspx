<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ZavrseniPregledi.aspx.cs" Inherits="Acka.ZavrseniPregledi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

    <script>
        function najdi(gotovid, korisnikid, zaboekar_id) {


            var kkk = korisnikid;
            document.getElementById("ace").innerHTML = "";
            document.getElementById('<%= gotovid.ClientID %>').innerHTML = gotovid;
            document.getElementById('<%= Label4.ClientID %>').innerHTML = gotovid;
            document.getElementById('<%= korisnikidd.ClientID %>').innerHTML = korisnikid;
            //       document.getElementById('<%= zabolekaridd.ClientID %>').innerHTML = zaboekar_id;

            var label = document.getElementById("<%=zabolekaridd.ClientID %>");
            label.innerHTML = zaboekar_id;
            document.getElementById('<%=hidden.ClientID %>').value = label.innerHTML;

            var label1 = document.getElementById("<%=korisnikidd.ClientID %>");
            label1.innerHTML = korisnikid;
            document.getElementById('<%=hidden1.ClientID %>').value = label1.innerHTML;

         <%--   var label2 = document.getElementById("<%=pregledid.ClientID %>");
            label2.innerHTML = terminid;
        --%>

            var label3 = document.getElementById("<%=Label4.ClientID %>");
            label3.innerHTML = gotovid;
            document.getElementById('<%=Hidden3.ClientID %>').value = label3.innerHTML;


        <%--    document.getElementById("<%= Button1.ClientID %>").click();
      document.getElementById("<%= Button2.ClientID %>").click();   --%>

            var pageId = "<%=  Page.ClientID %>";
            __doPostBack(pageId, gotovid);

        }
        //function ShowMessageBox() {
        //    $("#messageBox").dialog({
        //        modal: true,
        //        buttons: {
        //            Ok: function () {
        //                $(this).dialog("close");
        //            }
        //        }
        //    });
        //    return false;
        //}
    </script>

    <asp:HiddenField ID="hidenzaopis" runat="server" />
    <div hidden>
        <%--  <asp:Button ID="Button1" runat="server"   OnClick="ace_click" ClientIDMode="Static" />
         <asp:Button ID="Button2" runat="server"   ClientIDMode="Static" OnClientClick="javascript:return ShowMessageBox();" />
        --%>
    </div>



    <div class="container" style="margin-top: 2%">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Завршени прегледи</h3>
                <%-- <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>--%>
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
                            <asp:Calendar ID="Calendar4" runat="server" OnSelectionChanged="Calendar4_SelectionChanged"></asp:Calendar>

                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-primary">Затвори</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body" style="margin-left: 25%">
                <div style="margin-left: -34%">
                    <div id="greska" runat="server" visible="false" class="alert alert-dismissible alert-danger" style="max-width: 50%; margin-left: 27%">
                        <button type="button" class="close" data-dismiss="alert">×</button>

                        <asp:Label ID="poraka" runat="server" Text="Label"></asp:Label>

                    </div>
                </div>
                <asp:PlaceHolder ID="zavrsenipregledi" runat="server"></asp:PlaceHolder>
                <asp:PlaceHolder ID="zapregled" runat="server"></asp:PlaceHolder>

            </div>
        </div>

    </div>

    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

    <div id="messageBox" title="jQuery MessageBox In Asp.net" style="display: none;">
        <h3>This is a jquery demo messagebox in asp.net.
                      <asp:Label ID="naslovvv" runat="server" Text="Label"></asp:Label>
        </h3>
    </div>




    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Детали за прегледот:</h4>
                </div>
                <div class="modal-body">
                    <p id="ace">е тука да са измисле убаво как шо, ама со ке са мисле требе да са заврше прегледо :D.</p>
                    <asp:Label ID="gotovid" runat="server" ForeColor="White"></asp:Label>
                    <asp:Label ID="korisnikidd" runat="server" ForeColor="White"></asp:Label>
                    <asp:Label ID="zabolekaridd" runat="server" ForeColor="White"></asp:Label>
                    <asp:Label ID="Label4" runat="server" ForeColor="White"></asp:Label>
                    <asp:HiddenField ID="hidden" runat="server" />
                    <asp:HiddenField ID="hidden1" runat="server" />
                    <asp:HiddenField ID="hidden2" runat="server" />
                    <asp:HiddenField ID="Hidden3" runat="server" />


                    <asp:Label ID="Label3" runat="server" Text="Детали за прегледот:"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Наслов: "></asp:Label>
                    <asp:Label ID="naslov" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Опис на прегледот: "></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="opisPregled" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Затвори</button>
                </div>
            </div>
        </div>
    </div>



    <asp:Panel ID="pnlModal" runat="server" role="dialog" CssClass="modal fade">
        <asp:Panel ID="pnlInner" runat="server" CssClass="modal-dialog">
            <asp:Panel ID="pnlContent" CssClass="modal-content" runat="server">
                <asp:Panel runat="server" class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">Bootstrap Modal Dialog in ASP.NET</h4>
                </asp:Panel>
                <asp:Panel runat="server" class="modal-body">
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et 
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip 
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
                    fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt 
                    mollit anim id est laborum.
                    </p>
                </asp:Panel>
                <asp:Panel runat="server" class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
