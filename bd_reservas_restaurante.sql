CREATE TABLE Administrador 
(
 idAdministrador NCHAR (10) NOT NULL , 
 nombre VARCHAR (80) NOT NULL , 
 apellido VARCHAR (80) NOT NULL , 
 telefono NCHAR (9) NOT NULL , 
 correoElectronico VARCHAR (100) NOT NULL , 
 usuario VARCHAR (20) NOT NULL , 
 contraseña VARCHAR (18) NOT NULL 
);

ALTER TABLE Administrador ADD CONSTRAINT Administrador_PK PRIMARY KEY CLUSTERED (idAdministrador);

CREATE TABLE Cliente 
(
 dni NCHAR (8) NOT NULL , 
 nombreCl VARCHAR (80) NOT NULL , 
 apellidoCl VARCHAR (80) NOT NULL , 
 telefono NCHAR (9) NOT NULL , 
 correoElectronico VARCHAR (100) NOT NULL , 
 usuario VARCHAR (20) NOT NULL , 
 contraseña VARCHAR (18) NOT NULL 
);

ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK PRIMARY KEY CLUSTERED (dni);

CREATE TABLE DetalleReserva 
(
 Reserva_numeroReserva VARCHAR (15) NOT NULL , 
 Mesa_idMesa NCHAR (10) NOT NULL 
);

ALTER TABLE DetalleReserva ADD CONSTRAINT DetalleReserva_PK PRIMARY KEY CLUSTERED (Reserva_numeroReserva, Mesa_idMesa);

CREATE TABLE Mesa 
(
 idMesa NCHAR (10) NOT NULL , 
 numeroMesa VARCHAR (15) NOT NULL , 
 capacidad INTEGER NOT NULL , 
 Administrador_idAdministrador NCHAR (10) NOT NULL 
);

ALTER TABLE Mesa ADD CONSTRAINT Mesa_PK PRIMARY KEY CLUSTERED (idMesa);

CREATE TABLE Reserva 
(
 numeroReserva VARCHAR (15) NOT NULL , 
 fechaReserva DATE NOT NULL , 
 horaReserva TIME NOT NULL , 
 estado BIT NOT NULL , 
 Cliente_dni NCHAR (8) NOT NULL 
);

ALTER TABLE Reserva ADD CONSTRAINT Reserva_PK PRIMARY KEY CLUSTERED (numeroReserva);

ALTER TABLE DetalleReserva 
 ADD CONSTRAINT DetalleReserva_Mesa_FK FOREIGN KEY 
 ( 
  Mesa_idMesa
 ) 
 REFERENCES Mesa 
 ( 
  idMesa 
 ) 
 ON DELETE NO ACTION 
 ON UPDATE NO ACTION;

ALTER TABLE DetalleReserva 
 ADD CONSTRAINT DetalleReserva_Reserva_FK FOREIGN KEY 
 ( 
  Reserva_numeroReserva
 ) 
 REFERENCES Reserva 
 ( 
  numeroReserva 
 ) 
 ON DELETE NO ACTION 
 ON UPDATE NO ACTION;

ALTER TABLE Mesa 
 ADD CONSTRAINT Mesa_Administrador_FK FOREIGN KEY 
 ( 
  Administrador_idAdministrador
 ) 
 REFERENCES Administrador 
 ( 
  idAdministrador 
 ) 
 ON DELETE NO ACTION 
 ON UPDATE NO ACTION;

ALTER TABLE Reserva 
 ADD CONSTRAINT Reserva_Cliente_FK FOREIGN KEY 
 ( 
  Cliente_dni
 ) 
 REFERENCES Cliente 
 ( 
  dni 
 ) 
 ON DELETE NO ACTION 
 ON UPDATE NO ACTION;
