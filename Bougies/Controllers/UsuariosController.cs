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
    }
}
