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
        public async Task<bool> RegistrarUser(string nombre, string apellidos, string email, string? fotoPerfil, string passwd)
        {
            if (await this.context.Usuarios.AnyAsync(u => u.Email == email))
            {
                return false; // Retorna false si el email ya existe
            }

            if (!ValidarPwd(passwd))
            {
                throw new InvalidOperationException("La contraseña no cumple con los requisitos de seguridad.");
            }

            Usuario user = new Usuario
            {
                IdUsuario = await this.GetMaxIdUser(),
                Nombre = nombre,
                Apellidos = apellidos,
                Email = email,
                Imagen = fotoPerfil,
                Passwd = HashPwd(passwd),
                IdRol = 2,
                CreatedAt = DateTime.Now
            };

            await this.context.Usuarios.AddAsync(user);
            await this.context.SaveChangesAsync();

            return true; // Retorna true si el usuario fue registrado con éxito
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

        //--------USER PERFIL---------------//
        public async Task<Usuario> PerfilUsuarioAsync(int idUsuario)
        {
            var user = await this.context.Usuarios.FirstOrDefaultAsync(u => u.IdUsuario == idUsuario);
            return user;
        }

        public async Task<bool> ActualizarPerfilAsync(Usuario usuario, string nuevaPasswd, IFormFile nuevaImagen)
        {
            var user = await this.context.Usuarios.FindAsync(usuario.IdUsuario);
            if (user == null)
                return false;

            // Actualizar datos
            user.Nombre = usuario.Nombre;
            user.Apellidos = usuario.Apellidos;
            user.Email = usuario.Email;

            // Si el usuario ingresó una nueva contraseña, se actualiza
            if (!string.IsNullOrEmpty(nuevaPasswd))
            {
                user.Passwd = BCrypt.Net.BCrypt.HashPassword(nuevaPasswd);
            }

            // Si hay nueva imagen, se actualiza
            if (nuevaImagen != null)
            {
                string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(nuevaImagen.FileName);
                string filePath = Path.Combine("wwwroot/images/users", uniqueFileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await nuevaImagen.CopyToAsync(stream);
                }

                user.Imagen = uniqueFileName;
            }

            this.context.Usuarios.Update(user);
            await this.context.SaveChangesAsync();
            return true;
        }

        public async Task<List<Pedido>> GetPedidoUserAsync(int idUsuario)
        {
            List<Pedido> pedidos = await this.context.Pedidos.Where(p => p.IdUsuario == idUsuario).ToListAsync();
            return pedidos;
        }
    }
}
