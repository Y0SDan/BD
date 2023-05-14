/*
CREATE TABLE juego(
    nombre VARCHAR(50) PRIMARY KEY,
    clasificacion VARCHAR(10)NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    genero VARCHAR(20) NOT NULL
);
*/
/*
CREATE TABLE version(
    id SERIAL PRIMARY KEY,
    requisitos VARCHAR(50) NOT NULL,
    anio_creacion DATE NOT NULL,
);
*/
/*
CREATE TABLE transaccion(
    numero SERIAL PRIMARY KEY,
    descuento FLOAT,
    fecha_hora TIMESTAMP NOT NULL,
    monto FLOAT NOT NULL
);
*/
/*
CREATE TABLE ususario(
    nickname VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(20),
    fecha_nacimiento DATE,
    email VARCHAR(20),
    telefono INTEGER NOT NULL
);
*/
/*
CREATE TABLE tarjeta(
    numero SERIAL PRIMARY KEY,
    fecha_vencimiento DATE,
    nombre VARCHAR(20)
);
*/
/*
CREATE TABLE modalidad_pago(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(20),
    periodo VARCHAR(20),
    PRECIO FLOAT
);
*/
/*
CREATE TABLE plataforma(
    nombre VARCHAR(20) PRIMARY KEY,
    modelO VARCHAR(15),
    fecha_lanzamiento DATE
);
*/
/*
CREATE TABLE version(
    id SERIAL PRIMARY KEY,
    requisitos VARCHAR(50),
    anio_creacion DATE
);
*/
/*
CREATE TABLE posee(
    usuario_nickname VARCHAR(20),
    tarjeta_numero SERIAL,
    id SERIAL PRIMARY KEY
);
*/

--CREAR ALVES FORANEAS

/*
ALTER TABLE posee
    ADD CONSTRAINT usuario_nickname_fkey
    FOREIGN KEY(usuario_nickname) REFERENCES ususario(nickname),
    ADD CONSTRAINT tarjeta_numero_fkey
    FOREIGN KEY(tarjeta_numero) REFERENCES tarjeta;
*/
/*
ALTER TABLE juego
    ADD COLUMN versionJuego_id INTEGER, 
    ADD CONSTRAINT jds
    FOREIGN KEY(versionJuego_id) REFERENCES version;
*/
/*
ALTER TABLE plataforma
    ADD COLUMN vesionPlataforma_id INTEGER,
    ADD CONSTRAINT mj
    FOREIGN KEY(vesionPlataforma_id) REFERENCES version;
*/

--Insertar Datos

/*
INSERT INTO juego(nombre,clasificacion, descripcion,genero)
            values('Gears','+18','The best game ever','Shooter');
*/
/*
INSERT INTO juego(nombre,clasificacion, descripcion,genero)
            values('Halo','+15','The best game ever after Gears','Shooter');
*/