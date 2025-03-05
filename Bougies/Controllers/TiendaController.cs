using System.Diagnostics;
using Bougies.Data;
using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Bougies.Controllers
{
    public class TiendaController : Controller
    {
        private readonly ILogger<TiendaController> _logger;
        private IRepositoryAdmin repo;
        private BougiesContext context;
        public TiendaController(ILogger<TiendaController> logger, IRepositoryAdmin repo, BougiesContext context)
        {
            _logger = logger;
            this.repo = repo;
            this.context = context;
        }

        public async Task<IActionResult> Index()
        {
            List<Producto> productos = await this.repo.GetProductosAsync();
            return View(productos);
        }

        public async Task<IActionResult> Productos()
{
    List<Producto> productos = await this.repo.GetProductosAsync();

    foreach (var producto in productos)
    {
        int descuento = await this.repo.GetValorDescuentoAsync(producto.IdDescuento);
        
        if (descuento > 0)
        {
            producto.PrecioDescuento = producto.Precio - (producto.Precio * descuento / 100);
        }
        else
        {
            producto.PrecioDescuento = producto.Precio; // Si no hay descuento, mantiene el mismo precio
        }
    }

    return View(productos);
}




        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        //public IActionResult Carrito()
        //{
        //    return View();
        //}

        public async Task<IActionResult> DetalleProducto(int idProducto) {
            Producto prod = await this.repo.FindProducto(idProducto);
            return View(prod);
        }

    }
}
