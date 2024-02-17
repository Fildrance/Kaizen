using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using Enterprise.ApplicationBootstrap.Core.Api.Modules;
using Enterprise.ApplicationBootstrap.WebApi.Modules;
using Enterprise.ApplicationBootstrap.WebApi.OpenAPi;
using Keycloak.AuthServices.Authentication;
using Keycloak.AuthServices.Authorization;
using Keycloak.AuthServices.Common;
using Keycloak.AuthServices.Sdk.Admin;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Kaizen.Skills.Service;

public class KeycloakModule : ISwaggerGenAwareModule, IAfterRoutingAwareModule, IServiceCollectionAwareModule
{
    /// <inheritdoc />
    public string ModuleIdentity => "KeycloakModule";

    /// <inheritdoc />
    public void Configure(IServiceCollection services, IConfiguration configuration)
    {
        services.AddAuthorization()
                .AddKeycloakAuthorization(new KeycloakProtectionClientOptions
                {
                    VerifyTokenAudience = false,
                    AuthServerUrl = "http://localhost:8080",
                    Realm = "kaizen-realm",
                    Resource = "kaizen-skills",
                    Credentials = new KeycloakClientInstallationCredentials
                    {
                        Secret = "29anrg2MXcONXtWbVMpLpX3jlobhDjdk"
                    },
                }).AddKeycloakAuthentication(new KeycloakAuthenticationOptions
                {
                    VerifyTokenAudience = false,
                    AuthServerUrl = "http://localhost:8080",
                    Realm = "kaizen-realm",
                    Resource = "kaizen-skills",
                    Credentials = new KeycloakClientInstallationCredentials
                    {
                        Secret = "29anrg2MXcONXtWbVMpLpX3jlobhDjdk"
                    },
                }, options => options.RequireHttpsMetadata = false);

        services.AddKeycloakAdminHttpClient(new KeycloakAdminClientOptions
        {
            VerifyTokenAudience = false,
            AuthServerUrl = "http://localhost:8080",
            Realm = "kaizen-realm",
            Resource = "kaizen-skills",
            Credentials = new KeycloakClientInstallationCredentials
            {
                Secret = "29anrg2MXcONXtWbVMpLpX3jlobhDjdk"
            },
        });
    }

    /// <inheritdoc />
    public void Configure(IApplicationBuilder app)
    {
        app.UseAuthentication();
        app.UseAuthorization();
    }

    /// <inheritdoc />
    public void Configure(SwaggerGenOptions c, IConfiguration configuration)
    {
        c.AddSecurityDefinition(
            "Bearer",
            new OpenApiSecurityScheme
            {
                Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                Name = "Authorization",
                In = ParameterLocation.Header,
                Type = SecuritySchemeType.ApiKey,
                Scheme = "Bearer"
            }
        );

        c.AddSecurityRequirement(
            new OpenApiSecurityRequirement
            {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Type = ReferenceType.SecurityScheme,
                            Id = "Bearer"
                        },
                        Scheme = "oauth2",
                        Name = "Bearer",
                        In = ParameterLocation.Header
                    },
                    new List<string>()
                }
            }
        );
        var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
        var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
        c.IncludeXmlComments(xmlPath);
    }
}