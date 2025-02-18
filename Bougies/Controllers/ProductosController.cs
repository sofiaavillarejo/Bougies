using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

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

        public async Task<IActionResult> CrearProducto()
        {
            var descuentos = await this.repo.GetDescuentosAsync();

            // Pasa los descuentos a la vista a través de ViewBag
            ViewBag.Descuentos = new SelectList(descuentos, "Id", "Nombre");

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CrearProducto(Producto prod)
        {
            await this.repo.CreateProducto(prod.Nombre, prod.Descripcion, prod.Precio, prod.Stock, prod.IdCategoria, prod.IdDescuento ?? 0, prod.Imagen); //me aseguro que el iddescuento puede ser null
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> UpdateProducto(int id)
        {
            var producto = await this.repo.FindProducto(id);
            return View(producto);
        }
        [HttpPost]
        public async Task<IActionResult> UpdateProducto(Producto prod)
        {
            await this.repo.UpdateProducto(prod.Id, prod.Nombre, prod.Descripcion, prod.Precio, prod.Stock, prod.IdCategoria, prod.IdDescuento ?? 0, prod.Imagen);
            return RedirectToAction("Index");
        }

    }
}
