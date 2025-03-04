using Bougies.Models;
using Bougies.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Bougies.Controllers
{
    public class UsuariosController : Controller
    {
        private RepositoryUsuarios repo;

        public UsuariosController (RepositoryUsuarios repo)
        {
            this.repo = repo;
        }

        public IActionResult Registro()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Registro(string nombre, string email, string passwd)
        {
            await this.repo.RegistrarUser(nombre, email, passwd);
            return RedirectToAction("Login");
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
