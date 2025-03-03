using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Bougies.Extensions;

namespace Bougies.Controllers
{
    public class CarritoController : Controller
    {
        private const string SessionKeyCarrito = "Carrito";
        private IRepositoryAdmin repo;
        public CarritoController(IRepositoryAdmin repo)
        {
            this.repo = repo;
        }
        public IActionResult Index()
        {
            List<Carrito> carrito = ObtenerCarrito();
            return View(carrito);
        }
        public async Task<IActionResult> AddProductCarrito(int id)
        {
            // 🔹 Obtener el producto de la base de datos
            Producto? prod = await this.repo.FindProducto(id);

            if (prod == null)
            {
                return NotFound();
            }

            List<Carrito> carrito = ObtenerCarrito();

            //obtener descuentos
            List<Descuento> descuentos = await this.repo.GetDescuentosAsync();
            int idDescuento = descuentos.FirstOrDefault(d => d.Id == prod.IdDescuento).Id;
            int descuento = descuentos.FirstOrDefault(d => d.Id == prod.IdDescuento).Valor;

            //comprobar si el producto ya esta en el carrito
            var item = carrito.FirstOrDefault(p => p.IdProducto == id);
            if (item != null)
            {
                item.Cantidad++;
            }
            else
            {
                carrito.Add(new Carrito
                {
                    IdProducto = prod.Id,
                    IdDescuento = idDescuento, 
                    Descuento = descuento,
                    Nombre = prod.Nombre,
                    Precio = prod.Precio,
                    Cantidad = 1,
                    Imagen = prod.Imagen
                });
            }

            // Guardar el carrito actualizado
            GuardarCarrito(carrito);

            return RedirectToAction("Index", "Carrito");
        }

        private List<Carrito> ObtenerCarrito()
        {
            return HttpContext.Session.GetObject<List<Carrito>>(SessionKeyCarrito) ?? new List<Carrito>();
        }
        private void GuardarCarrito(List<Carrito> carrito)
        {
            HttpContext.Session.SetObject(SessionKeyCarrito, carrito);
        }
    }
}
