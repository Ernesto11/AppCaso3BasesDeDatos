<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="llamadaSeguimiento.aspx.cs" Inherits="AppCaso3BasesDeDatos.llamadaSeguimiento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Llamadas en Seguimiento<br />
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_LLAMADA" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ID_LLAMADA" HeaderText="ID_LLAMADA" InsertVisible="False" ReadOnly="True" SortExpression="ID_LLAMADA" />
                <asp:BoundField DataField="ID_CLIENTE" HeaderText="ID_CLIENTE" SortExpression="ID_CLIENTE" />
                <asp:BoundField DataField="ID_EMPLEADO" HeaderText="ID_EMPLEADO" SortExpression="ID_EMPLEADO" />
                <asp:BoundField DataField="ID_PRODUCTO" HeaderText="ID_PRODUCTO" SortExpression="ID_PRODUCTO" />
                <asp:BoundField DataField="ID_PROBLEMA" HeaderText="ID_PROBLEMA" SortExpression="ID_PROBLEMA" />
                <asp:BoundField DataField="ID_SOLUCION" HeaderText="ID_SOLUCION" SortExpression="ID_SOLUCION" />
                <asp:BoundField DataField="FECHA_LLAMADA" HeaderText="FECHA_LLAMADA" SortExpression="FECHA_LLAMADA" />
                <asp:BoundField DataField="FOLLOW_UP" HeaderText="FOLLOW_UP" SortExpression="FOLLOW_UP" />
                <asp:BoundField DataField="ESTADO_RESOLUCION_LLAMADA" HeaderText="ESTADO_RESOLUCION_LLAMADA" SortExpression="ESTADO_RESOLUCION_LLAMADA" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select * from caso2.llamada where estado_resolucion_llamada = 1"></asp:SqlDataSource>
    </form>
</body>
</html>
