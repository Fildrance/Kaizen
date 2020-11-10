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

### dirty identity ssl hax

For identity-server admin ui there are several more required actions. As work with identity requires SSL, we will need some dev certifictes, for nginx and dotnet apps. 

As certificates require domain to be applied to, we will need to change our routing so we can handle our trusted dev site locally. 

Following instruction is simplified to bat file (./build/dev/prepare.dev) but only for windows, so just go to 'How to actually launch' block if you use Windows as OS (not connected to docker container).

add next line to C:\windows\system32\drivers\etc\hosts (for windows) or \etc\hosts (for linux)

```
127.0.0.1 skoruba.local sts.skoruba.local admin.skoruba.local admin-api.skoruba.local kaizen.skoruba.local
```

Then generate certs (you will need openssl installed):
```
cd build/identity/certs
mkcert --install
copy $env:LOCALAPPDATA\mkcert\rootCA.pem ./cacerts.pem
copy $env:LOCALAPPDATA\mkcert\rootCA.pem ./cacerts.crt

cd shared/nginx/certs
mkcert -cert-file skoruba.local.crt -key-file skoruba.local.key skoruba.local *.skoruba.local
mkcert -pkcs12 skoruba.local.pfx skoruba.local *.skoruba.local

openssl pkcs12 -export -out skoruba.local.pfx -inkey skoruba.local.key -in skoruba.local.crt
```

Then set cert password, verify it. use same password as cert password for launching identity docker-compose

After that we will need dhparam.pem for nginx to use Forward Secrecy.
```
openssl dhparam -out <put your path to project source folder here>/nginx-dhparam/dhparam.pem 4096
```

### How to actually launch

To launch project locally:

  * clone project
  * go to build ("cd ./build/dev")
  * build all the stuff (execute ".\build-all.bat")
  * prepare env - call ".\prepare.bat". Follow instuctions until it is finished.
  * install newly created dev certificates :D (on path /build/dev/nginx-certs install all *.crt and *.pfx stuff, pfx will require password you used in prepare.bat run previously)
  * up docker-compose using created bat (".\up.bat")
  * go to app ("http://localhost")
