using Bougies.Models;
using Bougies.Repositories;
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
            user.Imagen = fileName ?? "users/default-profile.png";

            bool registrado = await this.repo.RegistrarUser(user.Nombre, user.Apellidos, user.Email, user.Imagen, user.Passwd);

            if (!registrado)
            {
                return Json(new { success = false, message = "El email ya está registrado." });
            }

            // Si todo va bien, se devuelve éxito
            return Json(new { success = true, message = "¡Ya puedes iniciar sesión! 🚀" });
        }


        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string email, string passwd)
        {
            Usuario user = await this.repo.LoginUser(email, passwd);
            if (user == null || !BCrypt.Net.BCrypt.Verify(passwd, user.Passwd))
            {
                ViewData["Error"] = "Email o contraseña incorrectos";
                return View();
            }

            HttpContext.Session.SetString("userEmail", user.Email);
            HttpContext.Session.SetString("userName", user.Nombre);
            HttpContext.Session.SetInt32("idUser", user.IdUsuario);
            HttpContext.Session.SetInt32("idRol", user.IdRol);

            return RedirectToAction("Productos", "Tienda");
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }
    }
}
