using System.Collections.Specialized;
using System.Data;
using Bougies.Data;
using Bougies.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations.Operations;

#region STORED PROCEDURES
#endregion

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
                IdDescuento = idDescuento,
                Imagen = imagen
            };

            this.context.Producto.Add(nuevoProducto);
            await this.context.SaveChangesAsync();
        }
        public async Task<Producto> FindProducto(int id)
        {
            var consulta = from datos in this.context.Producto where datos.Id == id select datos;
            return await consulta.FirstOrDefaultAsync();
        }

        public async Task UpdateProducto(int id, string nombre, string descripcion, decimal precio, int stock, int idCategoria, int idDescuento, string imagen)
        {
            Producto prod = await this.FindProducto(id);

            if (prod != null)
            {
                prod.Nombre = nombre;
                prod.Descripcion = descripcion;
                prod.Precio = precio;
                prod.Stock = stock;
                prod.IdCategoria = idCategoria;
                prod.IdDescuento = idDescuento;
                prod.Imagen = imagen;

                await this.context.SaveChangesAsync();
            }
        }

        //extraer los descuentos de la bbdd
        public async Task<List<Descuento>> GetDescuentosAsync()
        {
            var consulta = from datos in this.context.Descuento select datos;
            return await consulta.ToListAsync();
        }

        public async Task DeleteProducto(int id)
        {
            Producto prod = await this.FindProducto(id);
            this.context.Producto.Remove(prod);
            await this.context.SaveChangesAsync();
        }

        //METODO PARA COGER LOS ROLES QUE HAY E IMPLANTARLO EN LOS MENUS DE PLANTILLAS
        public async Task<List<Roles>> GetRolesAsync()
        {
            var consulta = from datos in this.context.Roles select datos;
            return await consulta.ToListAsync();
        }
    }
}
