using Bougies.Data;
using NugetBougies.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Bougies.Controllers
{
    public class PedidosController : Controller
    {
        private readonly BougiesContext context;

        public PedidosController(BougiesContext context)
        {
            this.context = context;
        }

        public IActionResult CrearPedido()
        {
            return View();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> CrearPedido([FromForm] Pedido pedido)
        {
            var ped = new Pedido
            {
                IdUsuario = pedido.IdUsuario,
                IdPedido = pedido.IdPedido,
                FechaPedido = pedido.FechaPedido,
                Total = pedido.Total,
                Estado = pedido.Estado,
                IdMetodoPago = pedido.IdMetodoPago,
                Direccion = pedido.Direccion,
                Ciudad = pedido.Ciudad,
                CodigoPostal = pedido.CodigoPostal,
                Poblacion = pedido.Poblacion
                //Cantidad = pedido.Cantidad
            };

            this.context.Pedidos.Add(ped);
            await this.context.SaveChangesAsync();

            return RedirectToAction("ConfirmacionPedido", new { idPedido = ped.IdPedido });
        }

        public async Task<IActionResult> ConfirmacionPedido(int idPedido)
        {
            //var pedido = this.context.DetallesPedido.FirstOrDefault(p => p.IdPedido == idPedido);
            //if (pedido == null)
            //{
            //    return NotFound();
            //}

            //return View(pedido);

            var pedido = await this.context.Pedidos
                .Include(p => p.Detalles)
                .ThenInclude(d => d.Producto)
                .FirstOrDefaultAsync(p => p.IdPedido == idPedido);

            if (pedido == null)
            {
                return NotFound();
            }

            return View(pedido);
        }

    }
}