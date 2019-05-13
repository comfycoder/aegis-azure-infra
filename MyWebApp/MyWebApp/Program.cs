using System;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Azure.KeyVault;
using Microsoft.Azure.Services.AppAuthentication;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.AzureKeyVault;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace MyWebApp
{
    public class Program
    {
        private static IConfiguration _config;

        public static void Main(string[] args)
        {
            // Create an instance of the web host
            var host = CreateWebHostBuilder(args).Build();

            // Get an instance of the ASP.NET Core logger service
            var logger = host.Services.GetRequiredService<ILogger<Program>>();

            // This will be picked up by Application Insights
            logger.LogInformation("From Main in Program.cs. Running the host now..");

            // Run the web host
            host.Run();
        }

        // https://docs.microsoft.com/en-us/azure/azure-monitor/app/ilogger
        // Add Microsoft.Extensions.Logging.ApplicationInsights NuGet package
        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseApplicationInsights()
                .ConfigureAppConfiguration((context, config) =>
                {
                    // Get the current hosting environment
                    var env = context.HostingEnvironment;

                    // Build an instance of the config reader
                    _config = config.Build();

                    var keyVaultName = _config["KeyVaultName"];

                    if (!string.IsNullOrWhiteSpace(keyVaultName))
                    {
                        // Add Microsoft.Extensions.Configuration.AzureKeyVault (latest)
                        // Add Microsoft.Azure.Services.AppAuthentication (>= 1.0.3)

                        var azureServiceTokenProvider = new AzureServiceTokenProvider();

                        var keyVaultClient = new KeyVaultClient(
                            new KeyVaultClient.AuthenticationCallback(
                                azureServiceTokenProvider.KeyVaultTokenCallback));

                        string keyVaultUri = $"https://{keyVaultName}.vault.azure.net/";

                        Console.WriteLine($"KeyVault URI: {keyVaultUri}");

                        config.AddAzureKeyVault(keyVaultUri, keyVaultClient, 
                            new DefaultKeyVaultSecretManager());
                    }
                })
                .UseStartup<Startup>()
                .ConfigureLogging(
                    builder =>
                    {
                        // Add Microsoft.ApplicationInsights.Web

                        // Get the App Insights instrumentation key (a guid) 
                        // from app configuration settings
                        string appInsightsInstrumentationKey = _config["APPINSIGHTS_INSTRUMENTATIONKEY"];

                        // Providing an instrumentation key here is required if you are using
                        // standalone package Microsoft.Extensions.Logging.ApplicationInsights
                        // or if you want to capture logs from early in the application startup
                        // pipeline from Startup.cs or Program.cs itself.
                        builder.AddApplicationInsights(appInsightsInstrumentationKey);

                        // Optional: Apply filters to control what logs are sent to Application Insights.
                        // The following configures LogLevel Information or above to be sent to
                        // Application Insights for all categories.
                        builder.AddFilter<Microsoft.Extensions.Logging.ApplicationInsights
                            .ApplicationInsightsLoggerProvider>("", LogLevel.Information);

                        // Adding the filter below to ensure logs of all severity from Program.cs
                        // is sent to ApplicationInsights.
                        builder.AddFilter<Microsoft.Extensions.Logging.ApplicationInsights
                            .ApplicationInsightsLoggerProvider>("MyWebApp.Program", LogLevel.Trace);

                        // Adding the filter below to ensure logs of all severity from Startup.cs
                        // is sent to ApplicationInsights.
                        builder.AddFilter<Microsoft.Extensions.Logging.ApplicationInsights
                            .ApplicationInsightsLoggerProvider>("MyWebApp.Startup", LogLevel.Trace);
                    }
                );

    }
}
