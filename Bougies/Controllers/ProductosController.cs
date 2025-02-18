using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Bougies.Controllers
{
    public class ProductosController : Controller
    {
        private IRepositoryProductos repo;
        public ProductosController(IRepositoryProductos repo)
        {
            this.repo = repo;
        }
        public async Task<IActionResult> Index()
        {
            List<Producto> productos = await this.repo.GetProductosAsync();
            return View(productos);
        }

        public IActionResult CrearProducto()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> CrearProducto(Producto prod)
        {
            await this.repo.CreateProducto(prod.Nombre, prod.Descripcion, prod.Precio, prod.Stock, prod.IdCategoria, prod.IdDescuento ?? 0, prod.Imagen); //me aseguro que el iddescuento puede ser null
            return RedirectToAction("Index");
        }
    }
}
