using System.Diagnostics;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using MyWebApp.Models;

namespace MyWebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly IConfiguration _config;
        private readonly IHostingEnvironment _hostingEnv;
        private readonly ILogger<HomeController> _logger;

        public HomeController(
            IConfiguration config,
            IHostingEnvironment hostingEnv,
            ILogger<HomeController> logger)
        {
            _config = config;
            _hostingEnv = hostingEnv;
            _logger = logger;
        }

        public IActionResult Index()
        {
            var viewModel = new HomeViewModel();

            viewModel.EnvironmentName = _hostingEnv.EnvironmentName;
            viewModel.HostName = System.Net.Dns.GetHostName();
            viewModel.MySetting = _config["MySetting"];
            viewModel.KeyVaultName = _config["KeyVaultName"];
            viewModel.Secret1 = _config["Secret1"];
            viewModel.Secret2 = _config["Secret2"];

            _logger.LogTrace("Write a 'trace' message");
            _logger.LogDebug("Write a 'debug' message");
            _logger.LogInformation("Write an 'info' message");
            _logger.LogWarning("Write a 'warning' message");
            _logger.LogError("Write an 'error' message");
            _logger.LogCritical("Write a 'critical' message");

            return View(viewModel);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
