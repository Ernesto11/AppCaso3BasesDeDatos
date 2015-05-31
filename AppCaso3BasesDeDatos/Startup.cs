using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AppCaso3BasesDeDatos.Startup))]
namespace AppCaso3BasesDeDatos
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
