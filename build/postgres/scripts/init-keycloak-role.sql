CREATE DATABASE keycloak;
\connect keycloak;
CREATE SCHEMA default_keycloak;

CREATE ROLE keycloak_admin1 WITH LOGIN ENCRYPTED PASSWORD 'ewr2qXGsHDJhVgLx';

GRANT CREATE ON SCHEMA default_keycloak TO keycloak_admin1;
GRANT USAGE ON SCHEMA default_keycloak TO group keycloak_admin1;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA default_keycloak TO keycloak_admin1;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA default_keycloak TO keycloak_admin1;