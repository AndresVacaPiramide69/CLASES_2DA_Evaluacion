CREATE DATABASE Repaso3;
USE Repaso3;

CREATE USER andres@localhost IDENTIFIED BY 'alicate1234';
GRANT ALL PRIVILEGES ON Repaso3.*TO andres@localhost;

CRATE TABLE Editorial(
    CIF varchar(9),
    razon_social text NOT NULL,
    direccion varchar(100) NOT NULL,
    telefono int(9) NOT NULL,
    correo varchar(30) NOT NULL,
    CONSTRAINT pk_Editorial PRIMARY KEY(CIF),
    CONSTRAINT ck_telefono CHECK (telefono > 99999999)
);

CREATE TABLE Libro(
    ISBN varchar(12),
    titulo varchar(100) NOT NULL,
    num_paginas int(5) NOT NULL,
    precio float(4) NOT NULL,
    CIF_editorial varchar(9) NOT NULL,
    CONSTRAINT pk_Libro PRIMARY KEY(ISBN),
    CONSTRAINT fk_Libro_Editorial FOREIGN KEY(CIF_editorial) ON DELETE CASCADE,

);

CREATE TABLE