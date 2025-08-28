# Etapa de build
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY TiendaMVC/MVCtienda.csproj ./TiendaMVC/
RUN dotnet restore
RUN dotnet publish -c Release -o /app/publish

# Etapa de runtime
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "MVCtienda.dll"]