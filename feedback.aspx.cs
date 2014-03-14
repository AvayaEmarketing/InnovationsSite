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


public partial class feedback : System.Web.UI.Page
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

   

    [WebMethod(EnableSession = true)]
    public static string putData(string overall, string email, string comments)
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

        string stmt = "INSERT INTO InnovationsFeedback (overall, comments, email, registerDate, registerDate2)  VALUES (@overall,@comments, @email, @registerDate, @registerDate2)";

        SqlCommand cmd2 = new SqlCommand(stmt, con);

        cmd2.Parameters.Add("@overall", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@comments", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@email", SqlDbType.VarChar, 150);
        cmd2.Parameters.Add("@registerDate", SqlDbType.DateTime);
        cmd2.Parameters.Add("@registerDate2", SqlDbType.VarChar, 60);

        cmd2.Parameters["@overall"].Value = overall;
        cmd2.Parameters["@comments"].Value = comments;
        cmd2.Parameters["@email"].Value = email;
        cmd2.Parameters["@registerDate"].Value = datt;
        cmd2.Parameters["@registerDate2"].Value = datt;


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

