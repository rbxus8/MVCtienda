using System.Collections.Generic;
using System.Data.Entity;

namespace TiendaMVC.Models
{
    public class TiendaDbContext : DbContext
    {
        // Nombre de la cadena de conexión definida en Web.config
        public TiendaDbContext() : base("name=TiendaConnectionString") { }

        // Representa la tabla de usuarios
        public DbSet<User> Users { get; set; }
    }
}
