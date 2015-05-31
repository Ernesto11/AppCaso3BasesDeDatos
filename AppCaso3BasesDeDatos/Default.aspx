<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppCaso3BasesDeDatos.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Content\estilos.css" />
    <title>Control Llamadas Call-Centerrol Llamadas Call-Center</title>

    <!--............................................................SROLL............................................................-->
    <script>
        window.onload = function () {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.body.scrollTop = strPos;
            }
        }
        function SetScrollPosition() {
            var intY = document.body.scrollTop;
            document.title = intY;
            document.cookie = "yPos=!~" + intY + "~!";
        }
        window.onscroll = SetScrollPosition;
    </script>




</head>

<body>
    <form id="form1" runat="server">
        <p class="titulo">Control de Llamadas del Call Center</p>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!--........................................................................Header...........................................................-->
            
    <header>
        <div class="contenedor" id="i" onclick="mostrarInsertar()">
            <img class="icon" src="Content\i.png" />
            <p class="texto">Insertar  Llamada</p>
        </div>

        <div class="contenedor" id="c" onclick="mostrarSeleccionar()">
            <img class="icon" src="Content\c.png" />
        <p class="texto">Consultar  Llamada</p>
        </div>

        <div class="contenedor" id="a" onclick="mostrarActualizar()">
            <img class="icon" src="Content\a.png" />
            <p class="texto">Actualizar  Llamada</p>
        </div>

        <div class="contenedor" id="e" onclick="mostrarEliminar()">
            <img class="icon" src="Content\e.png" />
            <p class="texto">Eliminar  Llamada</p>
        </div>

        <div class="contenedor" id="acerca" onclick="mostrarAcerca()">
            <img class="icon" src="Content\acerca.png" />
            <p class="texto">Acerca de</p>

        </div>

            
            
    </header>

         <!--....................................................................FUNCIONES MOSTRAR...........................................................-->
             
         <script type="text/javascript">
             function mostrarInsertar() {
                 document.getElementById('seccionInsertar').style.display = 'block';
                 document.getElementById('seccionActualizar').style.display = 'none';
                 document.getElementById('seccionEliminar').style.display = 'none';
                 document.getElementById('seccionSeleccionar').style.display = 'none';
                 document.getElementById('buscar').style.display = 'none';
                 document.getElementById('acercaDe').style.display = 'none';
                 
             }
         </script>

         <script type="text/javascript">
             function mostrarSeleccionar() {

                 document.getElementById('seccionSeleccionar').style.display = 'block';
                 document.getElementById('seccionInsertar').style.display = 'none';
                 document.getElementById('seccionActualizar').style.display = 'none';
                 document.getElementById('seccionEliminar').style.display = 'none';
                 document.getElementById('buscar').style.display = 'block';
                 document.getElementById('acercaDe').style.display = 'none';
             }
         </script>

        <script type="text/javascript">
            function mostrarActualizar() {
                document.getElementById('seccionActualizar').style.display = 'block';
                document.getElementById('seccionInsertar').style.display = 'none';
                document.getElementById('seccionEliminar').style.display = 'none';
                document.getElementById('seccionSeleccionar').style.display = 'none';
                document.getElementById('buscar').style.display = 'none';
                document.getElementById('acercaDe').style.display = 'none';
            }
         </script>

        <script type="text/javascript">
            function mostrarEliminar() {
                document.getElementById('seccionActualizar').style.display = 'none';
                document.getElementById('seccionInsertar').style.display = 'none';
                document.getElementById('seccionEliminar').style.display = 'block';
                document.getElementById('seccionSeleccionar').style.display = 'none';
                document.getElementById('buscar').style.display = 'none';
                document.getElementById('acercaDe').style.display = 'none';
            }
         </script>

        <script type="text/javascript">
            function mostrarAcerca() {
                document.getElementById('seccionActualizar').style.display = 'none';
                document.getElementById('seccionInsertar').style.display = 'none';
                document.getElementById('seccionEliminar').style.display = 'none';
                document.getElementById('seccionSeleccionar').style.display = 'none';
                document.getElementById('buscar').style.display = 'none';
                document.getElementById('acercaDe').style.display = 'block';
            }
         </script>
     
     
            
        <!--........................................................................INSERTAR...........................................................-->
        
        <div id="seccionInsertar" class="seccionInsertar">

                      

            <asp:SqlDataSource ID="SqlDataSource6" UpdateCommand="select id_llamada from caso2.llamada" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_llamada from caso2.llamada"></asp:SqlDataSource>
            <br />
             <asp:UpdatePanel ID="UpdatePanel45" runat="server">
                            <ContentTemplate>
            <p class="subTituloAct1">Inserte los datos de la llamada:<asp:Button  ID="Button1" runat="server" Text="Insertar" OnClick="Button1_Click" UseSubmitBehavior="False"  /></p>
          
          </ContentTemplate>
                            
                         </asp:UpdatePanel>
             <table class="tabla">
         <!--.......................................................................ID_CLIENTE...........................................................-->
                <tr>
                    <td class="campoTabla">Seleccionar ID_Cliente</td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="id_cliente" DataValueField="id_cliente" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AutoPostBack="True">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="selectedindexchanged" />
                            </Triggers>
                         </asp:UpdatePanel>
                    </td>
                        
                    <td class="campoTabla">Nombre del Cliente:</td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Width="204px" ReadOnly="True"></asp:TextBox>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="selectedindexchanged" />

                            </Triggers>
                         </asp:UpdatePanel>
                    </td>
                </tr>

        <!--.......................................................................ID_PRODUCTO...........................................................-->
                <tr>
                    <td class="campoTabla">Seleccionar ID_Producto</td>
                    <td>
                         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="id_producto" DataValueField="id_producto" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True" Style="height: 22px">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList3" EventName="selectedindexchanged" />

                            </Triggers>
                         </asp:UpdatePanel>
                    </td>

                    <td class="campoTabla">Nombre del Producto:</td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" Width="203px" ReadOnly="True"></asp:TextBox>
                             </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList3" EventName="selectedindexchanged" />

                            </Triggers>
                         </asp:UpdatePanel>
                     </td>
                </tr>
                

        <!--.......................................................................ID_PROBLEMA...........................................................-->
                  <tr>
                     <td class="campoTabla">Seleccionar ID_Problema</td>
                    <td>
                         <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="id_problema" DataValueField="id_problema" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList2" EventName="selectedindexchanged" />

                            </Triggers>
                         </asp:UpdatePanel>
                    </td>

                    <td class="campoTabla">Tipo de Problema:</td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Width="204px" ReadOnly="True"></asp:TextBox>
                             </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList2" EventName="selectedindexchanged" />

                            </Triggers>
                         </asp:UpdatePanel>
                    </td>
                </tr>

        <!--.......................................................................ID_SOLUCION...........................................................-->
                <tr>
                    <td class="campoTabla">Seleccionar ID_Solución</td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="id_solucion" AutoPostBack="True" DataValueField="id_solucion" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList4" EventName="selectedindexchanged" />

                            </Triggers>
                         </asp:UpdatePanel>

                    </td>
                    <td class="campoTabla">Solución del Problema:</td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Width="204px" ReadOnly="True"></asp:TextBox>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList4" EventName="selectedindexchanged" />

                            </Triggers>
                         </asp:UpdatePanel>
                    </td>
                </tr>
                

            <!--.......................................................................ID_EMPLEADO...........................................................-->
                  <tr>
                     <td class="campoTabla">Seleccionar ID_Empleado</td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="id_empleado" AutoPostBack="True" DataValueField="id_empleado" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList5" EventName="selectedindexchanged" />

                            </Triggers>
                         </asp:UpdatePanel>
                    </td>
                    <td class="campoTabla">Nombre del Empleado:</td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Width="204px" ReadOnly="True"></asp:TextBox>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList5" EventName="selectedindexchanged" />
                            </Triggers>
                         </asp:UpdatePanel>
                    </td>
                </tr>

           <!--.......................................................................ESTADO...........................................................-->
          

                <tr>
                    <td class="campoTabla">Estado de la llamada</td>
                    <td>
                         <asp:TextBox ID="TextBox34" runat="server" Width="105px"></asp:TextBox>

                    </td>

                </tr>
                

           <!--.......................................................................SEGUIMIENTO...........................................................-->
                <tr>
                    <td class="campoTabla"> Seguimiento</td>
                    <td><asp:TextBox ID="TextBox35" runat="server" Width="103px"></asp:TextBox>
                            
                    </td>
                    
                    
                </tr>
                <tr>
          
          <!--.......................................................................CONEXIONES...........................................................-->
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_solucion from caso2.solucion"></asp:SqlDataSource>
                    </td>
                     
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="Select id_cliente from caso2.cliente"></asp:SqlDataSource>
                    </td>

                    <td>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_problema from caso2.problema"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_producto from caso2.producto"></asp:SqlDataSource>
                    </td>
                   
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="Select id_empleado from caso2.empleado"></asp:SqlDataSource>
                    </td>
                </tr>
             </table>
    
                   
        </div>




     <!--........................................................................ACTUALIZAR...........................................................-->
      

        <div id="seccionActualizar" class="seccionActualizar">
        
        
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_llamada from caso2.llamada"></asp:SqlDataSource>
                
             <!--........................................................................ID_LLAMADA...........................................................-->
             
           <div>
               <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                   <ContentTemplate>
             <p class="subTituloAct1">Seleccione el ID de la llamada que desea actualizar:
                     <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource7" DataTextField="id_llamada"
                        DataValueField="id_llamada" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged1">
                        <asp:ListItem>0</asp:ListItem>
                     </asp:DropDownList>
                 <asp:Button ID="Button3" runat="server" Text="Actualizar" Width="74px" OnClick="Button3_Click" />
             
                 
               </p>
                        </ContentTemplate>
                       <Triggers>
                     <asp:AsyncPostBackTrigger ControlID="DropDownList9" EventName="selectedindexchanged" />
                 </Triggers>
                      
                   </asp:UpdatePanel>
            </div>
            
            
    
        
           
    <table class="tabla">

   <!--........................................................................ID_CLIENTE...........................................................-->
          
            <tr>
                <td class="campoTabla">ID_Cliente:</td>
                <td>
             <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                 <ContentTemplate>
                     <asp:DropDownList ID="DropDownList10" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource8"
                        DataTextField="id_cliente" DataValueField="id_cliente" OnSelectedIndexChanged="DropDownList10_SelectedIndexChanged1">
                    </asp:DropDownList>
                </ContentTemplate>
                 <Triggers>
                     <asp:AsyncPostBackTrigger ControlID="DropDownList10" EventName="selectedindexchanged" />
                 </Triggers>
             </asp:UpdatePanel>

                </td>
                <td class="campoTabla">Nombre del Cliente:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="TextBox27" runat="server" Width="204px" ReadOnly="True"></asp:TextBox>
                        </ContentTemplate>
                 <Triggers>
                     <asp:AsyncPostBackTrigger ControlID="DropDownList10" EventName="selectedindexchanged" />
                 </Triggers>
             </asp:UpdatePanel>
                </td>
            </tr>
<!--........................................................................ID_PRODUCTO...........................................................-->
   
            <tr>
                <td class="campoTabla">ID_Producto:</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="DropDownList11" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource9" DataTextField="id_producto" DataValueField="id_producto" OnSelectedIndexChanged="DropDownList11_SelectedIndexChanged">
                            </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList11" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>

                <td class="campoTabla">Nombre del Producto:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="TextBox28" runat="server" Width="204px" ReadOnly="True"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList11" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>
<!--........................................................................ID_PROBLEMA...........................................................-->


            <tr>
                <td class="campoTabla">ID_Problema:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="DropDownList12" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource10" DataTextField="id_problema" DataValueField="id_problema" OnSelectedIndexChanged="DropDownList12_SelectedIndexChanged">
                            </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList12" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>

                <td class="campoTabla">Tipo de Problema:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="TextBox29" runat="server" Width="204px" ReadOnly="True"></asp:TextBox>
                         </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList12" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>
            <tr>

<!--........................................................................ID_SOLUCION...........................................................-->


                <td class="campoTabla">ID_Solucion:</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="DropDownList13" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource11" DataTextField="id_solucion" DataValueField="id_solucion" OnSelectedIndexChanged="DropDownList13_SelectedIndexChanged">
                            </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList13" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>

                <td class="campoTabla">Descripción de la Solución:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="TextBox30" runat="server" Width="204px" ReadOnly="True"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList13" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>
            <tr>

<!--........................................................................ID_SOLUCION...........................................................-->

                <td class="campoTabla">ID_Empleado:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="DropDownList14" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource12" DataTextField="id_empleado" DataValueField="id_empleado" OnSelectedIndexChanged="DropDownList14_SelectedIndexChanged">
                            </asp:DropDownList>
                    </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList14" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>

                <td class="campoTabla">Nombre del Empleado:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="TextBox31" runat="server" Width="204px" ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList14" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>

<!--........................................................................ESTADO...........................................................-->



            <tr>
                <td class="campoTabla">Estado de la llamada</td>
                <td>
                    <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
                </td>
                
                <td>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_cliente from caso2.cliente"></asp:SqlDataSource>
                </td>
            </tr>
<!--........................................................................SEGUIMIENTO...........................................................-->


            <tr>
                <td class="campoTabla">Seguimiento</td>
                <td>
                    <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
                </td>
                
                <td>
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_producto from caso2.producto"></asp:SqlDataSource>
                </td>
            </tr>

<!--........................................................................CONEXIONES...........................................................-->

            <tr>
                
                <td>
                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_solucion from caso2.solucion"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_problema from caso2.problema"></asp:SqlDataSource>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="select id_empleado from caso2.empleado"></asp:SqlDataSource>
                </td>
            </tr>

             
        </table>
    </div>







  <!--........................................................................ELIMINAR...........................................................-->
  
       <div id="seccionEliminar" class="seccionEliminar" >
           
            <asp:ImageButton  ID="ImageButton1" runat="server" Height="65px" ImageUrl="Content\txt-icono-7316-128.png" OnClick="ImageButton1_Click" Width="61px" />
          


       <div>
           
               <asp:UpdatePanel ID="UpdatePanel35" runat="server">
                        <ContentTemplate>
            <p class="subTituloAct1">Seleccione el ID de la llamada que desea eliminar:
            <asp:DropDownList ID="DropDownList8"
                        runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6"
                        DataTextField="id_llamada" DataValueField="id_llamada" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged">
                    </asp:DropDownList>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Style="height: 26px" Text="Eliminar" /> 
                </p>
                    </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
            

         </div>



        <table class="tabla" >
            <tr>
                <td class="campoTabla">ID_Cliente</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel30" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Width="104px"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
                <td class="campoTabla">Nombre del Cliente:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" Width="165px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="campoTabla">ID_Producto</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Width="105px"></asp:TextBox>
                    </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
                <td class="campoTabla">Nombre del Producto:</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel24" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" Width="163px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="campoTabla">ID_Problema</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel25" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Width="107px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
                <td class="campoTabla">Tipo de Problema:</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel26" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox15" runat="server" Width="161px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="campoTabla">ID_Solucion</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel27" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Width="105px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
                <td class="campoTabla">Descripción de la Solución:</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel28" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox16" runat="server" Width="161px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="campoTabla">ID_Empleado</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel29" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Width="102px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
                <td class="campoTabla">Nombre del Empleado:</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox17" runat="server" Width="160px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="campoTabla">Estado de la llamada:</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel32" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Width="102px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
                <td class="campoTabla">Fecha de llamada:</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel33" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox18" runat="server" Width="156px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="campoTabla">Seguimiento</td>
                <td>
                     <asp:UpdatePanel ID="UpdatePanel34" runat="server">
                        <ContentTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Width="99px"></asp:TextBox>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList8" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                </td>
           </tr>
        </table>
           
        </div>



        <div id="seccionSeleccionar" class="seccionSeleccionar">
            
            
            <div class="buscar" id="buscar">
            <div class="select" >
                <asp:UpdatePanel ID="UpdatePanel36" runat="server">
                        <ContentTemplate>
            
                &nbsp;Consultar por:&nbsp;&nbsp; Id_Llamada:
                
                <asp:DropDownList ID="DropDownList15" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource17" DataTextField="id_llamada" DataValueField="id_llamada" OnSelectedIndexChanged="DropDownList15_SelectedIndexChanged">
                </asp:DropDownList>
                             </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList15" EventName="selectedindexchanged" />
                        </Triggers>

                     </asp:UpdatePanel></div>
                
                <div class="select">
                 <asp:UpdatePanel ID="UpdatePanel37" runat="server">
                        <ContentTemplate>
&nbsp; Id_Cliente:
                
                <asp:DropDownList ID="DropDownList16" runat="server" DataSourceID="SqlDataSource18" DataTextField="id_cliente" DataValueField="id_cliente" OnSelectedIndexChanged="DropDownList16_SelectedIndexChanged1" AutoPostBack="True">
                </asp:DropDownList>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList16" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                    </div>

                <div class="select">
                <asp:UpdatePanel ID="UpdatePanel38" runat="server">
                        <ContentTemplate>
&nbsp; Id_Empleado:
                            
                <asp:DropDownList ID="DropDownList17" runat="server" DataSourceID="SqlDataSource19" DataTextField="id_empleado" DataValueField="id_empleado" OnSelectedIndexChanged="DropDownList17_SelectedIndexChanged1" AutoPostBack="True">
                </asp:DropDownList>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList17" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                    </div>
                <div class="select">
                            <asp:UpdatePanel ID="UpdatePanel39" runat="server">
                        <ContentTemplate>
&nbsp; Id_Producto:&nbsp;
                <asp:DropDownList ID="DropDownList18" runat="server" DataSourceID="SqlDataSource20" DataTextField="id_producto" DataValueField="id_producto" OnSelectedIndexChanged="DropDownList18_SelectedIndexChanged1" AutoPostBack="True">
                </asp:DropDownList>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList18" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                    </div>
                <div class="select">
                <asp:UpdatePanel ID="UpdatePanel40" runat="server">
                        <ContentTemplate>
&nbsp;&nbsp; Id_Problema:&nbsp;
                            
                <asp:DropDownList ID="DropDownList19" runat="server" DataSourceID="SqlDataSource21" DataTextField="id_problema" DataValueField="id_problema" OnSelectedIndexChanged="DropDownList19_SelectedIndexChanged1" AutoPostBack="True">
                </asp:DropDownList>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList19" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                    </div>
                <div class="select">
                 <asp:UpdatePanel ID="UpdatePanel41" runat="server">
                        <ContentTemplate>
&nbsp; Id_Solución:&nbsp;
                           
                <asp:DropDownList ID="DropDownList20" runat="server" DataSourceID="SqlDataSource22" DataTextField="id_solucion" DataValueField="id_solucion" OnSelectedIndexChanged="DropDownList20_SelectedIndexChanged1" AutoPostBack="True">
                </asp:DropDownList>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList15" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                    </div>
                <div class="select">
                <asp:UpdatePanel ID="UpdatePanel42" runat="server">
                        <ContentTemplate>
&nbsp;Seguimiento:
                            
                <asp:DropDownList ID="DropDownList21" runat="server" OnSelectedIndexChanged="DropDownList21_SelectedIndexChanged1" AutoPostBack="True" DataSourceID="SqlDataSource14" DataTextField="FOLLOW_UP" DataValueField="FOLLOW_UP">
                </asp:DropDownList>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList15" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
                    </div>
                
              
<div class="select">

<asp:UpdatePanel ID="UpdatePanel43" runat="server">
                        <ContentTemplate>
&nbsp; Estado Resolución:
                
                <asp:DropDownList ID="DropDownList22" runat="server" OnSelectedIndexChanged="DropDownList22_SelectedIndexChanged1" AutoPostBack="True" DataSourceID="SqlDataSource15" DataTextField="ESTADO_RESOLUCION_LLAMADA" DataValueField="ESTADO_RESOLUCION_LLAMADA">
                </asp:DropDownList>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList15" EventName="selectedindexchanged" />
                        </Triggers>
                     </asp:UpdatePanel>
    </div>
                  <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="SELECT DISTINCT FOLLOW_UP FROM CASO2.LLAMADA"></asp:SqlDataSource>

                  <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="SELECT DISTINCT ESTADO_RESOLUCION_LLAMADA FROM CASO2.LLAMADA"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="SELECT DISTINCT ID_PROBLEMA FROM CASO2.LLAMADA"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="SELECT DISTINCT ID_SOLUCION FROM CASO2.LLAMADA"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="SELECT DISTINCT ID_PRODUCTO FROM CASO2.LLAMADA"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="SELECT DISTINCT ID_EMPLEADO FROM CASO2.LLAMADA"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="SELECT DISTINCT ID_CLIENTE FROM CASO2.LLAMADA"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="SELECT DISTINCT ID_LLAMADA FROM CASO2.LLAMADA"></asp:SqlDataSource>
            
            
            </div>




            
<asp:UpdatePanel ID="UpdatePanel44" runat="server">
                        <ContentTemplate>
            <div class="gridview">

            <asp:GridView ID="GridView1" runat="server" CellPadding="3"  GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" EmptyDataText="NULL" Font-Bold="True" >
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                
            </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:SQLAzureConnection %>" SelectCommand="SELECT * FROM CASO2.LLAMADA"></asp:SqlDataSource>
            </div>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList15" EventName="selectedindexchanged" />
                             
                       
                        </Triggers>
                     </asp:UpdatePanel>

        </div>
        <div class="acercaDe" id="acercaDe">

            <img class="ppt" src="Content\1.jpg" />
            <img class="ppt" src="Content\2.jpg" />
            <img class="ppt" src="Content\3.jpg" />
            <img class="ppt" src="Content\4.jpg" />
            <img class="ppt" src="Content\5.jpg" />
            <img class="ppt" src="Content\6.jpg" />
            <img class="ppt" src="Content\7.jpg" />
            <img class="ppt" src="Content\8.jpg" />
        </div>
        
    </form>
</body>
</html>
