## About project

This application is little sandbox of mine, that helps to practice microservice approach and get used to infrastructure.
This project is work in progress, and should be observed as such.

Main idea of project is to create simple, yet usable application for managing employees skills, grades, knowledge and growth in scalable companies.

### Notable patterns
// todo:

### Other stuff
 * 'Services' (classes that end with 'Service') are just proxy for dispatching calls on MassTransit bus in simple way, hiding actual usage of bus, that otherwise may appear as service locator anti-pattern. Also allowing only service to be called in other code (not bus itself) makes it more maintanable (as there must be only one methods by which usages of consumer can be found)
 * Request clients (MQ client that awaits response on special queue after issuing request) have messages validated before passing to MQ (so invalid message - like update without id of object to be updated) won't even be sent to MQ.

## How to launch

//todo:

### How to actually launch (for development)

Prerequisites: 
* dotnet aspnet core runtime 8
* docker installed and up to date. Ensure its started.

To launch project locally:

  1 clone project
  2 go to postgres 
  3 build and start ("cd ./build/postgres" and "./build.bat" + "./start.bat")
  4 go to keycloak build ("cd ./build/keycloak")
  5 build and start all the stuff (execute "./build.bat" and "./start.bat")
  6 go to http://localhost:8080 for keycloak console (login using 'admin'/'admin' default credentials)
  7 for client 'admin-cli' turn on 'Client authentication' and 'Authorization' then click save. After that go to 'Service accounts roles' and assign role '(account) manage-account' and 'admin', then go to 'Credentials' tab and copy 'Client secret' to ./build/keycloak/InitializeKaizenKeycloakUserUtil/Program.cs, replace &lt;code&gt; with it.
  8 create realm 'kaizen'
  9 start project 'dotnet run ./build/keycloak/InitializeKaizenKeycloakUserUtil/' (this will init clients and users for testing). Ensure it returns without errors.
  10 in keycloak go to 'Clients' to 'kaizen-skills' client - get 'Client secret' from 'Credentials' section and paste it into ./src/Skills/Kaizen.Skills.Service/KeycloakModule.cs' replacing current token in 3 sections
  11 remove additional roles assigned on step '7' as a cleanup.
  12 go to services API project ./src/Skills/Kaizen.Skills.Service and launch project (``` dotnet run ```)
  13 go to web-app project ./src/Ui.Angular/ and execute ``` npm i -f ``` then start it ``` npm start ```
