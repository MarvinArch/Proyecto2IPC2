CREATE DATABASE proyecto2;

CREATE USER 'alpha24'@'localhost' IDENTIFIED BY '1Z9y5cc1@';
GRANT ALL PRIVILEGES ON proyecto1.* TO 'alpha24'@'localhost';	
FLUSH PRIVILEGES;

USE proyecto2;

CREATE TABLE usuario(
  nombre_usuario VARCHAR(20) NOT NULL,
  contraseña VARCHAR(15) NOT NULL,
  editor INT NOT NULL,
  nombres VARCHAR(40) NOT NULL,
  apellidos VARCHAR(40) NOT NULL,
  edad INT NOT NULL,
  hobbies VARCHAR(100) NULL,
  temas VARCHAR(100) NULL,
  foto BLOB NULL,
  intereses_personales VARCHAR(260) NULL,
  descripcion VARCHAR(260) NULL,
  etiquetas VARCHAR(100) NULL,
  CONSTRAINT PK_USUARIO PRIMARY KEY(nombre_usuario)
);

CREATE TABLE categoria(
  nombre_categoria VARCHAR(20) NOT NULL,
  CONSTRAINT PK_CATEGORIA PRIMARY KEY(codigo_unico)
);

CREATE TABLE revista(
  nombre_editor VARCHAR(20) NOT NULL,
  nombre_revista VARCHAR(50) NOT NULL,
  etiquetas VARCHAR(100) NULL,
  categoria VARCHAR(20) NOT NULL,
  precio_suscripcion FLOAT NOT NULL,
  CONSTRAINT PK_REVISTA PRIMARY KEY(nombre_revista),
  FOREIGN KEY(nombre_editor) REFERENCES usuario(nombre_usuario),
  FOREIGN KEY(categoria) REFERENCES categoria(nombre_categoria)
);

CREATE TABLE suscripciones(
  nombre_revista VARCHAR(50) NOT NULL,
  nombre_suscriptor VARCHAR(20) NOT NULL,
  nombre_editor VARCHAR(20) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_vencimiento DATE NOT NULL,
  codigo_unico INT AUTO_INCREMENT,
  precio FLOAT NOT NULL,
  estado INT NOT NULL,
  CONSTRAINT PK_SUSCRIPCIONES PRIMARY KEY(codigo_unico),
  FOREIGN KEY(nombre_suscriptor) REFERENCES usuario(nombre_usuario),
  FOREIGN KEY(nombre_editor) REFERENCES usuario(nombre_usuario),
  FOREIGN KEY(nombre_revista) REFERENCES revista(nombre_revista)
);

CREATE TABLE vol_revista(
  revista_padre VARCHAR(50) NOT NULL,
  titulo_volumen VARCHAR(50) NOT NULL,
  fecha_publicacion DATE NOT NULL,
  CONSTRAINT PK_VOL_REVISTA PRIMARY KEY(titulo_volumen),
  FOREIGN KEY(revista_padre) REFERENCES revista(nombre_revista)
);

CREATE TABLE comentarios(
  contenido VARCHAR(260) NOT NULL,
  codigo_unico INT AUTO_INCREMENT,
  nombre_usuario VARCHAR(20) NOT NULL,
  date_comment DATE NOT NULL,
  nombre_volumen VARCHAR(50) NOT NULL,
  CONSTRAINT PK_COMENTARIOS PRIMARY KEY(codigo_unico),
  FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre_usuario),
  FOREIGN KEY(nombre_volumen) REFERENCES vol_revista(titulo_volumen)
);

CREATE TABLE ilike(
  codigo_unico INT AUTO_INCREMENT,
  nombre_usuario VARCHAR(20) NOT NULL,
  date_like DATE NOT NULL,
  nombre_volumen VARCHAR(50) NOT NULL,
  CONSTRAINT PK_LIKE PRIMARY KEY(codigo_unico),
  FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre_usuario),
  FOREIGN KEY(nombre_volumen) REFERENCES vol_revista(titulo_volumen)
);

CREATE TABLE administrador(
  nombre_usuario VARCHAR(20) NOT NULL,
  contraseña VARCHAR(25) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_ADMINISTRADOR PRIMARY KEY(nombre_usuario)
);

CREATE TABLE empresa(
  nombre_usuario VARCHAR(20) NOT NULL,
  contraseña VARCHAR(25) NOT NULL,
  nombre_empresa VARCHAR(40) NOT NULL,
  CONSTRAINT PK_EMPRESA PRIMARY KEY(nombre_empresa),
  CONSTRAINT PK_EMPRESA PRIMARY KEY(nombre_usuario)
);

CREATE TABLE anuncio(
  link VARCHAR(100) NULL,
  contenido VARCHAR(260) NULL,
  tipo INT NOT NULL,
  estado INT NOT NULL,
  nombre_empresa VARCHAR(40) NOT NULL,
  dias_habilitados INT NULL,
  costo INT NOT NULL,
  imagen BLOB NULL,
  codigo_unico INT AUTO_INCREMENT,
  CONSTRAINT PK_ANUNCIO PRIMARY KEY(codigo_unico),
  FOREIGN KEY(nombre_empresa) REFERENCES empresa(nombre_empresa)
);

CREATE TABLE cobros_revistas(
  costo_dia FLOAT NOT NULL,
  porcentaje_cobro_suscripcion FLOAT NOT NULL
  
)
