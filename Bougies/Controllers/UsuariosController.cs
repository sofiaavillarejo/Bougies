using System.Security.Claims;
using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using static System.Net.Mime.MediaTypeNames;

namespace Bougies.Controllers
{
    public class UsuariosController : Controller
    {
        private RepositoryUsuarios repo;

        public UsuariosController(RepositoryUsuarios repo)
        {
            this.repo = repo;
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

            // Asignar imagen por defecto si el usuario no sube una
            user.Imagen = fileName ?? "userprofile.jpg";

            bool registrado = await this.repo.RegistrarUser(user.Nombre, user.Apellidos, user.Email, user.Imagen, user.Passwd);

            if (!registrado)
            {
                return Json(new { success = false, message = "El email ya está registrado." });
            }

            // Si todo va bien, se devuelve éxito
            return Json(new { success = true, message = "¡Ya puedes iniciar sesión! 🚀" });
        }

        public IActionResult Login()
        {
            return View();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> Login(string email, string passwd)
        {
            Usuario user = await this.repo.LoginUser(email, passwd);
            if (user == null || !BCrypt.Net.BCrypt.Verify(passwd, user.Passwd))
            {
                ViewData["Error"] = "Email o contraseña incorrectos";
                return View();
            }else
            {
                var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, user.Nombre),
                        new Claim(ClaimTypes.Email, user.Email),
                        new Claim(ClaimTypes.Role, user.IdRol == 1 ? "Admin" : "Cliente"),
                        new Claim("IdUser", user.IdUsuario.ToString()),
                        new Claim("UserImage", user.Imagen)
                    };

                ClaimsIdentity identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                ClaimsPrincipal userPrincipal = new ClaimsPrincipal(identity);

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, userPrincipal, new AuthenticationProperties
                {
                    ExpiresUtc = DateTime.Now.AddHours(1)
                });

                string controller = TempData["controller"]?.ToString() ?? "Tienda";
                string action = TempData["action"]?.ToString() ?? "Index";

                if (TempData["id"] != null)
                {
                    string id = TempData["id"].ToString();
                    return RedirectToAction(action, controller, new { id = id });
                }
                else
                {
                    return RedirectToAction(action, controller);
                }
            }




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
        }

        public async Task<IActionResult> Logout()
        {
            //HttpContext.Session.Clear();
            //return RedirectToAction("Login");

            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Tienda");
        }

        public async Task<IActionResult> PerfilUsuario(int idUsuario)
        {
            Usuario user = await this.repo.PerfilUsuarioAsync(idUsuario);
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

        public async Task<IActionResult> PedidosUsuario(int idUsuario)
        {
            var pedidos = await this.repo.GetPedidoUserAsync(idUsuario);

            if (pedidos == null || pedidos.Count == 0)
            {
                return NotFound("No se encontraron pedidos para este usuario.");
            }

            return View(pedidos);
        }
    }
}
