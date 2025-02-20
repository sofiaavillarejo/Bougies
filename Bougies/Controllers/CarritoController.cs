using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

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

            //comprobar si el prod ya esta en el carrito
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
                    Nombre = prod.Nombre,
                    Precio = prod.Precio,
                    Cantidad = 1,
                    Imagen = prod.Imagen
                });
            }

            // 🔹 Guardar el carrito actualizado en la sesión
            GuardarCarrito(carrito);

            return RedirectToAction("Index", "Carrito");
        }


        private List<Carrito> ObtenerCarrito()
        {
            string carritoSession = HttpContext.Session.GetString(SessionKeyCarrito);
            return carritoSession != null ? JsonConvert.DeserializeObject<List<Carrito>>(carritoSession) : new List<Carrito>();
        }
        private void GuardarCarrito(List<Carrito> carrito)
        {
            HttpContext.Session.SetString(SessionKeyCarrito, JsonConvert.SerializeObject(carrito));

        }
    }
}
