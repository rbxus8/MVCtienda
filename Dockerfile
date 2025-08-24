# Usar runtime de .NET 8
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copiar archivos publicados
COPY TiendaMVC/publish/. .

# Exponer puerto
EXPOSE 80

# Ejecutar la app
ENTRYPOINT ["dotnet", "TiendaMVC.dll"]
