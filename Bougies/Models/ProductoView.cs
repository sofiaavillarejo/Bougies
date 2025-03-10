namespace Bougies.Models
{  
    public class ProductoView
    {
        public int IdProducto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Imagen { get; set; }
        public decimal Precio { get; set; }
        public decimal PrecioDescuento { get; set; }
    }

}
