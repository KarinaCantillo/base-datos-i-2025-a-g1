-- Eliminar base de datos si existe
DROP DATABASE IF EXISTS carrito_db;

-- Crear base de datos
CREATE DATABASE carrito_db;

-- Usar base de datos
USE carrito_db;

-- Tabla: persona
CREATE TABLE persona (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    correo VARCHAR(100),
    direccion TEXT,
    telefono VARCHAR(20)
);

-- Tabla: cliente
CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL,
    fecha_vinculacion DATE NOT NULL,
    persona_id INT NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES persona(id)
);

-- Tabla: empleado
CREATE TABLE empleado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL,
    fecha_vinculacion DATE NOT NULL,
    salario DECIMAL(10, 2),
    tipo_contrato VARCHAR(30),
    persona_id INT NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES persona(id)
);

-- Tabla: categoria
CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL    
);

-- Tabla: producto
CREATE TABLE producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- Tabla: inventario
CREATE TABLE inventario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    fecha_lote DATE,
    fecha_vencimiento DATE,
    producto_id INT NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES producto(id)
);

-- Tabla: metodo_pago
CREATE TABLE metodo_pago (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla: factura
CREATE TABLE factura (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    valor_bruto DECIMAL(10, 2) NOT NULL,
    valor_descuento DECIMAL(10, 2),
    valor_incremento DECIMAL(10, 2),
    valor_neto DECIMAL(10, 2) NOT NULL,
    cliente_id INT NOT NULL,
    medio_pago_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (medio_pago_id) REFERENCES metodo_pago(id)
);

-- Tabla: detalle_factura
CREATE TABLE detalle_factura (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT NOT NULL,
    porcentaje_descuento DECIMAL(5, 2),
    porcentaje_incremento DECIMAL(5, 2),
    subtotal DECIMAL(10, 2) NOT NULL,
    producto_id INT NOT NULL,
    factura_id INT NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES producto(id),
    FOREIGN KEY (factura_id) REFERENCES factura(id)
);
