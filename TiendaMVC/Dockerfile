# Etapa de build
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

# Copiar el archivo del proyecto primero para aprovechar el cache de Docker
COPY TiendaMVC/MVCtienda.csproj ./TiendaMVC/

# Restaurar dependencias
RUN dotnet restore ./TiendaMVC/MVCtienda.csproj

# Copiar todo el código fuente
COPY . .

# Compilar y publicar la aplicación
RUN dotnet publish ./TiendaMVC/MVCtienda.csproj -c Release -o /app/publish

# Etapa de runtime
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app

# Copiar los archivos publicados desde la etapa de build
COPY --from=build /app/publish .

# Exponer el puerto
EXPOSE 80

# Punto de entrada
ENTRYPOINT ["dotnet", "MVCtienda.dll"]