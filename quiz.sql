create database campusbike;

use campusbike;

create table if not exists inf_cliente(
id_inf_cliente INT,
id_cliente INT,
nombre VARCHAR(250) not null,
email VARCHAR(100) not null unique,
tlf VARCHAR(10) not null unique,
direccion VARCHAR(150) not null,
PRIMARY KEY(id_inf_cliente, id_cliente));

create table if not exists inf_proveedores(
id_inf_poveedores INT,
id_proveedor INT,
nombre VARCHAR(200) not null,
term_suministros_seguimiento VARCHAR(500) not null,
email VARCHAR(100) not null unique,
tlf VARCHAR(20) not null unique,
PRIMARY KEY(id_inf_poveedores, id_proveedor));

create table if not exists producto(
id_producto INT primary key,
nombre_producto VARCHAR(100) not null,
desc_producto VARCHAR(200) not null,
valor_producto INT not null,
cant_producto INT not null,
marca VARCHAR(100) not null,
id_proveedor_fk INT,
FOREIGN KEY(id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor));

create table if not exists gestion_proveedores(
id_gest_proveedores INT primary key,
id_inf_proveedores_fk INT,
id_proveedor_fk INT,
FOREIGN KEY(id_inf_proveedores_fk) REFERENCES inf_proveedores(id_inf_proveedores),
FOREIGN KEY(id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor));

create table if not exists compras_cliente(
id_compras INT primary key,
id_producto_fk INT,
id_cliente_fk INT
FOREIGN KEY(id_producto_fk) REFERENCES producto(id_producto),
FOREIGN KEY(id_cliente_fk) REFERENCES inf_cliente(id_cliente));
create table if not exists gestion_cliente(
id_gestion_cliente INT primary key,
id_inf_cliente_fk INT,
id_compras_cliente_fk INT,
id_cliente_fk INT,
FOREIGN KEY(id_inf_cliente_fk) REFERENCES inf_cliente(id_inf_cliente),
FOREIGN KEY(id_compras_cliente_fk) REFERENCES compras_cliente(id_compras),
FOREIGN KEY(id_cliente_fk) REFERENCES inf_cliente(id_cliente));

create table if not exists ventas(
id_venta INT primary key,
id_compras_cliente_fk INT,
FOREIGN KEY(id_compras_cliente_fk) REFERENCES compras_cliente(id_compras));

create table if not exists compras(
id_compra INT primary key,
id_producto VARCHAR(100) not null,
valor_compra INT not null,
id_proveedor_fk INT,
FOREIGN KEY(id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor));

create table if not exists proveedores_compras(
id_proveedor_fk INT,
id_compra_fk INT,
FOREIGN KEY(id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor),
FOREIGN KEY(id_compra_fk) REFERENCES compras(id_compra));

create table if not exists gestion_ventas_compras(
id_gestion INT primary key,
id_venta_fk INT,
id_compra_fk INT,
FOREIGN KEY(id_venta_fk) REFERENCES ventas(id_venta),
FOREIGN KEY(id_compra_fk) REFERENCES compras(id_compra));

create table if not exists inventario_bici(
id_bicicleta INT primary key,
modelo VARCHAR(100) not null,
color VARCHAR(30) not null,
tamaño VARCHAR(20) not null,
tipo VARCHAR(30) not null,
cant_bici INT not null,
marca_bici VARCHAR(150) not null,
valor_bici INT not null,
id_proveedor_fk INT,
FOREIGN KEY(id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor));




create table if not exists respuesto_bici(
id_repuesto INT primary key,
tipo_repuesto VARCHAR(150) not null,
modelo VARCHAR(100) not null,
valor_rpto INT not null,
cant_repuesto INT not null,
marca_rpto VARCHAR(150) not null,
id_proveedor_fk INT,
FOREIGN KEY(id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor));

create table if not exists accesorio_bici(
id_accesorio INT primary key,
tipo_accesorio VARCHAR(100) not null,
cant_accesorio INT not null,
modelo_accesorio VARCHAR(100) not null,
valor_accesorio INT not null,
marca_accesorio VARCHAR(100) not null,
id_proveedor_fk INT,
FOREIGN KEY(id_proveedor_fk) REFERENCES inf_proveedores(id_proveedor));

create table if not exists gestion_inventario_repuesto(
id_invt_rpto INT primary key,
id_bici_fk INT,
id_rpto_fk INT,
id_accesorio_fk INT,
FOREIGN KEY(id_bici_fk) REFERENCES inventario_bici(id_bicicleta),
FOREIGN KEY(id_rpto_fk) REFERENCES repuesto_bici(id_repuesto),
FOREIGN KEY(id_accesorio_fk) REFERENCES accesorios_bici(id_accesorio));