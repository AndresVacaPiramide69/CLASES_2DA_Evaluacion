CREATE DATABASE ACTIVIDAD5_6;
USE DATABASE ACTIVIDAD5_6;

CREATE TABLE Genero_Musical(
    codigo int(9) NOT NULL,
    nombre varchar(50) NOT NULL,
    CONSTRAINT pk_Genero_Musical PRIMARY KEY(codigo),
    CONSTRAINT ck_codigo CHECK(codigo >= 0)
);

CREATE TABLE Autor(
    nombre_Artistico varchar(50) NOT NULL,
    primer_Apellido varchar (50) NOT NULL,
    segundo_Apellido varchar(50),
    CONSTRAINT pk_Autor PRIMARY KEY(nombre_Artistico)
);

CREATE TABLE Evento(
    nombre varchar(50) NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT pk_Evento PRIMARY KEY(nombre)
);

CREATE TABLE Cancion(
    nombre varchar(50) NOT NULL,
    duracion FLOAT(50) NOT NULL,
    codigo_Genero_Musical int (9) NOT NULL,
    nombre_Evento varchar(50) NOT NULL,
    CONSTRAINT pk_Cancion PRIMARY KEY (nombre),
    CONSTRAINT fk_Cancion_Genero_Musical FOREIGN KEY(codigo_Genero_Musical) 
    REFERENCES Genero_Musical(codigo),
    CONSTRAINT fk_Cancion_Evento FOREIGN KEY(nombre_Evento) 
    REFERENCES Evento(nombre),
    CONSTRAINT ck_duracion CHECK(duracion >= 0.0),
    CONSTRAINT ck_codigo_Genero_Musical CHECK(codigo_Genero_Musical >= 0)
);

CREATE TABLE Autor_Cancion(
    id int(9) auto_increment,
    nombre_Cancion varchar(50) NOT NULL,
    nombre_Artistico varchar(50) NOT NULL,
    CONSTRAINT pk_Autor_Cancion PRIMARY KEY(id),
    CONSTRAINT fk_Cancion_Autor_Cancion FOREIGN KEY(nombre_Cancion)
    REFERENCES Cancion (nombre_Cancion),
    CONSTRAINT fk_Autor_Autor_Cancion FOREIGN KEY(nombre_Artistico)
    REFERENCES Autor (nombre_Artistico)
);