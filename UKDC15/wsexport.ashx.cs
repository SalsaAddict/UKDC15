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

    public class wsexport : IHttpHandler
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
                    Command.CommandText = "apiWorkshopsExport";
                    Command.Parameters.AddWithValue("EventId", Context.Request.QueryString["EventId"]);
                    using (XmlReader Reader = Command.ExecuteXmlReader())
                    {
                        XmlDocument Document = new XmlDocument();
                        Document.Load(Reader);
                        Context.Response.ContentType = "text/xml";
                        Context.Response.Write(Document.InnerXml);
                        Reader.Close();
                    }
                }
                Connection.Close();
            }
        }

        public bool IsReusable { get { return false; } }
    }

}