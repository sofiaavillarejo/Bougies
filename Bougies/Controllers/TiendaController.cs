using System.Diagnostics;
using Bougies.Data;
using NugetBougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Bougies.Controllers
{
    public class TiendaController : Controller
    {
        private readonly ILogger<TiendaController> _logger;
        private IRepositoryBougies repo;
        private BougiesContext context;
        public TiendaController(ILogger<TiendaController> logger, IRepositoryBougies repo, BougiesContext context)
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

        public async Task<IActionResult> DetalleProducto(int idProducto)
        {
            Producto prod = await this.repo.FindProducto(idProducto);
            int descuento = prod.IdDescuento != null ? await this.repo.GetValorDescuentoAsync(prod.IdDescuento) : 0;

            // Calcular precio con descuento y asignarlo al modelo
            prod.PrecioDescuento = prod.Precio - (prod.Precio * ((decimal)descuento / 100));

            return View(prod);
        }

        public async Task<IActionResult> BuscadorAjax(string query)
        {
            if (string.IsNullOrWhiteSpace(query))
            {
                return PartialView("_ResultadosBusqueda", new List<ProductoView>());
            }

            var productos = await context.Producto
                .Where(p => p.Nombre.Contains(query)).Take(4).ToListAsync(); 

            var productosView = new List<ProductoView>();

            foreach (var producto in productos)
            {
                // Get discount value (similar to the 'Productos' action)
                int descuento = await this.repo.GetValorDescuentoAsync(producto.IdDescuento);

                // Apply discount logic
                decimal precioDescuento = (descuento > 0)
                    ? producto.Precio - (producto.Precio * descuento / 100)
                    : producto.Precio;

                // Create ProductoView and map the properties
                productosView.Add(new ProductoView
                {
                    IdProducto = producto.Id,
                    Nombre = producto.Nombre,
                    Descripcion = producto.Descripcion,
                    Imagen = producto.Imagen,
                    Precio = producto.Precio,
                    PrecioDescuento = precioDescuento
                });
            }
            return PartialView("_ResultadosBusqueda", productosView);
        }

        public async Task<IActionResult> Ofertas()
        {
            List<Producto> productosRebajados = await this.repo.GetProductosRebajadosAsync();

            foreach (var producto in productosRebajados)
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
            return View(productosRebajados);
        } 
    }
}
