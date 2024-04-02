using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Flurl.Http;
using Keycloak.Net;
using Keycloak.Net.Models.AuthorizationPermissions;
using Keycloak.Net.Models.AuthorizationResources;
using Keycloak.Net.Models.AuthorizationScopes;
using Keycloak.Net.Models.Clients;
using Keycloak.Net.Models.Groups;
using Keycloak.Net.Models.Users;

namespace InitializeKaizenKeycloakUserUtil
{
    internal class Program
    {
        private static readonly KeycloakOptions KeycloakOptions = new KeycloakOptions(adminClientId: "admin-cli", authenticationRealm: "master");

        private const string AuthUrl = "http://localhost:8080";

        private static async Task Main()
        {
            var client = new KeycloakClient(
                AuthUrl,
                clientSecret: "<code>",
                KeycloakOptions
            );
            var realmName = "kaizen";
            var realm = await client.GetRealmsAsync(realmName);
            if (realm == null)
            {
                throw new InvalidOperationException("Realm 'kaizen' should be created in keycloak before executing script");
            }

            await CreateUserAndGroup(client, realmName);

            await CreateWebAppClient(client, realmName);

            await CreateWebApiClient(client, realmName);
        }

        private static async Task CreateWebAppClient(KeycloakClient client, string realmName)
        {
            var webAppClient = new Client
            {
                ClientId = "kaizen-client",
                Name = "kaizen-client",
                RootUrl = "http://localhost:4200",
                WebOrigins = new[] { "http://localhost:4200", },
                RedirectUris = new[] { "http://localhost:4200/*", },
                BaseUrl = "http://localhost:4200",
                StandardFlowEnabled = true,
                DirectAccessGrantsEnabled = true,
                FrontChannelLogout = true,
                ClientAuthenticatorType = "client-secret",
                AuthorizationServicesEnabled = false,
                PublicClient = true,
                Attributes = new Dictionary<string, object>
                {
                    ["post.logout.redirect.uris"] = "http://localhost:4200"
                },
                Enabled = true
            };
            _ = await Wrap(() => client.CreateClientAsync(realmName, webAppClient));
        }

        private static async Task CreateUserAndGroup(KeycloakClient client, string realmName)
        {
            var group = new Group
            {
                Name = "kaizen-users-group"
            };
            await Wrap(() => client.CreateGroupAsync(realmName, group));

            var user = new User
            {
                Credentials = new[]
                {
                    new Credentials
                    {
                        Value = "admin-password",
                        Type = "password",
                        Temporary = true
                    }
                },
                Groups = new[] { group.Name },
                UserName = "kaizen-admin",
                Enabled = true
            };
            _ = await Wrap(() => client.CreateUserAsync(realmName, user));
        }

        private static async Task CreateWebApiClient(KeycloakClient client, string realmName)
        {
            var clientId = "kaizen-skills";

            Client client2 = new Client
            {
                ClientId = clientId,
                Name = "kaizen-skills",
                RootUrl = "http://localhost:5000",
                WebOrigins = new[] { "http://localhost:5000", },
                RedirectUris = new[] { "http://localhost:5000/*", },
                ClientAuthenticatorType = "client-secret",
                BaseUrl = "http://localhost:5000",
                PublicClient = false,
                ServiceAccountsEnabled = true,
                AuthorizationServicesEnabled = true,
                DirectAccessGrantsEnabled = true,
                Enabled = true,
            };
            var clientWebApiClient = await client.CreateClientAndRetrieveClientIdAsync(realmName, client2);

            var resId = await client.CreateResourceAsync(realmName, clientWebApiClient, new AuthorizationResource
            {
                Name = "skill-tree",
                OwnerManagedAccess = false,
                Uris = new[] { "kaizen/skill" },
                Scopes = new[] { new AuthorizationScope { Name = "list" } },
            });
            await client.CreateAuthorizationScopeAsync(realmName, clientWebApiClient, new AuthorizationScope
            {
                Name = "read",
                DisplayName = "read/find single item"
            });
            await client.CreateAuthorizationScopeAsync(realmName, clientWebApiClient, new AuthorizationScope
            {
                Name = "write",
                DisplayName = "create/update item"
            });
            var listScopeId = await client.CreateAuthorizationScopeAsync(realmName, clientWebApiClient, new AuthorizationScope
            {
                Name = "list",
                DisplayName = "list items",
            });

            var groupPolicy = new GroupPolicy
            {
                Type = PolicyType.Group,
                Logic = PolicyDecisionLogic.Positive,
                Name = "all-kaizen-users-policy",
                DecisionStrategy = DecisionStrategy.Unanimous,
                GroupConfigs = new[]
                {
                    new GroupConfig { Path = "/kaizen-users-group", ExtendChildren = true}
                }
            };

            var policy = await client.CreateGroupPolicyAsync(realmName, clientWebApiClient, groupPolicy);
            
            await client.CreateAuthorizationPermissionAsync(realmName, clientWebApiClient, new AuthorizationPermission
            {
                Name = "list-skill-tree",
                ResourceIds = new [] { resId },
                PolicyIds = new[] { policy.Id },
                ScopeIds = new[] { listScopeId }
            });
        }


        private static async Task<T> Wrap<T>(Func<Task<T>> func)
        {
            try
            {
                return await func();
            }
            catch (FlurlHttpException e) when (e.StatusCode == 409)
            {
                return default;
            }
        }
    }
}