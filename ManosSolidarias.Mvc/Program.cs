using ManosSolidarias.Mvc.Data;
using ManosSolidarias.Mvc.Repositories;
using ManosSolidarias.Mvc.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<ManosSolidariasContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("ManosSolidariasConnection")));

builder.Services.AddScoped<IRoleRepository, RoleRepository>();
builder.Services.AddScoped<IOrganizacionRepository, OrganizacionRepository>();
builder.Services.AddScoped<IRoleService, RoleService>();
builder.Services.AddScoped<IOrganizacionService, OrganizacionService>();

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
