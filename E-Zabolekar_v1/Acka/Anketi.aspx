<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Anketi.aspx.cs" Inherits="Acka.Anketi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="padding-top:5%">
     <asp:button class="btn btn-primary" data-toggle="modal" data-target="#complete-fak"  runat="server" Text="Додади новост" ></asp:button>
    </div>

        <div id="complete-fak" class="modal fade" tabindex="-1">

            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" >Додади новост</h4>
                    </div>
                    <div class="modal-body" style="padding-top: 5%">

                          <div class="form-group">
                            <asp:TextBox TabIndex="1" style=" max-width: 100%;"  class="form-control" placeholder="Наслов" ID="txtNaslov" runat="server"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <asp:TextBox TabIndex="1"  style=" max-width: 100%;"  class="form-control" placeholder="Опис" ID="txtOpis" runat="server"></asp:TextBox>

                        </div>
                            

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Затвори</button>
                        <asp:button type="button" class="btn btn-primary" OnClick="dodadiNovost" runat="server" Text="Додади новост"></asp:button>
                    </div>

                </div>
            </div>

        </div>

</asp:Content>
