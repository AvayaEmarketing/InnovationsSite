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



    public partial class EnviarMail1 : System.Web.UI.Page
    {
        protected void Page_Load ( object sender, EventArgs e )
        {

        }

        [WebMethod]
        public static string sendMails ( string mail_from, string correo, string mensaje, string idioma )
        {
            string result = "";
            try
            {
                string contenido = getContenidoMail(mensaje, idioma);
                //string plantilla = getPlantilla();
                string rta_mail = SendMail(correo, "e-marketing@avaya.com", "Avaya Innovations Magazine", contenido);
                result = "ok";
            }
            catch (Exception ex)
            {
                result = "false" + ex;
            }
            return result;
        }

        public static string SendMail ( string to, string from, string subject, string contenido )
        {
            string respuesta = "";

            MailAddress sendfrom = new MailAddress(from);
            //MailAddress sendto = new MailAddress(to);
            MailMessage message = new MailMessage();

            ContentType mimeType = new System.Net.Mime.ContentType("text/html");
            string body = HttpUtility.HtmlDecode(contenido);
            AlternateView alternate = AlternateView.CreateAlternateViewFromString(body, mimeType);
            message.AlternateViews.Add(alternate);

            string[] emailTo = to.Split(',');
            for (int i = 0; i < emailTo.GetLength(0); i++)
                message.To.Add(emailTo[i]);

            message.From = new MailAddress(from);
            //message.To.Add(to);
            message.Subject = subject;

            SmtpClient client = new SmtpClient("localhost");

            try
            {
                client.Send(message);
                respuesta = "ok";

            }
            catch (SmtpException e)
            {
                respuesta = "fail";
                throw new SmtpException(e.Message);

            }
            return respuesta;
        }

        public static string getPlantilla (string idioma )
        {
            string fullPath = HttpContext.Current.Server.MapPath("~");
            string html = "";
            //html = File.ReadAllText(fullPath + "\\mail\\index.html");
            //html = File.ReadAllText(fullPath + "\\cala\\commons\\inv-repo\\share\\mail\\index.html");
            html = File.ReadAllText(fullPath + "\\ShareContentInnovations\\mail\\mail-"+idioma+".html");
            return html;
        }

        public static string getContenidoMail (string observacion, string idioma )
        {
            string plantilla = getPlantilla(idioma);

            Dictionary<string, string> dataIndex = new Dictionary<string, string>();
            dataIndex.Add("{mensaje}", observacion);

            string buscar = "";
            string reemplazar = "";
            string index = "";
            //Recorrer la plantilla del index para reemplazar el contenido
            foreach (var datos in dataIndex)
            {
                buscar = datos.Key;
                reemplazar = datos.Value;
                index = plantilla.Replace(buscar, reemplazar);
                plantilla = index;
            }

            return plantilla;
        }
		
	[WebMethod]
    public static string putData(string name, string mailto, string comments)
	{
        string result = "";
        DateTime datt = DateTime.Now;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["calawebConnectionString"].ToString();

        string strSQL = "SELECT CURRENT_TIMESTAMP AS registerDate";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        try
        {
            con.Open();
            datt = (DateTime)cmd.ExecuteScalar();
            con.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            con.Close();
        }

        string stmt = "INSERT INTO InnovationsShareContent (registerDate, name, mailto ,comments)  VALUES (@registerDate, @name, @mailto, @comments)";

        SqlCommand cmd2 = new SqlCommand(stmt, con);
		
		cmd2.Parameters.Add("@registerDate", SqlDbType.VarChar, 60);
        cmd2.Parameters.Add("@name", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@mailto", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@comments", SqlDbType.VarChar, 150);

        cmd2.Parameters["@registerDate"].Value = datt;
		cmd2.Parameters["@name"].Value = name;
        cmd2.Parameters["@mailto"].Value = mailto;
        cmd2.Parameters["@comments"].Value = comments;

        try
        {
            con.Open();
            cmd2.ExecuteScalar();
            result = "ok";

            con.Close();

        }
        catch (Exception ex)
        {
            result = "fail";
            Console.WriteLine(ex.Message);
        }
        finally
        {
            con.Close();
        }
        return result;

    }
	
	
    }

