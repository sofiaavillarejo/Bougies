using Bougies.Data;
using Bougies.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Bougies.Repositories
{
    public class RepositoryUsuarios
    {
        private BougiesContext context;

        public RepositoryUsuarios(BougiesContext context)
        {
            this.context = context;
        }
        private async Task<int> GetMaxIdUser()
        {
            if (this.context.Usuarios.Count() == 0)
            {
                return 1;
            }
            else
            {
                return await this.context.Usuarios.MaxAsync(x => x.IdUsuario) + 1;
            }
        }
        public async Task RegistrarUser(string nombre, string email, string passwd)
        {
            if (await this.context.Usuarios.AnyAsync(u => u.Email == email))
            {
                //el email ya existe
                throw new InvalidOperationException("El emial ya existe");
            }
            else if (!ValidarPwd(passwd))
            {
                throw new InvalidOperationException("La contraseña no cumple con los requisitos de seguridad.");
            }
            else
            {
                Usuario user = new Usuario();
                user.IdUsuario = await this.GetMaxIdUser();
                user.Nombre = nombre;
                user.Email = email;
                user.Passwd = HashPwd(passwd);
                user.IdRol = 2;
                user.CreatedAt = DateTime.Now;

                await this.context.Usuarios.AddAsync(user);
                await this.context.SaveChangesAsync();
            }

        }

        //hashear contraseña
        private string HashPwd(string passwd)
        {
            return BCrypt.Net.BCrypt.HashPassword(passwd);
        }

        //validar contraseña
        private bool ValidarPwd(string passwd)
        {
            if (string.IsNullOrEmpty(passwd))
            {
                return false; // Contraseña vacía no válida
            }

            // Longitud mínima de 8 caracteres
            if (passwd.Length < 8)
            {
                return false;
            }

            // Debe tener al menos una letra mayúscula
            if (!passwd.Any(char.IsUpper))
            {
                return false;
            }

            // Debe tener al menos un carácter especial
            if (!passwd.Any(ch => "!@#$%^&*()_+-=<>?/".Contains(ch)))
            {
                return false;
            }

            return true;
        }

        //LOGIN------------------
        public async Task<Usuario> LoginUser(string email, string passwd)
        {
            var user = await this.context.Usuarios.FirstOrDefaultAsync(u => u.Email == email);
            if (user == null)
            {
                return null;
            }

            bool isPasswordCorrect = BCrypt.Net.BCrypt.Verify(passwd, user.Passwd);

            if (isPasswordCorrect)
            {
                return user;
            }

            return null;
        }
    }
}
