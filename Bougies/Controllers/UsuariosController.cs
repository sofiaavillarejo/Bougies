using System.Security.Claims;
using NugetBougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Bougies.Filters;
using Bougies.Services;
using NugetBougies.DTO;

namespace Bougies.Controllers
{
    public class UsuariosController : Controller
    {
        private RepositoryBougies repo;
        private ServiceBougies service;

        public UsuariosController(ServiceBougies service, RepositoryBougies repo)
        {
            this.repo = repo;
            this.service = service;
        }

        public IActionResult Registro()
        {
            return View();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> Registro(Usuario user, IFormFile? imagen)
        {
            // Validar imagen
            string? fileName = null;

            if (imagen != null && imagen.Length > 0)
            {
                var extensionesPermitidas = new[] { ".jpg", ".jpeg", ".png", ".gif" };
                var extension = Path.GetExtension(imagen.FileName).ToLower();

                if (!extensionesPermitidas.Contains(extension))
                {
                    ModelState.AddModelError("Imagen", "Formato de imagen no válido. Usa JPG, JPEG, PNG o GIF.");
                    return View(user);
                }

                if (imagen.Length > 2 * 1024 * 1024) // 2MB
                {
                    ModelState.AddModelError("Imagen", "El archivo no debe superar los 2MB.");
                    return View(user);
                }

                // Generar nombre único
                fileName = Guid.NewGuid().ToString() + extension;
                var directoryPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", "users");

                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                var filePath = Path.Combine(directoryPath, fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await imagen.CopyToAsync(stream);
                }
            }

            // Asignar imagen por defecto si no sube
            user.Imagen = fileName ?? "userprofile.jpg";

            bool registrado = await this.service.RegistrarUser(user.Nombre, user.Apellidos, user.Email, user.Passwd, user.Imagen);

            if (!registrado)
            {
                return Json(new { success = false, message = "El email ya está registrado." });
            }

            return Json(new { success = true, message = "¡Ya puedes iniciar sesión! 🚀" });
        }


        public IActionResult Login()
        {
            return View();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> Login(LoginModel model)
        {
            string token = await this.service.GetTokenAsync(model.Email, model.Passwd);
            if (token == null)
            {
                ViewData["Error"] = "Email o contraseña incorrectos";
                return View();
            }
            else
            {
                Usuario user = await this.repo.GetInfoUserAsync(model.Email);
                if (user == null)
                {
                    ViewData["Error"] = "El usuario no existe.";
                    return View();
                }
                //HttpContext.Session.SetString("TOKEN", token);
                ClaimsIdentity identity = new ClaimsIdentity(CookieAuthenticationDefaults.AuthenticationScheme, ClaimTypes.Name, ClaimTypes.Role);
                identity.AddClaim(new Claim(ClaimTypes.Name, user.Nombre));
                identity.AddClaim(new Claim(ClaimTypes.Email, user.Email));
                identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, user.IdUsuario.ToString()));
                identity.AddClaim(new Claim("IdUser", user.IdUsuario.ToString()));
                identity.AddClaim(new Claim("UserImage", user.Imagen));
                identity.AddClaim(new Claim("TOKEN", token));
                ClaimsPrincipal principal = new ClaimsPrincipal(identity);
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, new AuthenticationProperties
                {
                    ExpiresUtc = DateTime.UtcNow.AddHours(1)
                });
                return RedirectToAction("Index", "Tienda");
            }
           
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Tienda");
        }

        [AuthorizeUsers]
        public async Task<IActionResult> PerfilUsuario()
        {
            UserModel user = await this.service.PerfilUsuarioAsync();
            return View(user);
        }

        //actualizar el perfil
        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> ActualizarPerfil(Usuario usuario, string? NuevaPasswd, IFormFile? Imagen)
        {
            bool actualizado = await this.repo.ActualizarPerfilAsync(usuario, NuevaPasswd, Imagen);

            if (actualizado)
            {
                // 🔹 Obtener usuario actualizado
                Usuario userActualizado = await this.repo.PerfilUsuarioAsync(usuario.IdUsuario);

                // 🔹 Actualizar los datos en la sesión
                HttpContext.Session.SetString("userName", userActualizado.Nombre);
                if (!string.IsNullOrEmpty(userActualizado.Imagen))
                {
                    HttpContext.Session.SetString("userImage", userActualizado.Imagen);
                }

                //TempData["Success"] = "Perfil actualizado correctamente.";
            }
            else
            {
                TempData["Error"] = "Error al actualizar el perfil.";
            }

            return RedirectToAction("PerfilUsuario", new { idUsuario = usuario.IdUsuario });
        }


        [AuthorizeUsers]
        public async Task<IActionResult> PedidosUsuario()
        {
            List<Pedido> pedidos = await this.service.GetPedidoUserAsync();

            if (pedidos == null || pedidos.Count == 0)
            {
                return NotFound("No se encontraron pedidos para este usuario.");
            }

            return View(pedidos);
        }
    }
}


//Usuario user = await this.service.GetTokenAsync(email, passwd);
//if (user == null || !BCrypt.Net.BCrypt.Verify(passwd, user.Passwd))
//{
//    ViewData["Error"] = "Email o contraseña incorrectos";
//    return View();
//}else
//{
//    var claims = new List<Claim>
//        {
//            new Claim(ClaimTypes.Name, user.Nombre),
//            new Claim(ClaimTypes.Email, user.Email),
//            new Claim(ClaimTypes.Role, user.IdRol == 1 ? "Admin" : "Cliente"),
//            new Claim("IdUser", user.IdUsuario.ToString()),
//            new Claim("UserImage", user.Imagen)
//        };

//    ClaimsIdentity identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
//    ClaimsPrincipal userPrincipal = new ClaimsPrincipal(identity);

//    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, userPrincipal, new AuthenticationProperties
//    {
//        ExpiresUtc = DateTime.Now.AddHours(1)
//    });

//    string controller = TempData["controller"]?.ToString() ?? "Tienda";
//    string action = TempData["action"]?.ToString() ?? "Index";

//    if (user.IdRol == 1) 
//    {
//        return RedirectToAction("CrearProducto", "Admin"); // Redirige al panel de control del admin
//    }

//    if (TempData["id"] != null)
//    {
//        string id = TempData["id"].ToString();
//        return RedirectToAction(action, controller, new { id = id });
//    }
//    else
//    {
//        return RedirectToAction(action, controller);
//    }
//}




//if (user.IdRol == 1)
//{
//    return RedirectToAction("Admin", "Index");
//}
//HttpContext.Session.SetString("userEmail", user.Email);
//HttpContext.Session.SetString("userName", user.Nombre);
//HttpContext.Session.SetString("userImage", user.Imagen);
//HttpContext.Session.SetInt32("idUser", user.IdUsuario);
//HttpContext.Session.SetInt32("idRol", user.IdRol);

//return RedirectToAction("Productos", "Tienda");