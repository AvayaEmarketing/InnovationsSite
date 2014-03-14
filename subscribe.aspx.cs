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


public partial class subscribe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    public static string getCountries()
    {
        string result;
        SqlDataReader datos;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["calawebConnectionString"].ToString();
        string strSQL = "SELECT isoCode,Country from C_Country order by Country";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        try
        {
            con.Open();
            datos = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(datos);
            result = DataTableToJSON(dt);
            //result = new JavaScriptSerializer().Serialize(dt);
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
    public static string putData(string firstname,string lastname, string email, string company, string country, string business, string language)
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

        string stmt = "INSERT INTO InnovationsSubscribe (firstname, lastname, email, company, country, business, registerDate, registerDate2, language)  VALUES (@firstname,@lastname, @email, @company, @country, @business, @registerDate, @registerDate2, @language)";

        SqlCommand cmd2 = new SqlCommand(stmt, con);
       
        cmd2.Parameters.Add("@firstname", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@lastname", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@email", SqlDbType.VarChar, 150);
        cmd2.Parameters.Add("@company", SqlDbType.VarChar, 150);
        cmd2.Parameters.Add("@country", SqlDbType.VarChar, 200);
        cmd2.Parameters.Add("@business", SqlDbType.VarChar, 200);
        cmd2.Parameters.Add("@registerDate", SqlDbType.DateTime);
        cmd2.Parameters.Add("@registerDate2", SqlDbType.VarChar, 60);
        cmd2.Parameters.Add("@language", SqlDbType.VarChar, 50);

        cmd2.Parameters["@firstname"].Value = firstname;
        cmd2.Parameters["@lastname"].Value = lastname;
        cmd2.Parameters["@email"].Value = email;
        cmd2.Parameters["@company"].Value = company;
        cmd2.Parameters["@country"].Value = company;
        cmd2.Parameters["@business"].Value = business;
        cmd2.Parameters["@registerDate"].Value = datt;
        cmd2.Parameters["@registerDate2"].Value = datt;
        cmd2.Parameters["@language"].Value = language;
        

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

