using System.Diagnostics;
using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Bougies.Controllers
{
    public class TiendaController : Controller
    {
        private readonly ILogger<TiendaController> _logger;
        private IRepositoryAdmin repo;
        public TiendaController(ILogger<TiendaController> logger, IRepositoryAdmin repo)
        {
            _logger = logger;
            this.repo = repo;
        }

        public async Task<IActionResult> Index()
        {
            List<Producto> productos = await this.repo.GetProductosAsync();
            return View(productos);
        }

        public async Task<IActionResult> Productos()
        {
            List<Producto> productos = await this.repo.GetProductosAsync();
            return View(productos);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Carrito()
        {
            return View();
        }

        public async Task<IActionResult> DetalleProducto(int idProducto) {
            Producto prod = await this.repo.FindProducto(idProducto);
            return View(prod);
        }
    }
}
