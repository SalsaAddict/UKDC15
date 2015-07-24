using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Web.Configuration;
using Newtonsoft.Json;

namespace UKDC15
{

    public class timetable : IHttpHandler
    {

        public void ProcessRequest(HttpContext Context)
        {
            using (SqlConnection Connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MYDC"].ConnectionString))
            {
                Connection.Open();
                using (SqlCommand Command = new SqlCommand())
                {
                    Command.Connection = Connection;
                    Command.CommandType = CommandType.StoredProcedure;
                    Command.CommandText = "apiTimetable";
                    Command.Parameters.AddWithValue("EventId", Context.Request.QueryString["EventId"]);
                    using (XmlReader Reader = Command.ExecuteXmlReader())
                    {
                        XmlDocument Document = new XmlDocument();
                        Document.Load(Reader);
                        Context.Response.ContentType = "text/json";
                        Context.Response.Write(JsonConvert.SerializeXmlNode(Document, Newtonsoft.Json.Formatting.Indented,true));
                        Reader.Close();
                    }
                }
                Connection.Close();
            }
        }

        public bool IsReusable { get { return false; } }
    }

}