﻿using System.Collections.Specialized;
using System.Data;
using Bougies.Data;
using Bougies.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations.Operations;

namespace Bougies.Repositories
{
    public class RepositoryProductos: IRepositoryProductos
    {
        private BougiesContext context;

        public RepositoryProductos(BougiesContext context)
        {
            this.context = context;
        }

        public async Task<List<Producto>> GetProductosAsync()
        {
            var consulta = from datos in this.context.Producto select datos;
            return await consulta.ToListAsync();
        }

        public async Task CreateProducto(string nombre, string descripcion, decimal precio, int stock, int idCategoria, int idDescuento, string imagen)
        {
            var nuevoProducto = new Producto
            {
                Nombre = nombre,
                Descripcion = descripcion,
                Precio = precio,
                Stock = stock,
                IdCategoria = idCategoria,
                IdDescuento = idDescuento != 0 ? (int?)idDescuento : null,
                Imagen = imagen
            };

            this.context.Producto.Add(nuevoProducto);
            await this.context.SaveChangesAsync();
        }

    }
}
