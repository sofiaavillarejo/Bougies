using Bougies.Data;
using Bougies.Repositories;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddAntiforgery();

builder.Services.AddDistributedMemoryCache();
builder.Services.AddHttpContextAccessor();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Define el tiempo que permanecerá la sesión activa
    options.Cookie.HttpOnly = true; // Solo accesible por HTTP
    options.Cookie.IsEssential = true; // Necesario para el funcionamiento de la app
});

string connectionString = builder.Configuration.GetConnectionString("Bougies");
builder.Services.AddDbContext<BougiesContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddTransient<IRepositoryAdmin, RepositoryAdmin>();
builder.Services.AddTransient<RepositoryUsuarios>();
builder.Services.AddTransient<RepositoryCarrito>();

// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();


// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseRouting();

app.UseSession();
//para las imagenes estaticas
app.UseStaticFiles();

app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Tienda}/{action=Index}/{id?}")
    .WithStaticAssets();


app.Run();
