using Azure.Security.KeyVault.Secrets;
using Bougies.Data;
using Bougies.Repositories;
using Bougies.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Azure;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddAzureClients(factory =>
{
    factory.AddSecretClient(builder.Configuration.GetSection("KeyVault"));

});
SecretClient secretClient = builder.Services.BuildServiceProvider().GetService<SecretClient>();
KeyVaultSecret secret = await secretClient.GetSecretAsync("SqlAzure");
string connectionString = secret.Value;
builder.Services.AddAntiforgery();
builder.Services.AddHttpClient();
builder.Services.AddMemoryCache();
builder.Services.AddHttpContextAccessor();
builder.Services.AddSession();
builder.Services.AddAuthentication(options =>
{
    options.DefaultSignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultAuthenticateScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = CookieAuthenticationDefaults.AuthenticationScheme;
}).AddCookie();


builder.Services.AddDbContext<BougiesContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddTransient<IRepositoryBougies, RepositoryBougies>();
builder.Services.AddTransient<RepositoryBougies>();
builder.Services.AddTransient<ServiceBougies>();

builder.Services.AddControllersWithViews(options => options.EnableEndpointRouting = false);

var app = builder.Build();


// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
//app.UseRouting();

app.UseSession();
app.UseStaticFiles();
app.UseAuthentication();
app.UseAuthorization();

//app.MapStaticAssets();

app.UseMvc(routes =>
{
    routes.MapRoute(
        name: "default",
        template: "{controller=Tienda}/{action=Index}/{id?}");
});


app.Run();
