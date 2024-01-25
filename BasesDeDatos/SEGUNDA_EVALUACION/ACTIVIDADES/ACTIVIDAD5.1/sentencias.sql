CREATE DATABASE Actividad5_1_DML;
USE Actividad5_1_DML;

CREATE TABLE Cantante(
    identificador INT(5) NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    primer_apellido VARCHAR (50) NOT NULL,
    segundo_apellido VARCHAR (50),
    email VARCHAR (50) NOT NULL,
    CONSTRAINT pk_identificador PRIMARY KEY (identificador)
);

ALTER TABLE Cantante MODIFY identificador INT(5) NOT NULL AUTO_INCREMENT;

CREATE TABLE Cancion(
    identificador INT(5) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    duracion FLOAT(50) NOT NULL,
    CONSTRAINT pk_identificador PRIMARY KEY(identificador)
);

ALTER TABLE Cancion MODIFY identificador INT(5) NOT NULL AUTO_INCREMENT;

ALTER TABLE Cantante ADD CONSTRAINT uk_email UNIQUE(email);

CREATE TABLE Cantante_Cancion(
    id INT AUTO_INCREMENT,
    identificador_Cantante INT(5) NOT NULL,
    identificador_Cancion INT(5) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY(id),
    CONSTRAINT fk_Cantante_Cantante_Cancion FOREIGN KEY(identificador_Cantante) REFERENCES Cantante(identificador),
    CONSTRAINT fk_Cancion_Cantante_Cancion FOREIGN KEY(identificador_Cancion) REFERENCES Cantante(identificador)
);

INSERT INTO Cantante (`nombre`, `primer_apellido`, `segundo_apellido`, `email`) VALUES
                    ("Dioniso", "Martin", "Lobato", "dioniso@hotmail.com"),
                    ("María Ángeles", "Muñoz", "Dueñas","m_angeles@hotmail.com"),
                    ("Fernando", "Hisado", NULL, "fernando@gmail.com"),
                    ("Gonzalo", "Cidre", NULL, "gonza@hotmail.com"),
                    ("Travis", "Scott", NULL, "travis@hotmail.com");

INSERT INTO Cancion (`nombre`, `duracion`) VALUES
                    ("Cuando zarpa el amor", 2.45),
                    ("Lagrimas de amor", 3.65),
                    ("No puedo estar sin él", 3.50),
                    ("Goosebumps", 2.00),
                    ("Sudores Frios", 4.36);

INSERT INTO Cantante (`nombre`, `primer_apellido`, `segundo_apellido`, `email`) VALUES
                    ("Fernando", "Hisado", NULL, "fernando@hotmail.com"),
                    ("Gonzalo", "Cidre", NULL, "gonzalo@spetomail.com");

INSERT INTO Cantante_Cancion
        (`identificador_Cantante`, `identificador_Cancion`) VALUES
        (1, 1), (2,1),
        (1, 2),(2, 2),
        (1, 3),(2, 3),
        (5, 4),
        (6, 5),(7, 5);

ALTER TABLE Cancion ADD numero_reproducciones INT(4) NOT NULL;


CREATE DATABASE REPASO;,
USE REPASO;

CREATE USER pepito@localhost IDENTIFIED BY 'pepito1234';

GRANT CREATE ON Repaso.*TO pepito@localhost;

CREATE TABLE Ejemplo1(
    codigo int(9),
    nombre varchar(50) NOT NULL,
    dinero float (5) NOT NULL,
    CONSTRAINT pk_Ejemplo1 PRIMARY KEY(codigo),
    CONSTRAINT ck_dinero CHECK (dinero >= 0)
    );

CREATE TABLE Ejemplo2 (
    id int AUTO_INCREMENT,
    nombre varchar(50) NOT NULL,
    dinero_Ejemplo1 float(5) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY (id),
    CONSTRAINT fk_Ejemplo2_Ejemplo1 FOREIGN KEY (dinero_Ejemplo1)
    REFERENCES Ejemplo1(dinero) ON DELETE CASCADE
);

ALTER TABLE MODIFY CONSTRAINT fk_Ejemplo2_Ejemplo1 ON DELETE CASCADE SET NULL;