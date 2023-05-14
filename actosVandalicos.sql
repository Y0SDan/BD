/*CREATE TABLE hotel(
	id SERIAL PRIMARY KEY,
	direccion VARCHAR(50) DEFAULT 'sin direccion',
	telefono INTEGER NOT NULL
);

CREATE TABLE habitacion(
	numero INTEGER NOT NULL,
	soleada VARCHAR(2) NOT NULL,
	nevera VARCHAR(2) NOT NULL,
	lavabo VARCHAR(2) NOT NULL,
	hotel_id INTEGER,
	FOREIGN KEY(hotel_id) REFERENCES hotel(id),
	PRIMARY KEY(numero, hotel_id)
);

CREATE TABLE cliente(
	rfc VARCHAR(13) PRIMARY KEY,
	telefono INTEGER NOT NULL,
	direccion VARCHAR(50) DEFAULT 'sin direccion',
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NOT NULL
);*/

CREATE TABLE estancias(
	id SERIAL PRIMARY KEY,
	fecha_llegada DATE NOT NULL,
	fecha_salida DATE NOT NULL,
	cliente_rfc VARCHAR(13) REFERENCES cliente(rfc),
	habitacion_numero INTEGER,
	habitacion_hotel_id INTEGER,
	FOREIGN KEY(habitacion_numero,habitacion_hotel_id) REFERENCES habitacion(numero, hotel_id)
);

/*CREATE TABLE mobiliario(
	id SERIAL PRIMARY KEY,
	descripcion VARCHAR(50) NOT NULL,
	precio FLOAT NOT NULL,
	habitacion_numero INTEGER,
	habitacion_hotel_id INTEGER,
	FOREIGN KEY(habitacion_numero,habitacion_hotel_id) REFERENCES habitacion(numero, hotel_id)
);

CREATE TABLE deteriora(
	estancias_id INTEGER PRIMARY KEY,
	mobiliario_id INTEGER NOT NULL,
	FOREIGN KEY(estancias_id) REFERENCES estancias(id),
	FOREIGN KEY(mobiliario_id) REFERENCES mobiliario(id)
);*/