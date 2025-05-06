<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestion_planes.aspx.cs" Inherits="AgenciaWeb.GestionPlanes" EnableEventValidation="false" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Planes - Seguros SURA</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="sidebar">
                <hr />
                <p style="text-align:center;">MENU DE OPCIONES</p>
                <hr />
                <ul>
                    <li><a href="Default.aspx">Inicio</a></li>
                    <li><a href="gestion_planes.aspx">Gestión de Planes</a></li>
                    <li><a href="comprar.aspx">Comprar Seguro</a></li>
                </ul>
                <div class="logout-container">
                    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" OnClick="btnCerrarSesion_Click" CssClass="btn" />
                </div>
            </div>

           <div class="main-content">

              <%-- Seguros activos--%>

   <h2>Mis Seguros Activos</h2>
<asp:Repeater ID="rptSegurosActivos" runat="server">
    <HeaderTemplate>
        <table class="tabla-seguros">
            <tr><th>Seguro</th><th>Descripción</th><th>Fecha</th><th>Acción</th></tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("Nombre") %></td>
            <td><%# Eval("Descripcion") %></td>
            <td><%# Eval("FechaActivacion") %></td>
            <td>
                <asp:Button 
                    ID="btnCancelar" 
                    runat="server" 
                    Text="Cancelar" 
                    CssClass="btn btn-danger"
                    OnClientClick='return confirm("¿Estás seguro que deseas cancelar este seguro?");'
                    CommandArgument='<%# Eval("FechaActivacion") %>'
                    OnClick="btnCancelar_Click" />
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
</asp:Repeater>
<asp:Label ID="lblMensaje" runat="server" Text="Aún no tienes ningún seguro activo." Visible="false" />

<hr />

 <%-- Seguros inactivos--%>
<h2>Mis Seguros Inactivos</h2>
<asp:Repeater ID="rptSegurosInactivos" runat="server">
    <HeaderTemplate>
        <table class="tabla-seguros">
            <tr><th>Seguro</th><th>Descripción</th><th>Fecha</th><th>Estado</th></tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("Nombre") %></td>
            <td><%# Eval("Descripcion") %></td>
            <td><%# Eval("FechaActivacion") %></td>
            <td>Inactivo</td>
        </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
</asp:Repeater>
<asp:Label ID="lblInactivos" runat="server" Text="No tienes seguros inactivos." Visible="false" />

</div>

        </div>
    </form>
</body>
</html>

