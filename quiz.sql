CREATE DATABASE IF NOT EXISTS campusbike;
USE campusbike;

CREATE TABLE IF NOT EXISTS inf_cliente (
    id_inf_cliente INT PRIMARY KEY,
    id_cliente INT UNIQUE NOT NULL,
    nombre VARCHAR(250) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    tlf VARCHAR(10) NOT NULL UNIQUE,
    direccion VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS inf_proveedores (
    id_inf_proveedores INT PRIMARY KEY,
    id_proveedor INT UNIQUE NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    term_suministros_seguimiento VARCHAR(500) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    tlf VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS producto (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    desc_producto VARCHAR(200) NOT NULL,
    valor_producto INT NOT NULL,
    cant_producto INT NOT NULL,
    marca VARCHAR(100) NOT NULL,
    id_proveedor_fk INT,
    FOREIGN KEY (id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS gestion_proveedores (
    id_gest_proveedores INT PRIMARY KEY,
    id_inf_proveedores_fk INT,
    id_proveedor_fk INT,
    FOREIGN KEY (id_inf_proveedores_fk) REFERENCES inf_proveedores(id_inf_proveedores),
    FOREIGN KEY (id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS compras_cliente (
    id_compras INT PRIMARY KEY,
    id_producto_fk INT,
    id_cliente_fk INT,
    FOREIGN KEY (id_producto_fk) REFERENCES producto(id_producto),
    FOREIGN KEY (id_cliente_fk) REFERENCES inf_cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS gestion_cliente (
    id_gestion_cliente INT PRIMARY KEY,
    id_inf_cliente_fk INT,
    id_compras_cliente_fk INT,
    id_cliente_fk INT,
    FOREIGN KEY (id_inf_cliente_fk) REFERENCES inf_cliente(id_inf_cliente),
    FOREIGN KEY (id_compras_cliente_fk) REFERENCES compras_cliente(id_compras),
    FOREIGN KEY (id_cliente_fk) REFERENCES inf_cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS ventas (
    id_venta INT PRIMARY KEY,
    id_compras_cliente_fk INT,
    FOREIGN KEY (id_compras_cliente_fk) REFERENCES compras_cliente(id_compras)
);

CREATE TABLE IF NOT EXISTS compras (
    id_compra INT PRIMARY KEY,
    id_producto INT NOT NULL,
    valor_compra INT NOT NULL,
    id_proveedor_fk INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS proveedores_compras (
    id_proveedor_fk INT,
    id_compra_fk INT,
    FOREIGN KEY (id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor),
    FOREIGN KEY (id_compra_fk) REFERENCES compras(id_compra)
);

CREATE TABLE IF NOT EXISTS gestion_ventas_compras (
    id_gestion INT PRIMARY KEY,
    id_venta_fk INT,
    id_compra_fk INT,
    FOREIGN KEY (id_venta_fk) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_compra_fk) REFERENCES compras(id_compra)
);

CREATE TABLE IF NOT EXISTS inventario_bici (
    id_bicicleta INT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    color VARCHAR(30) NOT NULL,
    tamaño VARCHAR(20) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    cant_bici INT NOT NULL,
    marca_bici VARCHAR(150) NOT NULL,
    valor_bici INT NOT NULL,
    id_proveedor_fk INT,
    FOREIGN KEY (id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS repuesto_bici (
    id_repuesto INT PRIMARY KEY,
    tipo_repuesto VARCHAR(150) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    valor_rpto INT NOT NULL,
    cant_repuesto INT NOT NULL,
    marca_rpto VARCHAR(150) NOT NULL,
    id_proveedor_fk INT,
    FOREIGN KEY (id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS accesorio_bici (
    id_accesorio INT PRIMARY KEY,
    tipo_accesorio VARCHAR(100) NOT NULL,
    cant_accesorio INT NOT NULL,
    modelo_accesorio VARCHAR(100) NOT NULL,
    valor_accesorio INT NOT NULL,
    marca_accesorio VARCHAR(100) NOT NULL,
    id_proveedor_fk INT,
    FOREIGN KEY (id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS gestion_inventario_repuesto (
    id_invt_rpto INT PRIMARY KEY,
    id_bici_fk INT,
    id_rpto_fk INT,
    id_accesorio_fk INT,
    FOREIGN KEY (id_bici_fk) REFERENCES inventario_bici(id_bicicleta),
    FOREIGN KEY (id_rpto_fk) REFERENCES repuesto_bici(id_repuesto),
    FOREIGN KEY (id_accesorio_fk) REFERENCES accesorio_bici(id_accesorio)
);
