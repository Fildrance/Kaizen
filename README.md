## About project

This application is little sandbox of mine, that helps to practice microservice approach and get used to infrastructure.
This project is work in progress, and should be observed as such.

Main idea of project is to create simple, yet usable application for managing employees skills, grades, knowledge and growth in scalable companies.

### Notable patterns
 * Project uses docker-compose for managing network cooperation and service management
 * Micro-service architecture is used as overall approach. Masstransit (https://masstransit-project.com/) is used as bus to control message flow (and build abstraction over mq) and as entry point that can be decorated
 * Nginx is used as static content provider and  forward-proxy so no cors problems would require handling
 * Front-end is provided as SPA based on angular and dev-extreme
 * Record discovery - for every entity class there is selector class that can be used to find certain record in some way. Selector class can just be holder of id, or can hold some other unique paramters by which entity can be found. Selector class is part of API and is separated from search logic.
 * Single WebApi service is used as api-gateway, which accepts forwarded api requests. All other services contact MQ only. This provides single entry point for application. With this we can separate all services from front-end network.

### Other stuff
 * 'Services' (classes that end with 'Service') are just proxy for dispatching calls on MassTransit bus in simple way, hiding actual usage of bus, that otherwise may appear as service locator anti-pattern. Also allowing only service to be called in other code (not bus itself) makes it more maintanable (as there must be only one methods by which usages of consumer can be found)
 * Request clients (MQ client that awaits response on special queue after issuing request) have messages validated before passing to MQ (so invalid message - like update without id of object to be updated) won't even be sent to MQ.

## How to launch
To launch project locally:

  * clone project
  * restore packages/build c# solution
  * go to ui project, ("cd ./src/Kaizen.Ui.Angular"), restore packages ("npm i"), build solution ("ng build --prod")
  * go to build ("cd ./build/dev"), compose project ("docker-compose up -d")
  * go to app ("http://localhost")
