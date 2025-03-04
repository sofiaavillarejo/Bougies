using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bougies.Models
{
    [Table("CodigosCupon")]
    public class CuponDescuento
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }

        [Column("Codigo")]
        public string Codigo { get; set ;}

        [Column("Descuento")]
        public int Descuento { get; set; }

        [Column("Activo")]
        public bool Activo { get; set; }

        [Column("Usado")]
        public bool Usado { get; set; }

    }
}
