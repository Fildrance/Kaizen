FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
EXPOSE 80
EXPOSE 443
VOLUME ["/app/logs", "/app"]
# Install NodeJs
RUN apt-get update 
RUN apt-get install -y wget 
RUN apt-get install -y gnupg2 
RUN wget -qO- https://deb.nodesource.com/setup_12.x | bash - 
RUN apt-get install -y build-essential nodejs 
# RUN npm install @angular/cli 
RUN npm install @angular/cli@8.3.26 -g 
# End Install
ENTRYPOINT ["dotnet", "TestMassTransit.dll"]
