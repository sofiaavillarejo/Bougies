﻿using Bougies.Models;
using Microsoft.EntityFrameworkCore;

namespace Bougies.Data
{
    public class BougiesContext: DbContext
    {
        public BougiesContext(DbContextOptions<BougiesContext> options) : base(options) { }
        public DbSet<Producto> Producto { get; set; }
        public DbSet<Descuento> Descuento { get; set; }
        public DbSet<Roles> Roles { get; set; }
    }
}
