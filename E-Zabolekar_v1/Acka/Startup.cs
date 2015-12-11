using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Acka.Startup))]
namespace Acka
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
