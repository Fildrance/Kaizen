FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
EXPOSE 80
EXPOSE 443
# for now just mount project that is already built.
# todo: build app within docker
# todo: wait until rabbit is ready
VOLUME ["/app/logs", "/app"]
ENTRYPOINT update-ca-certificates && dotnet Kaizen.ApiGateway.dll
