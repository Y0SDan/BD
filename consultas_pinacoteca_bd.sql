DROP TABLE pinacoteca;

CREATE TABLE pinacoteca (
	nombre VARCHAR(50) PRIMARY KEY,  -- VARCHAR ó CHARACTER VARYING
	ciudad VARCHAR(100) NOT NULL, 
	direccion VARCHAR(150),
	extension VARCHAR(50) 
);
ALTER TABLE pinacoteca 
 ADD COLUMN ciudad VARCHAR(100) NOT NULL;


INSERT INTO pinacoteca(nombre, ciudad, direccion)
	VALUES ('Valles Centrales', 'Oaxaca de Juaréz' , 'Centro S/N' );


INSERT INTO pinacoteca(direccion, ciudad, nombre)
	VALUES ('Calle Hidalgo', 'Huajuapn' , 'Mixteca' );

INSERT INTO pinacoteca(nombre, ciudad)
	VALUES ('Istmo', 'Tehuantepec');

SELECT * FROM pinacoteca;







CREATE TABLE escuela (
	nombre VARCHAR(50) PRIMARY KEY,
	pais VARCHAR(50) NOT NULL,
	fecha_aparicion DATE NOT NULL
);
CREATE TABLE pintor (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido_paterno VARCHAR(30) NOT NULL,
	apellido_materno VARCHAR(30) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	fecha_fallecimiento DATE,
	pais_nacimiento VARCHAR(50),
	maestro_id INTEGER,
	escuela_nombre VARCHAR(50),
	FOREIGN KEY (maestro_id) REFERENCES pintor(id),
	FOREIGN KEY (escuela_nombre) REFERENCES escuela(nombre)
);

CREATE TABLE cuadro (
	codigo SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	medidas VARCHAR(50),
	fecha_pintado DATE,
	tecnica_pintado VARCHAR(50),
	pinacoteca_nombre VARCHAR(50),
	pintor_id INTEGER,
	FOREIGN KEY (pinacoteca_nombre) REFERENCES pinacoteca(nombre),
	FOREIGN KEY (pintor_id) REFERENCES pintor(id)
);

ALTER TABLE cuadro
 DROP CONSTRAINT cuadro_pkey;

CREATE TABLE mecena (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido_paterno VARCHAR(30) NOT NULL,
	apellido_materno VARCHAR(30) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	fecha_fallecimiento DATE,
	pais_nacimiento VARCHAR(50)
);


CREATE TABLE patrocinio (
	id SERIAL PRIMARY KEY,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	pintor_id INTEGER REFERENCES pintor(id),
	mecena_id INTEGER REFERENCES mecena(id)
);

ALTER TABLE patrocinio 
    ADD COLUMN hora TIME NOT NULL;

ALTER TABLE patrocinio 
	DROP COLUMN hora;	
	
DROP TABLE patrocinio;	


CREATE TABLE patrocinio (
	id SERIAL PRIMARY KEY,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	pintor_id INTEGER,
	mecena_id INTEGER
);
-- agregamos claves foráneas a la tabla
ALTER TABLE patrocinio 
	ADD CONSTRAINT pintor_id_fkey
	FOREIGN KEY (pintor_id) REFERENCES pintor(id);

ALTER TABLE patrocinio 
	ADD CONSTRAINT mecena_id_fkey
	FOREIGN KEY (mecena_id) REFERENCES mecena;

DROP TABLE patrocinio ;

CREATE TABLE pinacoteca (
    nombre VARCHAR(50) NOT NULL UNIQUE ,  -- VARCHAR ó CHARACTER VARYING, UNIQUE significa valores no repetidos
	direccion VARCHAR(150) NOT NULL DEFAULT 'Sin dirección',  -- NOT NULL significa que no puede quedar vacía
	extensi		on VARCHAR(50),
	rfc VARCHAR(13) NOT NULL UNIQUE,
	cantidad_trabajadores INTEGER NOT NULL DEFAU0LT 0 CHECK (cantidad_trabajadores>=0),
	fecha_apertura DATE DEFAULT CURRENT_DATE,
	fecha_primera_exhibicion DATE,
	CHECK (fecha_primera_exhibicion>=fecha_apertura),
	UNIQUE(nombre, direccion),
	PRIMARY KEY (nombre)  -- PRIMARY KEY (nombre, direccion, extension)
);