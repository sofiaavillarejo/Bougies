using System.ComponentModel.DataAnnotations.Schema;

namespace Bougies.Models
{
    [Table("Roles")]
    public class Roles
    {
        [Column("Id")]
        public int Id { get; set; }
        [Column("Nombre")]
        public string Nombre { get; set; }
    }
}
