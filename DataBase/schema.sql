-- Base de datos
CREATE DATABASE dbVentaBoletos;
GO

USE dbVentaBoletos;
GO

-- Tabla de Administradores y Gestores
CREATE TABLE tblUsuariosSistema (
    idUsuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    correoElectronico NVARCHAR(100) UNIQUE NOT NULL,
    contraseña NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(15),
    tipoUsuario NVARCHAR(20) NOT NULL CHECK (tipoUsuario IN ('Administrador', 'Gestor')),
    fechaRegistro DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de Clientes
CREATE TABLE tblClientes (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellido NVARCHAR(100) NOT NULL,
    email NVARCHAR(150) UNIQUE NOT NULL,
    contraseña NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(15) NULL,
    fechaRegistro DATETIME DEFAULT GETDATE()
);
GO

-- Tabla Tipo de Vuelo (Nacional o Internacional)
CREATE TABLE tblTiposVuelo (
    idTipoVuelo INT IDENTITY(1,1) PRIMARY KEY,
    nombreTipo NVARCHAR(50) NOT NULL,
    descripcion NVARCHAR(MAX)
);
GO

-- Tabla Aerolíneas
CREATE TABLE tblAerolineas (
    idAerolinea INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    pais NVARCHAR(50) NOT NULL,
    contacto NVARCHAR(100),
    fechaRegistro DATETIME DEFAULT GETDATE()
);
GO

-- Tabla Vuelos Disponibles
CREATE TABLE tblVuelosDisponibles 
    idVuelo INT IDENTITY(1,1) PRIMARY KEY,
    numeroVuelo NVARCHAR(20) NOT NULL, -- Número único del vuelo
    idAerolinea INT NOT NULL, -- Relación con la aerolínea
    origen NVARCHAR(100) NOT NULL, -- Aeropuerto de origen
    destino NVARCHAR(100) NOT NULL, -- Aeropuerto de destino
    fechaSalida DATETIME NOT NULL, -- Fecha y hora de salida
    fechaLlegada DATETIME NOT NULL, -- Fecha y hora de llegada
    duracionEstimada NVARCHAR(50), -- Duración estimada del vuelo
    capacidad INT NOT NULL, -- Capacidad total de asientos
    asientosDisponibles INT NOT NULL, -- Asientos disponibles para venta
    precioBase DECIMAL(10,2) NOT NULL, -- Precio base por boleto
    idTipoVuelo INT NOT NULL, -- Relación con el tipo de vuelo
    estado NVARCHAR(20) DEFAULT 'programado' CHECK (estado IN ('programado', 'Volando', 'finalizado', 'cancelado', 'demorado','ocultado')),
    CONSTRAINT fk_aerolinea FOREIGN KEY (idAerolinea) REFERENCES tblAerolineas (idAerolinea) ON DELETE CASCADE,
    CONSTRAINT fk_tipoVuelo FOREIGN KEY (idTipoVuelo) REFERENCES tblTiposVuelo (idTipoVuelo) ON DELETE CASCADE
);
GO

-- Tabla Boletos Vendidos (Relación Cliente-Vuelo)
CREATE TABLE tblBoletosVendidos (
    idBoleto INT IDENTITY(1,1) PRIMARY KEY,
    idCliente INT NOT NULL, -- Cliente que compra el boleto
    idVuelo INT NOT NULL, -- Vuelo relacionado
    fechaCompra DATETIME DEFAULT GETDATE(), -- Fecha de la compra
    cantidadBoletos INT NOT NULL, -- Cantidad de boletos comprados
    precioTotal DECIMAL(10,2) NOT NULL, -- Total pagado
    estado NVARCHAR(20) DEFAULT 'activo' CHECK (estado IN ('activo', 'cancelado')), -- Estado del boleto
    CONSTRAINT fk_cliente FOREIGN KEY (idCliente) REFERENCES tblClientes (idCliente) ON DELETE CASCADE,
    CONSTRAINT fk_vuelo FOREIGN KEY (idVuelo) REFERENCES tblVuelosDisponibles (idVuelo) ON DELETE CASCADE
);
GO
