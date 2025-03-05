using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bougies.Models
{
    [Table("Productos")]
    public class Producto
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }
        [Column("Nombre")]
        public string Nombre { get; set; }
        [Column("Descripcion")]
        public string Descripcion { get; set; }
        [Column("Precio")]
        public decimal Precio { get; set; }

        [NotMapped]
        public decimal PrecioDescuento { get; set; }

        [Column("Stock")]
        public int Stock { get; set; }
        [Column("IdCategoria")]
        public int IdCategoria { get; set; }
        [Column("IdDescuento")]
        public int IdDescuento { get; set; }
        [Column("Imagen")]
        public string Imagen { get; set; }
    }
}
