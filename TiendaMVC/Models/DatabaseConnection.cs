using Npgsql;
using System;

namespace TiendaMVC.Models
{
    public class DatabaseConnection
    {
        public string ProbarConexion()
        {
            try
            {
                // Connection string en formato Npgsql compatible
                string connectionString = "Host=aws-1-us-east-2.pooler.supabase.com;Port=6543;Username=postgres.gaxafybwspgwdnvrsgsm;Password=Database123.$hhy;Database=postgres;SslMode=Require";

                using (var conexion = new NpgsqlConnection(connectionString))
                {
                    conexion.Open();
                    using (var cmd = new NpgsqlCommand("SELECT NOW()", conexion))
                    {
                        var result = cmd.ExecuteScalar();
                        return "✅ Conexión exitosa a Supabase. Hora del servidor: " + result;
                    }
                }
            }
            catch (Exception ex)
            {
                return "❌ Error de conexión: " + ex.Message;
            }
        }
    }
}
