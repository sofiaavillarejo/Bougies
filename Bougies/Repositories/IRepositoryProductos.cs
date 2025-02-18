using Bougies.Models;

namespace Bougies.Repositories
{
    public interface IRepositoryProductos
    {
        Task<List<Producto>> GetProductosAsync();
        Task CreateProducto(string nombre, string descripcion, decimal precio, int stock, int idCategoria, int idDescuento, string imagen);
        Task UpdateProducto(string nombre, string descripcion, decimal precio, int stock, int idCategoria, int idDescuento, string imagen);

    }
}
