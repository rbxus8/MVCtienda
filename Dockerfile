# Etapa 1: build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiar el csproj y restaurar dependencias
COPY *.csproj .
RUN dotnet restore

# Copiar todo el código
COPY . .
RUN dotnet publish -c Release -o /app

# Etapa 2: runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app .

# Puerto expuesto
EXPOSE 8080

# Comando para iniciar la app
ENTRYPOINT ["dotnet", "TuProyecto.dll"]
