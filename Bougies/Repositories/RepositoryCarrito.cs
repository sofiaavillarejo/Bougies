using Bougies.Data;
using Bougies.Models;
using Microsoft.EntityFrameworkCore;

namespace Bougies.Repositories
{
    public class RepositoryCarrito
    {
        private BougiesContext context;

        public RepositoryCarrito(BougiesContext context)
        {
            this.context = context;
        }

        //sacar el id mas alto registrado
        public async Task<int> GetMaxIdPedido()
        {
            if(this.context.Pedidos.Count() == 0)
            {
                return 1;
            }else
            {
                return await this.context.Pedidos.MaxAsync(p => p.IdPedido) + 1;
            }
        }

        public async Task<int> GetMaxIdDetallesPedido()
        {
            if (this.context.DetallesPedido.Count() == 0)
            {
                return 1;
            }
            else
            {
                return await this.context.DetallesPedido.MaxAsync(p => p.Id) + 1;
            }
        }

        public async Task<int> TramitarPedido(int idUsuario, int idMetodoPago, string direccion, string ciudad, string codigoPostal, string poblacion, List<Carrito> carrito)
        {
            if(carrito == null || carrito.Count == 0)
            {
                throw new InvalidOperationException("No hay productos en el carrito");
            }

            decimal totalPedido = carrito.Sum(item => (item.Precio - (item.Precio * (item.Descuento / 100m))) * item.Cantidad);

            Pedido pedido = new Pedido
            {
                IdPedido = await this.GetMaxIdPedido(),
                IdUsuario = idUsuario,
                FechaPedido = DateTime.Now,
                Total = totalPedido,
                Estado = "Pendiente",
                IdMetodoPago = idMetodoPago,
                Direccion = direccion,
                Ciudad = ciudad,
                CodigoPostal = codigoPostal,
                Poblacion = poblacion
            };

            await this.context.Pedidos.AddAsync(pedido);
            await this.context.SaveChangesAsync();

            //insertar los detalles del pedido en la bbdd
            foreach(var item in carrito)
            {
                DetallesPedido detallePed = new DetallesPedido
                {
                    Id = await this.GetMaxIdDetallesPedido(),
                    IdPedido = pedido.IdPedido,
                    IdProducto = item.IdProducto,
                    Cantidad = item.Cantidad,
                    Total = (item.Precio - (item.Precio * (item.Descuento / 100m))) * item.Cantidad
                };

                await this.context.DetallesPedido.AddAsync(detallePed);
            }

            await this.context.SaveChangesAsync();
            return pedido.IdPedido;
        }

        // ----------------- BUSCAR CUPON EN LA BBDD -----------------
        public async Task<CuponDescuento> FindCuponDescuentoAsync(string cupon)
        {
            var consulta = from datos in this.context.CuponDescuento where datos.Codigo == cupon select datos;
            return await consulta.FirstOrDefaultAsync();
        }

        public async Task CuponUsado (string cupon)
        {
            CuponDescuento codigoCupon = await this.FindCuponDescuentoAsync(cupon);
            if(codigoCupon != null)
            {
                codigoCupon.Usado = true;

                await this.context.SaveChangesAsync();
            }else
            {
                throw new Exception("El cupón no se encontró en la base de datos.");
            }
        }
    }
}
