using System.Net.Http.Headers;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NuGet.Common;
using NugetBougies.DTO;
using NugetBougies.Models;

namespace Bougies.Services
{
    public class ServiceBougies
    {
        private MediaTypeWithQualityHeaderValue header;
        private string urlApi;
        private IHttpContextAccessor context;

        public ServiceBougies(IConfiguration configuration, IHttpContextAccessor context)
        {
            this.header = new MediaTypeWithQualityHeaderValue("application/json");
            this.urlApi = configuration.GetValue<string>("ApiUrls:ApiBougies");
            this.context = context;
        }

        public async Task<string> GetTokenAsync(string email, string password)
        {
            using (HttpClient client = new HttpClient())
            {
                string request = "api/Auth/Login";
                client.BaseAddress = new Uri(this.urlApi);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.header);
                LoginModel model = new LoginModel
                {
                    Email = email,
                    Passwd = password
                };
                string json = JsonConvert.SerializeObject(model);
                StringContent content = new StringContent(json, Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(request, content);
                if (response.IsSuccessStatusCode)
                {
                    string data = await response.Content.ReadAsStringAsync();
                    JObject keys = JObject.Parse(data);
                    string token = keys.GetValue("response").ToString();
                    return token;
                }else
                {
                    return null;
                }
            }
        }
        public async Task<bool> ActualizarPerfilAsync(string? nuevaPasswd, IFormFile? nuevaImagen)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.urlApi);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.header);

                using (MultipartFormDataContent formData = new MultipartFormDataContent())
                {
                    if (!string.IsNullOrEmpty(nuevaPasswd))
                    {
                        formData.Add(new StringContent(nuevaPasswd), "nuevaPasswd");
                    }

                    if (nuevaImagen != null)
                    {
                        using (var stream = nuevaImagen.OpenReadStream())
                        {
                            StreamContent imageContent = new StreamContent(stream);
                            imageContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue(nuevaImagen.ContentType);
                            formData.Add(imageContent, "nuevaImagen", nuevaImagen.FileName);
                        }
                    }

                    string request = "api/Usuarios/UpdateUser"; // ya no pasas el ID

                    HttpResponseMessage response = await client.PostAsync(request, formData);

                    return response.IsSuccessStatusCode;
                }
            }
        }

        public Task CreateProducto(string nombre, string descripcion, decimal precio, int stock, int idCategoria, int idDescuento, string imagen)
        {
            throw new NotImplementedException();
        }

        public async Task CuponUsado(string cupon)
        {
            string request = "api/Carrito/CuponUsado/" + cupon;
            await this.CallApiPostAsync(request);
        }

        public async Task<CuponDescuento> FindCuponDescuentoAsync(string cupon)
        {
            string request = "api/Carrito/GetCuponDescuento/" + cupon;
            CuponDescuento cuponDesc = await this.CallApiAsync<CuponDescuento>(request);
            return cuponDesc;
        }

        public async Task<Producto> FindProducto(int id)
        {
            string request = "api/DetalleProducto/" + id;
            Producto prod = await this.CallApiAsync<Producto>(request);
            return prod;
        }

        public async Task<List<Descuento>> GetDescuentosAsync()
        {
            string request = "api/Descuentos";
            List<Descuento> descuentos = await this.CallApiAsync <List<Descuento>>(request);
            return descuentos;
        }

        public async Task<List<Pedido>> GetPedidoUserAsync()
        {
            string token = this.context.HttpContext.User.FindFirst(u => u.Type == "TOKEN").Value;
            string request = "api/Usuarios/PedidosUser";
            List<Pedido> pedidosUser = await this.CallApiAsync<List<Pedido>>(request, token);
            return pedidosUser;
        }

        public async Task<List<Producto>> GetProductosAsync()
        {
            string request = "api/Productos";
            List<Producto> productos = await this.CallApiAsync<List<Producto>>(request);
            return productos;
        }

        public async Task<List<Producto>> GetProductosRebajadosAsync()
        {
            string request = "api/ProductosRebajados";
            List<Producto> prodRebajados = await this.CallApiAsync<List<Producto>>(request);
            return prodRebajados;
        }

        public Task<List<Roles>> GetRolesAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<int> GetValorDescuentoAsync(int idDescuento)
        {
            string request = "api/ValorDescuento/" + idDescuento;
            int desc = await this.CallApiAsync<int>(request);
            return desc;
        }

        public async Task<UserModel> PerfilUsuarioAsync()
        {
            var tokenClaim = this.context.HttpContext.User.FindFirst(u => u.Type == "TOKEN");
            if (tokenClaim == null)
            {
                throw new InvalidOperationException("Token no encontrado en los claims.");
            }

            string token = tokenClaim.Value;
            string request = "api/Usuarios/PerfilBlob";
            UserModel model = await this.CallApiAsync<UserModel>(request, token);

            if (model == null)
            {
                throw new InvalidOperationException("No se pudo obtener la información del usuario.");
            }

            return model;
        }


        public async Task<bool> RegistrarUser(string nombre, string apellidos, string email, string passwd, string? imagen)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.urlApi);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.header);

                var registerData = new
                {
                    Nombre = nombre,
                    Apellidos = apellidos,
                    Email = email,
                    Passwd = passwd,
                    Imagen = imagen
                };

                // Serializamos a JSON
                string jsonData = JsonConvert.SerializeObject(registerData);
                StringContent content = new StringContent(jsonData, System.Text.Encoding.UTF8, "application/json");

                // Llamada POST al endpoint "api/Auth/Registro"
                string request = "api/Usuarios/Registro";

                HttpResponseMessage response = await client.PostAsync(request, content);

                if (response.IsSuccessStatusCode)
                {
                    return true; // Registro exitoso
                }
                else if (response.StatusCode == System.Net.HttpStatusCode.Conflict)
                {
                    return false; // Email ya registrado
                }
                else
                {
                    // Otro tipo de error
                    throw new Exception("Error en el registro: " + response.ReasonPhrase);
                }
            }
        }

        public Task UpdateProducto(int id, string nombre, string descripcion, decimal precio, int stock, int idCategoria, int idDescuento, string imagen)
        {
            throw new NotImplementedException();
        }

        private async Task<T> CallApiAsync<T>(string request)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.urlApi);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.header);
                HttpResponseMessage response = await client.GetAsync(request);
                if (response.IsSuccessStatusCode)
                {
                    T data = await response.Content.ReadAsAsync<T>();
                    return data;
                }
                else
                {
                    return default(T);
                }
            }
        }

        private async Task<T> CallApiAsync<T>(string request, string token)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.urlApi);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.header);
                client.DefaultRequestHeaders.Add("Authorization", "bearer " + token);
                HttpResponseMessage response = await client.GetAsync(request);
                if (response.IsSuccessStatusCode)
                {
                    T data = await response.Content.ReadAsAsync<T>();
                    return data;
                }
                else
                {
                    return default(T);
                }
            }
        }

        private async Task CallApiPostAsync(string request)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.urlApi);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.header);

                HttpResponseMessage response = await client.PostAsync(request, null);

                response.EnsureSuccessStatusCode(); // lanza excepción si falla
            }
        }






    }
}
