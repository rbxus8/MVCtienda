-- ========================================
-- CREACIÓN DE TABLAS EN POSTGRESQL (SUPABASE)
-- ========================================

-- Tabla CLIENTE
CREATE TABLE cliente (
    idcliente SERIAL PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    clave VARCHAR(200) NOT NULL,
    fecharegistro TIMESTAMP DEFAULT NOW(),
    reestablecer BOOLEAN DEFAULT FALSE
);

-- Tabla USUARIO (administradores u operadores)
CREATE TABLE usuario (
    idusuario SERIAL PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    clave VARCHAR(200) NOT NULL,
    reestablecer BOOLEAN DEFAULT FALSE,
    activo BOOLEAN DEFAULT TRUE,
    fecharegistro TIMESTAMP DEFAULT NOW()
);

-- Tabla DEPARTAMENTO
CREATE TABLE departamento (
    iddepartamento SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

-- Tabla PROVINCIA
CREATE TABLE provincia (
    idprovincia SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    iddepartamento INT NOT NULL REFERENCES departamento(iddepartamento)
);

-- Tabla DISTRITO
CREATE TABLE distrito (
    iddistrito SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    idprovincia INT NOT NULL REFERENCES provincia(idprovincia),
    iddepartamento INT NOT NULL REFERENCES departamento(iddepartamento)
);

-- Tabla MARCA
CREATE TABLE marca (
    idmarca SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fecharegistro TIMESTAMP DEFAULT NOW()
);

-- Tabla CATEGORIA
CREATE TABLE categoria (
    idcategoria SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fecharegistro TIMESTAMP DEFAULT NOW()
);

-- Tabla PRODUCTO
CREATE TABLE producto (
    idproducto SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    idmarca INT NOT NULL REFERENCES marca(idmarca),
    idcategoria INT NOT NULL REFERENCES categoria(idcategoria),
    precio NUMERIC(10,2) NOT NULL,
    stock INT NOT NULL,
    rutaimagen TEXT,
    nombreimagen VARCHAR(200),
    activo BOOLEAN DEFAULT TRUE,
    fecharegistro TIMESTAMP DEFAULT NOW()
);

-- Tabla CARRITO
CREATE TABLE carrito (
    idcarrito SERIAL PRIMARY KEY,
    idcliente INT NOT NULL REFERENCES cliente(idcliente),
    idproducto INT NOT NULL REFERENCES producto(idproducto),
    cantidad INT NOT NULL CHECK (cantidad > 0)
);

-- Tabla VENTA
CREATE TABLE venta (
    idventa SERIAL PRIMARY KEY,
    idcliente INT NOT NULL REFERENCES cliente(idcliente),
    totalproducto INT NOT NULL,
    montototal NUMERIC(10,2) NOT NULL,
    contacto VARCHAR(150),
    iddistrito INT NOT NULL REFERENCES distrito(iddistrito),
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    fechaventa TIMESTAMP DEFAULT NOW(),
    idtransaccion VARCHAR(100) UNIQUE
);

-- Tabla DETALLE VENTA
CREATE TABLE detalle_venta (
    iddetalleventa SERIAL PRIMARY KEY,
    idventa INT NOT NULL REFERENCES venta(idventa) ON DELETE CASCADE,
    idproducto INT NOT NULL REFERENCES producto(idproducto),
    cantidad INT NOT NULL CHECK (cantidad > 0),
    total NUMERIC(10,2) NOT NULL
);

-- ========================================
-- ÍNDICES Y OPTIMIZACIÓN
-- ========================================
CREATE INDEX idx_cliente_correo ON cliente(correo);
CREATE INDEX idx_usuario_correo ON usuario(correo);
CREATE INDEX idx_producto_nombre ON producto(nombre);
CREATE INDEX idx_venta_fechaventa ON venta(fechaventa);
