CREATE TABLE Usuarios (
    codigo_user INT PRIMARY KEY,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    fecha_nacimiento DATE,
    identificacion VARCHAR(20),
    sexo CHAR(1),
    ciudad VARCHAR(50),
    email VARCHAR(100),
    contraseña VARCHAR(100),
    fecha_registro DATE,
    compras INT,
    adopciones INT
);

CREATE TABLE Proveedores (
    codigo_proveedor INT PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(50),
    direccion VARCHAR(100),
    productos INT,
    fecha_registro DATE
);

CREATE TABLE Productos (
    codigo_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    stock INT,
    precio DECIMAL(10,2),
    codigo_proveedor INT,
    FOREIGN KEY (codigo_proveedor) REFERENCES Proveedores(codigo_proveedor)
);

CREATE TABLE Mascotas (
    codigo_pet INT PRIMARY KEY,
    raza VARCHAR(50),
    genero CHAR(1),
    color VARCHAR(30),
    altura DECIMAL(5,2),
    peso DECIMAL(5,2),
    historia_clinica TEXT,
    codigo_user INT,
    FOREIGN KEY (codigo_user) REFERENCES Usuarios(codigo_user)
);

CREATE TABLE Facturas (
    codigo_factura INT PRIMARY KEY,
    fecha DATE,
    cliente INT,
    precio_producto DECIMAL(10,2),
    cantidad INT,
    IVA DECIMAL(10,2),
    total DECIMAL(10,2),
    producto INT,
    medio VARCHAR(50),
    FOREIGN KEY (cliente) REFERENCES Usuarios(codigo_user),
    FOREIGN KEY (producto) REFERENCES Productos(codigo_producto)
);

CREATE TABLE Adopciones (
    codigo_adopcion INT PRIMARY KEY,
    nombre_user INT,
    nombre_pet INT,
    fecha DATE,
    raza VARCHAR(50),
    estado VARCHAR(20),
    FOREIGN KEY (nombre_user) REFERENCES Usuarios(codigo_user),
    FOREIGN KEY (nombre_pet) REFERENCES Mascotas(codigo_pet)
);
