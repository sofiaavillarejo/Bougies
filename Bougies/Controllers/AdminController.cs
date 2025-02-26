using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Bougies.Controllers
{
    public class AdminController : Controller
    {
        private IRepositoryAdmin repo;
        public AdminController(IRepositoryAdmin repo)
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

        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> CrearProducto(Producto prod, IFormFile imagen)
        {
            if (imagen != null && imagen.Length > 0)
            {
                // Generar un nombre único para la imagen
                var fileName = Path.GetFileName(imagen.FileName);

                // Generar la ruta completa para guardar la imagen en wwwroot/imagenes/
                var directoryPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images");

                // Verificar si la carpeta de imágenes existe, si no existe, crearla
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                var filePath = Path.Combine(directoryPath, fileName);

                // Guardar la imagen en el servidor
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await imagen.CopyToAsync(stream);
                }

                // Asignar solo el nombre de la imagen al producto
                prod.Imagen = fileName;
            }

            // Guarda el producto en la base de datos
            await this.repo.CreateProducto(prod.Nombre, prod.Descripcion, prod.Precio, prod.Stock, prod.IdCategoria, prod.IdDescuento, prod.Imagen);

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> UpdateProducto(int id)
        {
            //CAMBIAR POR EL MODEL PRODUCTO
            var producto = await this.repo.FindProducto(id);
            return View(producto);
        }
        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> UpdateProducto(Producto prod)
        {
            await this.repo.UpdateProducto(prod.Id, prod.Nombre, prod.Descripcion, prod.Precio, prod.Stock, prod.IdCategoria, prod.IdDescuento, prod.Imagen);
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Delete(int id)
        {
            await this.repo.DeleteProducto(id);
            return RedirectToAction("Index");
        }

    }
}
