using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bougies.Models
{
    
    public class Carrito
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("Producto")]
        public int IdProducto { get; set; }
        [ForeignKey("Descuentos")]
        public int IdDescuento { get; set; }
        [ForeignKey("Descuentos")]
        public int Descuento { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }
        public string Imagen { get; set; }
        public int CodigoDescuento { get; set; }
    }
}
