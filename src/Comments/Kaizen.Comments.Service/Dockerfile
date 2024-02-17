FROM mcr.microsoft.com/dotnet/core/runtime
WORKDIR /app
EXPOSE 80
EXPOSE 443
# for now just mount project that is already built.
# todo: build app within docker
# todo: wait until rabbit is ready
VOLUME ["/app/logs", "/app"]
ENTRYPOINT ["dotnet", "Kaizen.Comments.Service.dll"]
