using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.ComponentModel;
using System.Text;
using System.Windows.Forms;
using System.IO;



namespace AppCaso3BasesDeDatos
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
            

           
        }


        

        protected void Button1_Click(object sender, EventArgs e)
        {

            try{
                string id_cliente = DropDownList1.SelectedItem.ToString();
                string id_producto = DropDownList3.SelectedItem.ToString();
                string id_problema = DropDownList2.SelectedItem.ToString();
                string id_solucion = DropDownList4.SelectedItem.ToString();
                string id_empleado = DropDownList5.SelectedItem.ToString();
                string estado = TextBox34.Text;
                string seguimiento = TextBox35.Text;
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
                string strSQL = "INSERT INTO CASO2.LLAMADA (ID_CLIENTE,ID_EMPLEADO,ID_PRODUCTO,ID_PROBLEMA,ID_SOLUCION,FOLLOW_UP,ESTADO_RESOLUCION_LLAMADA) VALUES(" + int.Parse(id_cliente) + "," + int.Parse(id_empleado) + "," + int.Parse(id_producto) + "," + int.Parse(id_problema) + "," + int.Parse(id_solucion) + "," + int.Parse(seguimiento) + "," + int.Parse(estado) + ")";
                var cmd = new SqlCommand(strSQL, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                DropDownList9.Items.Clear();
                DropDownList9.DataSourceID = "SqlDataSource7";
                DropDownList9.DataTextField = "id_llamada";
                DropDownList9.DataValueField = "id_llamada";
                DropDownList8.Items.Clear();
                DropDownList8.DataSourceID = "SqlDataSource6";
                DropDownList8.DataTextField = "id_llamada";
                DropDownList8.DataValueField = "id_llamada";

               

                
                string script = @"<script type='text/javascript'>
                            alert('Llamada ingresada correctamente');
                        </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
               
            }
                
            catch (Exception)
            {
                string script = @"<script type='text/javascript'>
                            alert('Los valores ingresados no son correctos');
                        </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            

        }

        protected void Button2_Click(object sender, System.EventArgs e)
        {
            try{
            string id_llamada = DropDownList8.SelectedItem.ToString();
            string strSQL = "Delete from caso2.llamada where id_llamada = " + int.Parse(id_llamada);
            string cnSQL = "Select id_llamada from caso2.llamada"; 
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            string s = TextBox6.Text;

            if (s.Equals( ' '))
            {
                string script = @"<script type='text/javascript'>
                            alert('Asegurese de eliminar los datos correctos');
                        </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            var cmd1 = new SqlCommand(cnSQL, conn);
            conn.Open();

            DropDownList9.Items.Clear();
            DropDownList9.DataSourceID = "SqlDataSource7";
            DropDownList9.DataTextField = "id_llamada";
            DropDownList9.DataValueField = "id_llamada";
            DropDownList8.Items.Clear();
            DropDownList8.DataSourceID = "SqlDataSource6";
            DropDownList8.DataTextField = "id_llamada";
            DropDownList8.DataValueField = "id_llamada";

            string msjCorrecto = @"<script type='text/javascript'>
                            alert('La llamada ha sido eliminada');
                        </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", msjCorrecto, false);
           
            
        } catch (Exception)
            {
                string script = @"<script type='text/javascript'>
                            alert('Seleccione una llamada a eliminar o verifique de que no se encuentre en seguimiento ');
                        </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
           
        }
       



        protected void Button7_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            var id_cliente = DropDownList1.SelectedItem.ToString();
            string strSQL = "Select nombre from caso2.cliente where id_cliente = " + id_cliente;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox1.Text = cm.ToString();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            var id_problema = DropDownList2.SelectedItem.ToString();
            string strSQL = "Select tipo from caso2.problema where id_problema = " + id_problema;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox3.Text = cm.ToString();

        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            var id_cliente = DropDownList1.SelectedItem.ToString();
            string strSQL = "Select nombre from caso2.cliente where id_cliente = " + id_cliente;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox1.Text = cm.ToString();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            var id_producto = DropDownList3.SelectedItem.ToString();
            string strSQL = "Select nombre from caso2.Producto where id_producto = " + id_producto;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox2.Text = cm.ToString();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            var id_solucion = DropDownList4.SelectedItem.ToString();
            string strSQL = "Select descripcion from caso2.solucion where id_solucion = " + id_solucion;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox4.Text = cm.ToString();
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            var id_empleado = DropDownList5.SelectedItem.ToString();
            string strSQL = "Select nombre from caso2.empleado where id_empleado = " + id_empleado;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            
            TextBox5.Text = cm.ToString();
        }

        protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Establece la conexion a la base e datos
            SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            var id_llamada = DropDownList8.SelectedItem.ToString();
            //creacion del string con la consulta a la base de datos
            string strSQL_ID_Cliente = "Select id_cliente  from caso2.llamada where id_llamada = " + id_llamada;
            string strSQL_ID_Empleado = "Select id_empleado from caso2.llamada where id_llamada = " + id_llamada;
            string strSQL_ID_Producto = "Select id_producto from caso2.llamada where id_llamada = " + id_llamada;
            string strSQL_ID_Problema = "Select id_problema from caso2.llamada where id_llamada = " + id_llamada;
            string strSQL_ID_Solucion = "Select id_solucion from caso2.llamada where id_llamada = " + id_llamada;
            string strSQL_Estado = "Select estado_resolucion_llamada from caso2.llamada where id_llamada = " + id_llamada;
            string strSQL_seguimiento = "Select follow_up from caso2.llamada where id_llamada = " + id_llamada;

            //Se relaciona la consulta con la conexion
            var cn_ID_Cliente = new SqlCommand(strSQL_ID_Cliente, conexion);
            var cn_ID_Empleado = new SqlCommand(strSQL_ID_Empleado, conexion);
            var cn_ID_Producto = new SqlCommand(strSQL_ID_Producto, conexion);
            var cn_ID_Problema = new SqlCommand(strSQL_ID_Problema, conexion);
            var cn_ID_Solucion = new SqlCommand(strSQL_ID_Solucion, conexion);
            var cn_Estado = new SqlCommand(strSQL_Estado, conexion);
            var cn_seguimiento = new SqlCommand(strSQL_seguimiento, conexion);
            //Se habre la conexion
            conexion.Open();
            //Se ejecutan las consultas
            var id_cliente = cn_ID_Cliente.ExecuteScalar();
            var id_Producto = cn_ID_Producto.ExecuteScalar();
            var id_problema = cn_ID_Problema.ExecuteScalar();
            var id_solucion = cn_ID_Solucion.ExecuteScalar();
            var id_empleado = cn_ID_Empleado.ExecuteScalar();
            var Estado = cn_Estado.ExecuteScalar();
            var seguimiento = cn_seguimiento.ExecuteScalar();
            //Se cierra the conection
            conexion.Close();

            //obtencion de los datos del id
            //datos del id
            string nombreCliente = "Select nombre  from caso2.cliente where id_cliente = " + id_cliente.ToString();
            string nombreProducto = "Select nombre  from caso2.producto where id_producto = " + id_Producto.ToString();
            string tipoProblema = "Select tipo  from caso2.problema where id_problema = " + id_problema.ToString();
            string descripcionS = "Select descripcion  from caso2.solucion where id_solucion = " + id_solucion;
            string empleado = "Select nombre  from caso2.empleado where id_empleado = " + id_empleado;
            string fecha = "select CONVERT(char,fecha_llamada,103)  from caso2.llamada where id_llamada = " + id_llamada;
            //relacion consulta
            var cn_Nom_Cliente = new SqlCommand(nombreCliente, conexion);
            var cn_Nom_Producto = new SqlCommand(nombreProducto, conexion);
            var cn_Tipo = new SqlCommand(tipoProblema, conexion);
            var cn_Solucion = new SqlCommand(descripcionS, conexion);
            var cn_Nom_Empleado = new SqlCommand(empleado, conexion);
            var cn_fecha = new SqlCommand(fecha, conexion);

            //ejecucion de consultas
            conexion.Open();
            var Nomcliente = cn_Nom_Cliente.ExecuteScalar();
            var NomProducto = cn_Nom_Producto.ExecuteScalar();
            var TipoProblema = cn_Tipo.ExecuteScalar();
            var Descripcionsolucion = cn_Solucion.ExecuteScalar();
            var NomEmpleado = cn_Nom_Empleado.ExecuteScalar();
            var fechaC = cn_fecha.ExecuteScalar();
            conexion.Close();
            //Se establece en los datos en el campo de texto
            TextBox6.Text = id_cliente.ToString();
            TextBox7.Text = id_Producto.ToString();
            TextBox8.Text = id_problema.ToString();
            TextBox9.Text = id_solucion.ToString();
            TextBox10.Text = id_empleado.ToString();
            TextBox11.Text = Estado.ToString();
            TextBox12.Text = seguimiento.ToString();
            TextBox13.Text = Nomcliente.ToString();
            TextBox14.Text = NomProducto.ToString();
            TextBox15.Text = TipoProblema.ToString();
            TextBox16.Text = Descripcionsolucion.ToString();
            TextBox17.Text = NomEmpleado.ToString();
            TextBox18.Text = fechaC.ToString();



        }


        protected void DropDownList9_SelectedIndexChanged1(object sender, EventArgs e)
        {
            var id_llamada = DropDownList9.SelectedItem.ToString();
            SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            string strSQL = "Select id_cliente,id_producto,id_problema,id_solucion,id_empleado,Estado_Resolucion_llamada,follow_up from caso2.llamada where id_llamada = " + id_llamada;
            var datos_Consulta = new SqlCommand(strSQL, conexion);
            conexion.Open();
            SqlDataReader reader = datos_Consulta.ExecuteReader();
            
            reader.Read();
            int id_Cliente = reader.GetInt32(reader.GetOrdinal("ID_Cliente"));
            int id_Producto = reader.GetInt32(reader.GetOrdinal("ID_Producto"));
            int id_Problema = reader.GetInt32(reader.GetOrdinal("ID_Problema"));
            int id_Solucion = reader.GetInt32(reader.GetOrdinal("ID_Solucion"));
            int id_empleado = reader.GetInt32(reader.GetOrdinal("ID_empleado"));
            int Estado_llamada = reader.GetInt16(reader.GetOrdinal("Estado_Resolucion_llamada"));
            int follow_up = reader.GetInt16(reader.GetOrdinal("follow_up"));

            reader.Close();
            conexion.Close();
            var c = id_Cliente.ToString();
            DropDownList10.SelectedValue = id_Cliente.ToString();
            DropDownList11.SelectedValue = id_Producto.ToString();
            DropDownList12.SelectedValue = id_Problema.ToString();
            DropDownList13.SelectedValue = id_Solucion.ToString();
            DropDownList14.SelectedValue = id_empleado.ToString();


            conexion.Open();
            string consultaSQL = "Select c.nombre as nombre,p.nombre as producto,pr.tipo as problema,s.descripcion as solucion,e.nombre as empleado from caso2.llamada l inner join caso2.cliente c on c.id_cliente = l.id_cliente inner join  caso2.problema pr on  pr.id_problema = l.id_problema inner join caso2.producto p on p.id_producto = l.id_problema inner join caso2.empleado e on e.id_empleado = l.id_empleado inner join caso2.solucion s on s.id_solucion = l.id_solucion where l.id_llamada = " + id_llamada;
            var datos_Consulta2 = new SqlCommand(consultaSQL, conexion);
            SqlDataReader reader1 = datos_Consulta2.ExecuteReader();
            reader1.Read();
            string C_Nombre = reader1.GetString(reader1.GetOrdinal("nombre"));
            string C_Producto = reader1.GetString(reader1.GetOrdinal("producto"));
            string C_Problema = reader1.GetString(reader1.GetOrdinal("problema"));
            string C_Solucion = reader1.GetString(reader1.GetOrdinal("solucion"));
            string C_Empleado = reader1.GetString(reader1.GetOrdinal("empleado"));

            TextBox27.Text = C_Nombre;
            TextBox28.Text = C_Producto;
            TextBox29.Text = C_Problema;
            TextBox30.Text = C_Solucion;
            TextBox31.Text = C_Empleado;



        }

        protected void DropDownList10_SelectedIndexChanged1(object sender, EventArgs e)
        {

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            string id_cliente = DropDownList10.SelectedItem.ToString();
            string strSQL = "select nombre from caso2.cliente where id_cliente = " + id_cliente;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox27.Text = cm.ToString();
        }

        protected void DropDownList11_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            string id_producto = DropDownList11.SelectedItem.ToString();
            string strSQL = "select nombre from caso2.producto where id_producto = " + id_producto;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox28.Text = cm.ToString();
        }

        protected void DropDownList12_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            string id_problema = DropDownList12.SelectedItem.ToString();
            string strSQL = "select tipo from caso2.problema where id_problema = " + id_problema;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox29.Text = cm.ToString();
        }

        protected void DropDownList13_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            string id_solucion = DropDownList13.SelectedItem.ToString();
            string strSQL = "select descripcion from caso2.solucion where id_solucion = " + id_solucion;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox30.Text = cm.ToString();
        }

        protected void DropDownList14_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            string id_empleado = DropDownList14.SelectedItem.ToString();
            string strSQL = "select nombre from caso2.empleado where id_empleado = " + id_empleado;
            var cmd = new SqlCommand(strSQL, cn);
            cn.Open();
            var cm = cmd.ExecuteScalar();
            cn.Close();
            TextBox31.Text = cm.ToString();
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            try{
                string llamada_id = DropDownList9.SelectedItem.ToString();
                string id_cliente = DropDownList10.SelectedItem.ToString();
                string id_producto = DropDownList11.SelectedItem.ToString();
                string id_problema = DropDownList12.SelectedItem.ToString();
                string id_solucion = DropDownList13.SelectedItem.ToString();
                string id_empleado = DropDownList14.SelectedItem.ToString();
                string estado = TextBox32.Text;
                string seguimiento = TextBox33.Text;

                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
                string strSQL = "UPDATE CASO2.LLAMADA set "+"id_cliente = " + int.Parse(id_cliente) + "," + "id_producto = " + int.Parse(id_producto) + "," + "id_problema = " + int.Parse(id_problema) + "," + "id_solucion = " + int.Parse(id_solucion) + "," + "id_empleado = " + int.Parse(id_empleado) + "," + "FOLLOW_UP = " + int.Parse(seguimiento) + "," + "ESTADO_RESOLUCION_LLAMADA = " + int.Parse(estado)+" WHERE ID_LLAMADA = "+ int.Parse(llamada_id); 
                var cmd = new SqlCommand(strSQL, cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                DropDownList9.Items.Clear();
                DropDownList9.DataSourceID = "SqlDataSource7";
                DropDownList9.DataTextField = "id_llamada";
                DropDownList9.DataValueField = "id_llamada";
                DropDownList8.Items.Clear();
                DropDownList8.DataSourceID = "SqlDataSource6";
                DropDownList8.DataTextField = "id_llamada";
                DropDownList8.DataValueField = "id_llamada";


                string script = @"<script type='text/javascript'>
                            alert('Los datos han sido actualizados correctamente');
                        </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }catch (Exception)
            {
                string script = @"<script type='text/javascript'>
                            alert('Los valores ingresados no son correctos');
                        </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }

        protected void DropDownList15_SelectedIndexChanged(object sender, EventArgs e)
        {
            int llamada = int.Parse(DropDownList15.SelectedItem.ToString());


            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);

            SqlDataAdapter sqladap = new SqlDataAdapter("select * from caso2.llamada where id_llamada= " + llamada, sqlcon);
            DataSet dset = new DataSet();
            sqladap.Fill(dset, "CASO2.LLAMADA");
            GridView1.DataSource = dset.Tables["CASO2.LLAMADA"].DefaultView;
            GridView1.DataBind(); 
        
    }
   

        protected void DropDownList16_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int cliente = int.Parse(DropDownList16.SelectedItem.ToString());


            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);

            SqlDataAdapter sqladap = new SqlDataAdapter("select * from caso2.llamada where id_cliente= " + cliente, sqlcon);
            DataSet dset = new DataSet();
            sqladap.Fill(dset, "CASO2.LLAMADA");
            GridView1.DataSource = dset.Tables["CASO2.LLAMADA"].DefaultView;
            GridView1.DataBind(); 
        }

        protected void DropDownList17_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int empleado = int.Parse(DropDownList17.SelectedItem.ToString());


            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);

            SqlDataAdapter sqladap = new SqlDataAdapter("select * from caso2.llamada where id_empleado= " + empleado, sqlcon);
            DataSet dset = new DataSet();
            sqladap.Fill(dset, "CASO2.LLAMADA");
            GridView1.DataSource = dset.Tables["CASO2.LLAMADA"].DefaultView;
            GridView1.DataBind(); 
        }

        protected void DropDownList18_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int producto = int.Parse(DropDownList18.SelectedItem.ToString());


            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);

            SqlDataAdapter sqladap = new SqlDataAdapter("select * from caso2.llamada where id_producto= " + producto, sqlcon);
            DataSet dset = new DataSet();
            sqladap.Fill(dset, "CASO2.LLAMADA");
            GridView1.DataSource = dset.Tables["CASO2.LLAMADA"].DefaultView;
            GridView1.DataBind(); 
        }

        protected void DropDownList19_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int problema = int.Parse(DropDownList19.SelectedItem.ToString());


            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);

            SqlDataAdapter sqladap = new SqlDataAdapter("select * from caso2.llamada where id_problema= " + problema, sqlcon);
            DataSet dset = new DataSet();
            sqladap.Fill(dset, "CASO2.LLAMADA");
            GridView1.DataSource = dset.Tables["CASO2.LLAMADA"].DefaultView;
            GridView1.DataBind(); 
        }

        protected void DropDownList20_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int solucion = int.Parse(DropDownList20.SelectedItem.ToString());


            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);

            SqlDataAdapter sqladap = new SqlDataAdapter("select * from caso2.llamada where id_solucion= " + solucion, sqlcon);
            DataSet dset = new DataSet();
            sqladap.Fill(dset, "CASO2.LLAMADA");
            GridView1.DataSource = dset.Tables["CASO2.LLAMADA"].DefaultView;
            GridView1.DataBind(); 
        }

        protected void DropDownList21_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int s = int.Parse(DropDownList21.SelectedItem.ToString());


            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);

            SqlDataAdapter sqladap = new SqlDataAdapter("select * from caso2.llamada where FOLLOW_UP= " + s, sqlcon);
            DataSet dset = new DataSet();
            sqladap.Fill(dset, "CASO2.LLAMADA");
            GridView1.DataSource = dset.Tables["CASO2.LLAMADA"].DefaultView;
            GridView1.DataBind(); 
        }

        protected void DropDownList22_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int estado = int.Parse(DropDownList22.SelectedItem.ToString());


            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);

            SqlDataAdapter sqladap = new SqlDataAdapter("select * from caso2.llamada where ESTADO_RESOLUCION_LLAMADA= " + estado, sqlcon);
            DataSet dset = new DataSet();
            sqladap.Fill(dset, "CASO2.LLAMADA");
            GridView1.DataSource = dset.Tables["CASO2.LLAMADA"].DefaultView;
            GridView1.DataBind(); 
        }

        protected void crearTXT()
        {
            StringWriter oStringWriter = new StringWriter();
            SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLAzureConnection"].ConnectionString);
            string strSQLVista = "Select id_llamada as llamada,id_cliente as cliente, id_empleado as empleado, id_producto as producto,id_problema as problema, id_solucion as  solucion, follow_up as seguimiento, Estado_resolucion_llamada as estado  from caso2.view_llamada";
            var comando = new SqlCommand(strSQLVista, conexion);
            conexion.Open();
            SqlDataReader reader1 = comando.ExecuteReader();



            Response.ContentType = "text/plain";

            Response.AddHeader("content-disposition", "attachment;filename=" + string.Format("Registro_llamadas-{0}.txt", string.Format("{0:dd-MM-yyyy}", DateTime.Today)));
            Response.Clear();

            using (StreamWriter writer = new StreamWriter(Response.OutputStream, Encoding.UTF8))
            {
                writer.WriteLine("---------------------------------------------------Registro de Llamadas--------------------------------------------------");
                writer.WriteLine();
                writer.WriteLine("ID_llamada " + "\t" + "ID_Cliente " + "\t" + "ID_Empleado" + "\t" + "ID_Producto" + "\t" + "ID_Problema" + "\t" + "ID_Solucion" + "\t" + "Follow_Up  " + "\t" + "Estado_Resolucion_Llamada");
                while (reader1.Read())
                {

                    int llamada = reader1.GetInt32(reader1.GetOrdinal("llamada"));
                    int cliente = reader1.GetInt32(reader1.GetOrdinal("cliente"));
                    int empleado = reader1.GetInt32(reader1.GetOrdinal("empleado"));
                    int producto = reader1.GetInt32(reader1.GetOrdinal("producto"));
                    int problema = reader1.GetInt32(reader1.GetOrdinal("problema"));
                    int solucion = reader1.GetInt32(reader1.GetOrdinal("solucion"));
                    int seguimiento = reader1.GetInt16(reader1.GetOrdinal("seguimiento"));
                    int estado = reader1.GetInt16(reader1.GetOrdinal("estado"));
                    writer.WriteLine(llamada + "\t\t" + cliente + "\t\t" + empleado + "\t\t" + producto + "\t\t" + problema + "\t\t" + solucion + "\t\t" + seguimiento + "\t\t" + estado);

                }
                Response.End();

            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            crearTXT();
        }
       

       
      
    }
}

