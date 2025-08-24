using System;
using System.Configuration;
using Npgsql;

namespace TiendaMVC.Models
{
    public class UserRepository
    {
        private readonly string _connectionString;

        public UserRepository()
        {
            // Lee la cadena de conexión desde Web.config
            _connectionString = ConfigurationManager.ConnectionStrings["PostgresConnection"].ConnectionString;
        }

        // Método para validar el usuario
        public bool ValidarUsuario(string correo, string clave)
        {
            using (var connection = new NpgsqlConnection(_connectionString))
            {
                connection.Open();

                string query = "SELECT EXISTS (SELECT 1 FROM usuarios WHERE correo = @correo AND clave = @clave)";

                using (var cmd = new NpgsqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("correo", correo);
                    cmd.Parameters.AddWithValue("clave", clave);

                    bool exists = (bool)cmd.ExecuteScalar();
                    return exists;
                }
            }
        }
    }
}
