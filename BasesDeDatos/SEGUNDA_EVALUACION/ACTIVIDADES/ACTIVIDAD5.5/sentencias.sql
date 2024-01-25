CREATE DATABASE Instituto;
USE Instituto;

CREATE TABLE Departamento(
    codigo int(9),
    nombre varchar(50) NOT NULL,
    CONSTRAINT pk_Departamento PRIMARY KEY(codigo),
    CONSTRAINT ck_Departamento CHECK(codigo <=0)
);

CREATE TABLE Ciclo(
    codigo int(9),
    nombre varchar(50) NOT NULL,
    num_de_creditos int(3) NOT NULL,
    CONSTRAINT pk_Ciclo PRIMARY KEY(codigo),
    CONSTRAINT ck_num_de_creditos CHECK (num_de_creditos >= 0 AND num_de_creditos<=120 AND codigo < 0)
);

CREATE TABLE Departamento_Ciclo(
    id int auto_increment,
    codigo_departamento int(9) NOT NULL,
    codigo_ciclo int(9) NOT NULL,
    CONSTRAINT pk_Departamento_Ciclo PRIMARY KEY (id),
    CONSTRAINT fk_Departamento_Departamento_Ciclo FOREIGN KEY (codigo_departamento) REFERENCES Departamento(codigo),
    CONSTRAINT fk_Ciclo_Departamento_Ciclo FOREIGN KEY (codigo_ciclo) REFERENCES Ciclo(codigo)
);

CREATE TABLE Modulo(
    nombre varchar(50),
    num_horas int(3) NOT NULL,
    CONSTRAINT pk_Modulo PRIMARY KEY(nombre),
    CONSTRAINT ck_num_horas CHECK (num_horas >= 0)
);

CREATE TABLE Ciclo_Modulo(
    id int auto_increment,
    codigo_ciclo int(9) NOT NULL,
    nombre_modulo varchar(50) NOT NULL,
    CONSTRAINT pk_Ciclo_Modulo PRIMARY KEY(id),
    CONSTRAINT fk_Ciclo_Ciclo_Modulo FOREIGN KEY(codigo_ciclo) REFERENCES Ciclo(codigo),
    CONSTRAINT fk_Modulo_Ciclo_Modulo FOREIGN KEY(nombre_modulo) REFERENCES Modulo(nombre),
    CONSTRAINT ck_codigo_ciclo CHECK (codigo_ciclo > 0)
);

CREATE TABLE Docente(
    dni varchar(9),
    nombre varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    CONSTRAINT pk_Docente PRIMARY KEY(dni)
);

CREATE TABLE Modulo_Docente(
    id int auto_increment,
    nombre_modulo varchar(50) NOT NULL,
    dni_docente varchar(9) NOT NULL,
    CONSTRAINT pk_Modulo_Docente PRIMARY KEY(id),
    CONSTRAINT fk_Modulo_Modulo_Docente FOREIGN KEY(nombre_modulo) REFERENCES Modulo(nombre),
    CONSTRAINT fk_Docente_Modulo_Docente FOREIGN KEY(dni_docente) REFERENCES Docente(dni)
);