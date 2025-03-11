using Bougies.Data;
using Bougies.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Bougies.Controllers
{
    public class PedidosController : Controller
    {
        private readonly BougiesContext context;

        public PedidosController(BougiesContext context) {
            this.context = context;
        }

        public IActionResult CrearPedido()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CrearPedido([FromForm] Pedido pedido)
        {
            var ped = new Pedido
            {
                IdUsuario = pedido.IdUsuario,
                FechaPedido = pedido.FechaPedido,
                Total = pedido.Total,
                Estado = pedido.Estado,
                IdMetodoPago = pedido.IdMetodoPago,
                Direccion = pedido.Direccion,
                Ciudad = pedido.Ciudad,
                CodigoPostal = pedido.CodigoPostal,
                Poblacion = pedido.Poblacion
            };

            this.context.Pedidos.Add(ped);
            await this.context.SaveChangesAsync();

            return RedirectToAction("Tienda", "Productos");
        }


    }
}
