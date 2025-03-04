using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bougies.Models
{
    [Table("DetallesPedido")]
    public class DetallesPedido
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }

        [Column("IdPedido")]
        public int IdPedido { get; set; }

        [Column("IdProducto")]
        public int IdProducto { get; set; }

        [Column("Cantidad")]
        public int Cantidad { get; set; }

        [Column("Total")]
        public decimal Total { get; set; }
    }
}
