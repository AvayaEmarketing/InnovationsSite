using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

public partial class report : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public class Subscribe
    {

        public string id { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string email { get; set; }
        public string company { get; set; }
        public string country { get; set; }
        public string business { get; set; }
        public string language { get; set; }
        public string registerDate { get; set; }
    }

    public class Feedback
    {
        public string id { get; set; }
        public string overall { get; set; }
        public string comments { get; set; }
        public string email { get; set; }
        public string language { get; set; }
        public string registerDate { get; set; }
        
    }

    public static string DataTableToJSON(DataTable table)
    {
        List<Dictionary<string, object>> list = new List<Dictionary<string, object>>();

        foreach (DataRow row in table.Rows)
        {
            Dictionary<string, object> dict = new Dictionary<string, object>();

            foreach (DataColumn col in table.Columns)
            {
                dict[col.ColumnName] = row[col];
            }
            list.Add(dict);
        }
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        return serializer.Serialize(list);
    }

    [WebMethod]
    public static string getDatosReg()
    {
        string result;
        SqlDataReader datos;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["calawebConnectionString"].ToString();
        string strSQL = "SELECT id,firstname,lastname,email,company,country,business,language,convert(varchar(60),registerDate) as registerDate FROM InnovationsSubscribe";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        
        try
        {
            con.Open();
            datos = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(datos);
            result = DataTableToJSON(dt);
            //result = JsonConvert.SerializeObject(dt);
            con.Close();

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            result = "";
        }
        finally
        {
            con.Close();
        }
        return result;

    }

    [WebMethod]
    public static string getDatosReg2()
    {
        string result;
        SqlDataReader datos;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["calawebConnectionString"].ToString();
        string strSQL = "SELECT id,overall,comments,email,language,convert(varchar(60),registerDate) as registerDate FROM InnovationsFeedback";
        SqlCommand cmd = new SqlCommand(strSQL, con);

        try
        {
            con.Open();
            datos = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(datos);
            result = DataTableToJSON(dt);
            //result = JsonConvert.SerializeObject(dt);
            con.Close();

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            result = "";
        }
        finally
        {
            con.Close();
        }
        return result;

    }


    [WebMethod(EnableSession = true)]
    public static string validarIngresoAdmin(string name, string pass, string app)
    {

        string result = validarIngreso(name, pass, app);
        if (result == "ok")
        {
            var sessionUsuario = HttpContext.Current.Session;
            sessionUsuario["ID"] = name;
        }
        return result;
    }

    public static string validarIngreso(string name, string pass, string app)
    {

        string resultado = "";
        string usuario;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["calawebConnectionString"].ToString();

        string strSQL = "SELECT distinct usuario from UserData where usuario = @name and password = @pass and application = @app";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.Add("@name", SqlDbType.VarChar, 100);
        cmd.Parameters.Add("@pass", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@app", SqlDbType.VarChar, 100);
       
        //cmd2.Parameters["@Id"].Value = 0;
        cmd.Parameters["@name"].Value = name;
        cmd.Parameters["@pass"].Value = pass;
        cmd.Parameters["@app"].Value = app;


        try
        {
            con.Open();
            usuario = (String)cmd.ExecuteScalar();
            con.Close();
            if (name == usuario)
            {
                resultado = "ok";
            }
            else
            {
                resultado = "fail";
            }
        }
        catch (Exception ex)
        {
            resultado = "fail";
            Console.WriteLine(ex.Message);
        }
        finally
        {
            con.Close();
        }

        return resultado;
    }

    [WebMethod]
    public static string Convertir(string tipo)
    {
        string resultado = "error0";
        try
        {
            string path = HttpContext.Current.Server.MapPath("~");
            //path = path + "\\mx\\events\\movieinv";
            
            resultado = toExcel(path,tipo);
            
            
            HttpContext.Current.Response.SetCookie(new HttpCookie("fileDownload", "true") { Path = "/" });
        }
        catch (Exception e)
        {
            resultado = e.ToString();
        }
        return resultado;

    }

   

    [WebMethod(EnableSession = true)]
    public static string validaSession()
    {
        string result = "";
        var sessionUsuario = HttpContext.Current.Session;
        if (sessionUsuario["ID"] == null)
        {
            result = "fail";
        }
        else
        {
            result = sessionUsuario["ID"].ToString();
        }
        return result;
    }

    [WebMethod(EnableSession = true)]
    public static string cerrarSession()
    {
        var sessionUsuario = HttpContext.Current.Session;
        var resultado = "";
        try
        {
            sessionUsuario.Clear();
            sessionUsuario.Abandon();
            resultado = "ok";
        }
        catch (Exception)
        {
            resultado = "fail";
        }
        return resultado;
    }

    public static string toExcel(string path1, string tipo)
    {
        string respuesta = "";
        string data = "";
        string path = path1 + "\\ExcelFiles\\";
        if (!Directory.Exists(path))
            Directory.CreateDirectory(path);
        string nombre = DateTime.Now.ToString("yyyyMMddhhmmss") + "ExcelFiles.xls";
        string fullPath = path1 + "\\ExcelFiles\\" + nombre;
        string contenido = getContenido(tipo);
        if (tipo == "subscribe")
        {
            data = "<tr><th width=\"10%\">ID</th><th width=\"10%\">Firstname</th><th width=\"10%\">Lastname</th><th width=\"10%\">Email</th><th width=\"10%\">Company</th><th width=\"10%\">Country</th><th width=\"10%\">Bussines Size</th><th width=\"10%\">Language</th><th width=\"10%\">Register Date</th></tr>";
        }
        else 
        {
            data = "<tr><th width=\"10%\">ID</th><th width=\"10%\">Satisfied</th><th width=\"10%\">Comments</th><th width=\"10%\">Email</th><th width=\"10%\">Language</th><th width=\"10%\">Register Date</th></tr>";
        }
        contenido = data + contenido;
        contenido = "<table border = '1' style=" + '"' + "font-family: Verdana,Arial,sans-serif; font-size: 12px;" + '"' + ">" + contenido + "</table></body></html>";

        try
        {
            FileStream fs = new FileStream(fullPath, FileMode.OpenOrCreate, FileAccess.Write);


            using (StreamWriter writer = new StreamWriter(fs, Encoding.UTF8))
            {
                writer.Write(contenido);
            }
        }
        catch
        {
            respuesta = "fail";
        }
        finally
        {
            respuesta = nombre;
        }
        return respuesta;
    }

    public static string getContenido(string tipo)
    {
        string result = "";
        string resultado = "";
        string tabla = "";
        var serializer = new JavaScriptSerializer();
        if (tipo == "subscribe")
        {
            resultado = getDatosReg();
            List<Subscribe> values = serializer.Deserialize<List<Subscribe>>(resultado);
            
            foreach (var root in values)
            {
                tabla += "<tr>";
                tabla += "<td>" + root.id + "</td>";
                tabla += "<td>" + root.firstname + "</td>";
                tabla += "<td>" + root.lastname + "</td>";
                tabla += "<td>" + root.email + "</td>";
                tabla += "<td>" + root.company + "</td>";
                tabla += "<td>" + root.country + "</td>";
                tabla += "<td>" + root.business + "</td>";
                tabla += "<td>" + root.language + "</td>";
                tabla += "<td>" + root.registerDate + "</td>";
                tabla += "</tr>";
            }
        }
        else {
            resultado = getDatosReg2();
            List<Feedback> values = serializer.Deserialize<List<Feedback>>(resultado);

            foreach (var root in values)
            {
                tabla += "<tr>";
                tabla += "<td>" + root.id + "</td>";
                tabla += "<td>" + root.overall + "</td>";
                tabla += "<td>" + root.comments + "</td>";
                tabla += "<td>" + root.email + "</td>";
                tabla += "<td>" + root.language + "</td>";
                tabla += "<td>" + root.registerDate + "</td>";
                tabla += "</tr>";
            }
        }
         
        result = tabla;
        return result;
    }
}

