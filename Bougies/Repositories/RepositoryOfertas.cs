using Bougies.Data;
using Bougies.Models;
using Microsoft.EntityFrameworkCore;

namespace Bougies.Repositories
{
    public class RepositoryOfertas
    {
        private BougiesContext context;

        public RepositoryOfertas(BougiesContext context)
        {
            this.context = context;
        }

        public async Task<List<Producto>> GetProductosRebajadosAsync()
        {
            var consulta = from datos in this.context.Producto where datos.IdDescuento != 1 select datos;
            return await consulta.ToListAsync();
        }
    }
}
