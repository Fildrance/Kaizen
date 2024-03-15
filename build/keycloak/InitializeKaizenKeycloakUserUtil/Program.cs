using Flurl;
using Flurl.Http;
using Flurl.Http.Configuration;
using Keycloak.Net;
using Keycloak.Net.Common.Extensions;
using Keycloak.Net.Models.AuthorizationPermissions;
using Keycloak.Net.Models.AuthorizationResources;
using Keycloak.Net.Models.AuthorizationScopes;
using Keycloak.Net.Models.Clients;
using Keycloak.Net.Models.Groups;
using Keycloak.Net.Models.Users;
using Newtonsoft.Json.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace InitializeKaizenKeycloakUserUtil
{
    internal class Program
    {
        private static ISerializer _serializer = new NewtonsoftJsonSerializer(new JsonSerializerSettings
        {

            ContractResolver = new CamelCasePropertyNamesContractResolver(),
            NullValueHandling = Newtonsoft.Json.NullValueHandling.Ignore
        });

        private static KeycloakOptions _keycloakOptions = new KeycloakOptions(adminClientId: "admin-cli", authenticationRealm: "master");

        const string authUrl = "http://localhost:8080";

        static async Task Main(string[] args)
        {
            var client = new KeycloakClient(
                authUrl,
                clientSecret: "Zjs3NrryyXd2I3dGBzkiEAXHCgjUFB6J",
                _keycloakOptions
            );
            var realmName = "test";
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
            var clientWebAppClient = await client.CreateClientAsync(realmName, webAppClient);
        }

        private static async Task CreateUserAndGroup(KeycloakClient client, string realmName)
        {
            var group = new Group
            {
                Name = "kaizen-users-group"
            };
            await client.CreateGroupAsync(realmName, group);

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
            var userid = await client.CreateUserAsync(realmName, user);
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

            var resId = await CreateResourceAsync(realmName, clientWebApiClient, new AuthorizationResource
            {
                Name = "skill-tree",
                OwnerManagedAccess = false,
                Uris = new[] { "kaizen/skill" },
                Scopes = new[] { new AuthorizationScope { Name = "list" } },
            });
            await CreateAuthorizationScopeAsync(realmName, clientWebApiClient, new AuthorizationScope
            {
                Name = "read",
                DisplayName = "read/find single item"
            });
            await CreateAuthorizationScopeAsync(realmName, clientWebApiClient, new AuthorizationScope
            {
                Name = "write",
                DisplayName = "create/update item"
            });
            var listScopeId = await CreateAuthorizationScopeAsync(realmName, clientWebApiClient, new AuthorizationScope
            {
                Name = "list",
                DisplayName = "list items",

            });

            var groupPolicy = new
            {
                Type = PolicyType.Group,
                Logic = PolicyDecisionLogic.Positive,
                Name = "all-kaizen-users-policy",
                DecisionStrategy = DecisionStrategy.Unanimous,
                Groups = new[] { new { Path = "/kaizen-users-group", ExtendChildren = true } }
            };

            var policy = await GetBaseUrl(realmName)
                  .AppendPathSegment($"/admin/realms/{realmName}/clients/{clientWebApiClient}/authz/resource-server/policy")
                  .AppendPathSegment("/group")
                  .PostJsonAsync(groupPolicy)
                  .ReceiveJson<Policy>()
                  .ConfigureAwait(false);

            await client.CreateAuthorizationPermissionAsync(realmName, clientWebApiClient, new AuthorizationPermission
            {
                Name = "list-skill-tree",
                ResourceIds = new string[] { resId },
                PolicyIds = new[] { policy.Id },
                ScopeIds = new []{ listScopeId }
            });
        }

        public static async Task<string> CreateAuthorizationScopeAsync(string realm, string resourceServerId, AuthorizationScope scope, CancellationToken cancellationToken = default)
        {
            var response = await GetBaseUrl(realm)
                                 .AppendPathSegment($"/admin/realms/{realm}/clients/{resourceServerId}/authz/resource-server/scope")
                                 .PostJsonAsync(scope, cancellationToken)
                                 .ConfigureAwait(false);
            var responseText = await response.ResponseMessage.Content.ReadAsStringAsync();
            var deserialized = JsonConvert.DeserializeObject(responseText) as JObject;
            return deserialized["id"].ToString();
        }
        public static async Task<string> CreateResourceAsync(string realm, string resourceServerId, AuthorizationResource resource, CancellationToken cancellationToken = default)
        {
            var response = await GetBaseUrl(realm)
                                 .AppendPathSegment($"/admin/realms/{realm}/clients/{resourceServerId}/authz/resource-server/resource")
                                 .PostJsonAsync(resource, cancellationToken)
                                 .ConfigureAwait(false);
            var responseText = await response.ResponseMessage.Content.ReadAsStringAsync();
            var deserialized = JsonConvert.DeserializeObject(responseText) as JObject;
            return deserialized["_id"].ToString();
        }

        private static IFlurlRequest GetBaseUrl(string authenticationRealm) => new Url(authUrl)
                                                                               .ConfigureRequest(settings => settings.JsonSerializer = _serializer)
                                                                               .WithAuthentication(
                                                                                   null,
                                                                                   authUrl,
                                                                                   "master",
                                                                                   null,
                                                                                   null,
                                                                                   "Zjs3NrryyXd2I3dGBzkiEAXHCgjUFB6J",
                                                                                   _keycloakOptions
                                                                               );
    }
}