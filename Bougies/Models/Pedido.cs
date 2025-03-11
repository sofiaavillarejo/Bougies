using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bougies.Models
{
    [Table("Pedidos")]
    public class Pedido
    {
        [Key]
        [Column("Id")]
        public int IdPedido { get; set; }

        [Column("IdUsuario")]
        public int IdUsuario { get; set; }

        [Column("FechaPedido")]
        public DateTime FechaPedido { get; set; }

        [Column("Total")]
        public decimal Total { get; set; }

        [Column("Estado")]
        public string Estado { get; set; } = "Pendiente";

        [Column("IdMetodoPago")]
        public int IdMetodoPago { get; set; }

        [Column("Direccion")]
        public string Direccion { get; set; }

        [Column("Ciudad")]
        public string Ciudad { get; set; }

        [Column("CodigoPostal")]
        public string CodigoPostal { get; set; }

        [Column("Poblacion")]
        public string Poblacion { get; set; }

    }
}
