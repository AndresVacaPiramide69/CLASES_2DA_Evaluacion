CREATE DATABASE ACTIVIDAD5_7;
USE ACTIVIDAD5_7;

CREATE TABLE Gimnasio(
    id int(9) AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    CONSTRAINT pk_Gimnasio PRIMARY KEY(id)
);

CREATE TABLE Entrenador(
    dni varchar(9),
    nombre varchar(50) NOT NULL,
    primer_Apellido varchar(50) NOT NULL,
    salario float(10) NOT NULL,
    id_Gimnasio int(9),
    CONSTRAINT pk_Entrenador PRIMARY KEY(dni),
    CONSTRAINT fk_Entrenador_Gimnasio FOREIGN KEY(id_Gimnasio) 
    REFERENCES Gimnasio(id)
);

CREATE TABLE Cliente(
    dni varchar(9),
    nombre varchar(50) NOT NULL,
    primer_Apellido varchar(50) NOT NULL,
    fecha_alta date NOT NULL,
    CONSTRAINT pk_Cliente PRIMARY KEY(dni)
);

CREATE TABLE Planificacion(
    codigo int(3),
    fecha_creacion DATE NOT NULL,
    CONSTRAINT pk_Planificacion PRIMARY KEY(codigo)
);

CREATE TABLE Entrenador_Cliente_Planificacion(
    id int(9) AUTO_INCREMENT,
    dni_Entrenador varchar(9) NOT NULL,
    dni_Cliente varchar(9) NOT NULL,
    codigo_Planificacion int(3) NOT NULL,
    CONSTRAINT pk_Entrenador_Cliente_Planificacion PRIMARY KEY(id),
    CONSTRAINT fk_Entrenador_Cliente_Planificacion_Entrenador FOREIGN KEY(dni_Entrenador)
    REFERENCES Entrenador(dni),
    CONSTRAINT fk_Entrenador_Cliente_Planificacion_Cliente FOREIGN KEY(dni_Cliente)
    REFERENCES Cliente(dni),
    CONSTRAINT fk_Entrenador_Cliente_Planificacion_Planificacion FOREIGN KEY(codigo_Planificacion)
    REFERENCES Planificacion(codigo)
);

CREATE TABLE Entrenamiento(
    codigo int(4),
    fecha_Creacion DATE NOT NULL,
    codigo_Planificacion int(3) NOT NULL,
    CONSTRAINT pk_Entrenamiento PRIMARY KEY(codigo),
    CONSTRAINT fk_Entrenamiento_Planificacion FOREIGN KEY(codigo_Planificacion)
    REFERENCES Planificacion (codigo)
);

CREATE TABLE Material(
    nombre varchar(50),
    CONSTRAINT pk_Material PRIMARY KEY(nombre)
);

CREATE TABLE Ejercicio(
    nombre varchar(50),
    num_Series int(3) NOT NULL,
    num_Repeticiones int(3) NOT NULL,
    nombre_Material varchar(50) NOT NULL,
    CONSTRAINT pk_Ejercicio PRIMARY KEY(nombre),
    CONSTRAINT fk_Ejercicio_Material FOREIGN KEY(nombre_Material)
    REFERENCES Material (nombre)
);

CREATE TABLE Entrenamiento_Ejercicio(
    id int(9) AUTO_INCREMENT,
    codigo_Entrenamiento int(4) NOT NULL,
    nombre_Ejercicio varchar(50) NOT NULL,
    CONSTRAINT pk_Entreamiento_Ejercicio PRIMARY KEY(id),
    CONSTRAINT fk_Entrenamiento_Ejercicio_Entrenamiento FOREIGN KEY(codigo_Entrenamiento)
    REFERENCES Entrenamiento(codigo),
    CONSTRAINT fk_Entrenamiento_Ejercicio_Ejercicio FOREIGN KEY(nombre_Ejercicio)
    REFERENCES Ejercicio(nombre)
);

--INSERTAR DATOS--

INSERT INTO Gimnasio(`nombre`) VALUES
                    ("Spartan"),("Gitanoman");

INSERT INTO Entrenador(`dni`, `nombre`, `primer_Apellido`,`salario`, `id_Gimnasio`)
                VALUES("11864252R","Andres","Vaca",234.0,"1"),
                    ("11654367M","Carla","Lacaba",786.9,"2");

INSERT INTO 