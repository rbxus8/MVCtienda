# Etapa de build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore "TiendaMVC/TiendaMVC.csproj"
RUN dotnet publish "TiendaMVC/TiendaMVC.csproj" -c Release -o /app/out

# Etapa runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .
EXPOSE 80
ENTRYPOINT ["dotnet", "TiendaMVC.dll"]
