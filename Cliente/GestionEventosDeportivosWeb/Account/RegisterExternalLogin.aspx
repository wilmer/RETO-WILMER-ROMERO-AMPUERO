<%@ Page Title="Registrar un inicio de sesión externo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterExternalLogin.aspx.cs" Inherits="GestionEventosDeportivosWeb.Account.RegisterExternalLogin" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<h3>Regístrese con su cuenta <%: ProviderName %></h3>

    <asp:PlaceHolder runat="server">
        <div class="form-horizontal">
            <h4>Formulario de asociación</h4>
            <hr />
            <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
            <p class="text-info">
                Ha autenticado con <strong><%: ProviderName %></strong>. Especifique una dirección de correo electrónico a continuación para el sitio actual
                y haga clic en el botón Iniciar sesión.
            </p>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="usuario" CssClass="col-md-2 control-label">Usuario</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="usuario" CssClass="form-control" />
                <%--    <asp:RequiredFieldValidator runat="server"
                        Display="Dynamic" CssClass="text-danger" ErrorMessage="Se requiere el usuario" />--%>
                    <asp:ModelErrorMessage runat="server" ModelStateKey="email" CssClass="text-error" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" Text="Iniciar sesión" CssClass="btn btn-default" OnClick="LogIn_Click" />
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>
