CREATE TABLE pinacoteca(
	nombre VARCHAR(50) PRIMARY KEY,
	direcion VARCHAR(150) NOT NULL DEFAULT 'Domicilio conocido',
	ciudad VARCHAR(100) NOT NULL,
	extp VARCHAR(50));
	
CREATE TABLE escuela(
	nombre VARCHAR(30) PRIMARY KEY,
	pais VARCHAR(30),
	fecha_aparicion DATE);

CREATE TABLE pintor(
	curp CHAR(18) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellidop VARCHAR(50) NOT NULL,
	apellidom VARCHAR(50),
	pais_nacimiento VARCHAR(30) NOT NULL,
	cuidad_nacimiento VARCHAR(50),
	fecha_nacimiento DATE NOT NULL,
	fecha_fallecimiento DATE,
	maEstro_curp CHAR(18),
	escuela_nombre VARCHAR(30),
	FOREIGN KEY(escuela_nombre) REFERENCES escuela(nombre),
	FOREIGN KEY(maestro_curp) REFERENCES pintor(curp)
	);

CREATE TABLE cuadro(
	codigo VARCHAR(20) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	medidas VARCHAR(30) NOT NULL,
	fecha_creacion DATE NOT NULL,
	tecnica_pintado VARCHAR(50) NOT NULL,
	pinacoteca_nombre VARCHAR(50),
	pintor_curp CHAR(18),
	FOREIGN KEY(pintor_curp) REFERENCES pintor(curp),
	FOREIGN KEY(pinacoteca_nombre) REFERENCES pinacoteca(nombre)
	);

	
CREATE TABLE mecena(
	curp CHAR(18) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellidop VARCHAR(50) NOT NULL,
	apellidom VARCHAR(50),
	fecha_nacimiento DATE NOT NULL,
	fecha_fallecimiento DATE,
	pais_nacimiento VARCHAR(30) NOT NULL
	);
	
CREATE TABLE patrocinio(
	id SERIAL PRIMARY KEY,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE,
	pintor_curp CHAR(18),
	mecena_curp CHAR(18),
	FOREIGN KEY(pintor_curp) REFERENCES pintor(curp),
	FOREIGN KEY(mecena_curp) REFERENCES mecena(curp)
	);
	
/*
DROP TABLE pinacoteca CASCADE;
DROP TABLE cuadro;
DROP TABLE pintor;
DROP TABLE escuela;
DROP TABLE patrocinio;
DROP TABLE mecena;
*/