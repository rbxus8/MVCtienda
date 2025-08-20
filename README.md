# 🛒 MVCtienda

Aplicación web de **tienda en línea** desarrollada con el patrón de arquitectura **MVC (Modelo–Vista–Controlador)**.  
Permite la gestión de productos, usuarios y ventas, sirviendo como ejemplo práctico para aprender y aplicar el patrón MVC en .NET.

---

## 📌 Descripción

**MVCtienda** simula el funcionamiento de una tienda virtual.  
Cuenta con módulos para la administración de productos, registro/autenticación de usuarios, carrito de compras y un historial de ventas.

Este proyecto está orientado a estudiantes y desarrolladores que deseen practicar con **C#, ASP.NET MVC y bases de datos**.

---

## 🚀 Características

- 📦 **Gestión de productos** (crear, editar, eliminar, listar).  
- 👤 **Registro y autenticación de usuarios**.  
- 🛍️ **Carrito de compras** con persistencia.  
- 📑 **Historial de ventas** por usuario.  
- 🎨 **Interfaz intuitiva** con Bootstrap.

---

## 🛠️ Tecnologías utilizadas

- **Lenguaje:** C#  
- **Framework:** .NET / ASP.NET MVC  
- **Base de datos:** SQL Server (o la que se configure)  
- **Frontend:** Bootstrap  

---

## 📂 Estructura del proyecto

```sh
MVCtienda/
│── Controllers/ # Controladores (lógica de negocio)
│── Models/ # Modelos (clases y entidades)
│── Views/ # Vistas (interfaz de usuario)
│── wwwroot/ # Archivos estáticos (CSS, JS, imágenes)
│── appsettings.json # Configuración de la BD y del proyecto
│── Program.cs # Punto de entrada de la aplicación
```

## ⚙️ Instalación y ejecución

1. Clona este repositorio:
   ```sh
   git clone https://github.com/rbxus8/MVCtienda.git
   cd MVCtienda
Configura la conexión a la base de datos en appsettings.json o DatabaseConnection.cs.


📖 Uso
Accede a la página principal de la tienda.

Regístrate o inicia sesión.

Explora el catálogo, agrega productos al carrito y finaliza la compra.

🤝 Contribuciones
¡Las contribuciones son bienvenidas!
Para colaborar:

Haz un fork del repositorio.

Crea una rama para tu mejora: git checkout -b feature/nueva-funcionalidad.

Envía un pull request.
