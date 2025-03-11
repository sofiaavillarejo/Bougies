using Bougies.Models;

namespace Bougies.Repositories
{
    public interface IRepositoryAdmin
    {
        Task<List<Producto>> GetProductosAsync();
        Task CreateProducto(string nombre, string descripcion, decimal precio, int stock, int idCategoria, int idDescuento, string imagen);
        Task<Producto> FindProducto(int id);
        Task UpdateProducto(int id, string nombre, string descripcion, decimal precio, int stock, int idCategoria, int idDescuento, string imagen);
        Task<List<Descuento>> GetDescuentosAsync();
        Task<int> GetValorDescuentoAsync(int idDescuento);
        Task DeleteProducto(int id);

        //ROLES DE USUARIO
        Task<List<Roles>> GetRolesAsync();

        Task<List<Producto>> GetProductosRebajadosAsync();
    }
}
