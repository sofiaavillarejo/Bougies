using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Bougies.Extensions;
using Microsoft.Extensions.Caching.Memory;
using Bougies.Data;
using Microsoft.EntityFrameworkCore;
using Bougies.Filters;
using System.Security.Claims;
using System.Runtime.InteropServices;

namespace Bougies.Controllers
{
    public class CarritoController : Controller
    {
        private const string SessionKeyCarrito = "Carrito";
        private IRepositoryBougies irepo;
        private RepositoryBougies repo;
        private IMemoryCache cache;
        private BougiesContext context;
        public CarritoController(BougiesContext context, IRepositoryBougies irepo, RepositoryBougies repo, IMemoryCache cache)
        {
            this.irepo = irepo;
            this.repo = repo;
            this.cache = cache;
            this.context = context;
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

            decimal descuentoImporte = (prod.Precio * descuento) / 100m;
            HttpContext.Session.SetDecimal("ImporteDescuento", descuentoImporte);

            // Guardar el carrito actualizado
            GuardarCarrito(carrito);

            return RedirectToAction("Index", "Carrito");
        }

        private List<Carrito> ObtenerCarrito()
        {
            int gastosEnvio = 6;
            HttpContext.Session.SetInt32("GastosEnvio", gastosEnvio);
            return HttpContext.Session.GetObject<List<Carrito>>(SessionKeyCarrito) ?? new List<Carrito>();
        }
        private void GuardarCarrito(List<Carrito> carrito)
        {
            HttpContext.Session.SetObject(SessionKeyCarrito, carrito);
        }

        [ValidateAntiForgeryToken]
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
        public async Task<IActionResult> EliminarDelCarrito(int idProducto)
        {
            List<Carrito> carrito = ObtenerCarrito();
            var cupon = HttpContext.Session.GetString("DESCUENTO");

            carrito.RemoveAll(p => p.IdProducto == idProducto);
            HttpContext.Session.Remove(SessionKeyCarrito);
            HttpContext.Session.Remove("DescuentoTotal");
            HttpContext.Session.Remove("TotalConDescuento");
            if (!carrito.Any())
            {
                var codigoValor = await this.context.CuponDescuento
                    .FirstOrDefaultAsync(c => c.Codigo == cupon && c.Usado == true);
                if (codigoValor != null)
                {
                    
                    HttpContext.Session.Remove("DESCUENTO");
                    codigoValor.Usado = false;
                    this.context.Update(codigoValor);
                    await this.context.SaveChangesAsync();
                }
            }
            GuardarCarrito(carrito);

            return RedirectToAction("Index");
        }

        // ----------------- TRAMITAR PEDIDO -----------------

        [AuthorizeUsers]
        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> TramitarPedido(int idMetodoPago, string direccion, string ciudad, string codigoPostal, string poblacion)
        {
            List<Carrito> carrito = ObtenerCarrito();

            if (carrito.Count == 0)
            {
                return RedirectToAction("Productos");
            }
            int idUsuario = int.Parse(User.FindFirst("IdUser").Value);
            int idPedido = await this.repo.TramitarPedido(idUsuario, idMetodoPago, direccion, ciudad, codigoPostal, poblacion, carrito);

            HttpContext.Session.Remove(SessionKeyCarrito);

            return RedirectToAction("ConfirmacionPedido", "Pedidos", new { idPedido = idPedido });

        }

        // ----------------- VACÍAR CARRITO -----------------
        public async Task<IActionResult> VaciarCarrito()
        {
            string codigoDescuento = HttpContext.Session.GetString("DESCUENTO");
            await MarcarCuponComoDisponible(codigoDescuento);

            // Eliminar el carrito y el cupón de la sesión
            HttpContext.Session.Remove(SessionKeyCarrito);
            HttpContext.Session.Remove("DESCUENTO");
            HttpContext.Session.Remove("DescuentoTotal");
            HttpContext.Session.Remove("TotalConDescuento");

            return RedirectToAction("Productos", "Tienda");
        }

        //----------MARCAR CUPON DESCUENTO COMO DISPONIBLE DE NUEVO -----//
        private async Task MarcarCuponComoDisponible(string codigoDescuento)
        {
            if (codigoDescuento != null)
            {
                var codigoValor = await this.context.CuponDescuento
                    .FirstOrDefaultAsync(c => c.Codigo == codigoDescuento && c.Usado == true);

                if (codigoValor != null)
                {
                    codigoValor.Usado = false;
                    this.context.Update(codigoValor);
                    await this.context.SaveChangesAsync();
                }
            }
        }

        // ----------------- APLICAR CUPÓN DESCUENTO -----------------

        public async Task<IActionResult> AplicarCupon(string cupon)
        {
            // Verificar si el cupón ya fue usado
            if (HttpContext.Session.GetString("DESCUENTO") != null)
            {
                TempData["Error"] = "El cupón ya ha sido aplicado anteriormente.";
                return RedirectToAction("Index");
            }

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

        [AuthorizeUsers]
        public IActionResult Checkout()
        {
            return View();
        }





    }
}
