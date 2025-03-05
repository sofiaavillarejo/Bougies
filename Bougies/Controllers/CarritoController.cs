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
        private IRepositoryAdmin irepo;
        private RepositoryCarrito repo;
        public CarritoController(IRepositoryAdmin irepo, RepositoryCarrito repo)
        {
            this.irepo = irepo;
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
            Producto? prod = await this.irepo.FindProducto(id);

            if (prod == null)
            {
                return NotFound();
            }

            List<Carrito> carrito = ObtenerCarrito();

            //obtener descuentos
            List<Descuento> descuentos = await this.irepo.GetDescuentosAsync();
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

        [HttpPost]
        public IActionResult ActualizarCantidad(int idProducto, string accion)
        {
            List<Carrito> carrito = HttpContext.Session.GetObject<List<Carrito>>("Carrito") ?? new List<Carrito>();

            var item = carrito.FirstOrDefault(p => p.IdProducto == idProducto);
            if (item != null)
            {
                if (accion == "sumar")
                {
                    item.Cantidad++;
                }
                else if (accion == "restar")
                {
                    item.Cantidad--;

                    // Si la cantidad es 0, eliminamos el producto
                    if (item.Cantidad <= 0)
                    {
                        carrito.Remove(item);
                    }
                }

                HttpContext.Session.SetObject("Carrito", carrito);
            }

            return RedirectToAction("Index");
        }

        // ----------------- ELIMINAR PRODUCTO DEL CARRITO -----------------
        public IActionResult EliminarDelCarrito(int idProducto)
        {
            List<Carrito> carrito = ObtenerCarrito();
            carrito.RemoveAll(p => p.IdProducto == idProducto);
            GuardarCarrito(carrito);

            return RedirectToAction("Index");
        }

        // ----------------- TRAMITAR PEDIDO -----------------
        [HttpPost]
        public async Task<IActionResult> TramitarPedido(int idMetodoPago, string direccion, string ciudad, string codigoPostal, string poblacion)
        {
            List<Carrito> carrito = ObtenerCarrito();

            if (carrito.Count == 0)
            {
                return RedirectToAction("Productos");
            }

            int idUsuario = HttpContext.Session.GetInt32("idUser") ?? 0;
            if (idUsuario == 0)
            {
                ViewData["Error"] = "Debes iniciar sesión para realizar un pedido.";
                return RedirectToAction("Login", "Usuarios");
            }

            try
            {
                int idPedido = await this.repo.TramitarPedido(idUsuario, idMetodoPago, direccion, ciudad, codigoPostal, poblacion, carrito);

                // Limpiar carrito tras realizar el pedido
                HttpContext.Session.Remove(SessionKeyCarrito);

                ViewData["Success"] = "Pedido tramitado correctamente.";
                return RedirectToAction("PedidoConfirmado", new { idPedido });
            }
            catch (Exception ex)
            {
                TempData["Error"] = $"Error al procesar el pedido: {ex.Message}";
                return RedirectToAction("Index");
            }
        }

        // ----------------- VACÍAR CARRITO -----------------
        public IActionResult VaciarCarrito()
        {
            HttpContext.Session.Remove(SessionKeyCarrito);
            return RedirectToAction("Productos", "Tienda");
        }

        // ----------------- APLICAR CUPÓN DESCUENTO -----------------

        public async Task<IActionResult> AplicarCupon(string cupon)
        {
            // Buscar el cupón en la base de datos
            CuponDescuento codigoCupon = await this.repo.FindCuponDescuentoAsync(cupon);
            HttpContext.Session.SetString("DESCUENTO", codigoCupon.Codigo);

            if (codigoCupon == null || !codigoCupon.Activo || codigoCupon.Usado)
            {
                TempData["Error"] = "El código de cupón no es válido o ya ha sido utilizado.";
                return RedirectToAction("Index");
            }
            else
            {
                // Si el cupón es válido, calcular el descuento sobre el total del carrito
                List<Carrito> carrito = ObtenerCarrito();

                decimal total = carrito.Sum(item => item.Precio * item.Cantidad);
                decimal descuentoTotal = (total * codigoCupon.Descuento) / 100;
                decimal totalConDescuento = total - descuentoTotal;

                // Guardar el descuento total y el total con descuento en la sesión
                HttpContext.Session.SetDecimal("DescuentoTotal", descuentoTotal);
                HttpContext.Session.SetDecimal("TotalConDescuento", totalConDescuento);

                // Marcar el cupón como usado
                await this.repo.CuponUsado(codigoCupon.Codigo);

                // Guardar el carrito si es necesario (aunque no modificamos individualmente los productos)
                GuardarCarrito(carrito);

                TempData["Success"] = "Cupón aplicado correctamente.";
            }

            List<Carrito> carritoActualizado = ObtenerCarrito();
            return View("Index", carritoActualizado);
        }





    }
}
