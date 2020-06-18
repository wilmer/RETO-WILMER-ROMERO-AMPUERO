/*
Created: 17/06/2020
Modified: 18/06/2020
Model: PeruApps
Database: MS SQL Server 2014
*/


-- Create tables section -------------------------------------------------

-- Table SedeOlimpica

CREATE TABLE [SedeOlimpica]
(
 [IdSedeOlimpica] Int NOT NULL,
 [NumeroComplejos] Nvarchar(200) NULL,
 [Presupuesto] Decimal(18,2) NULL,
 [NombreSedeOlimpica] Nvarchar(3000) NULL,
 [IdTipoSede] Int NOT NULL
)
go

-- Add keys for table SedeOlimpica

ALTER TABLE [SedeOlimpica] ADD CONSTRAINT [PK_SedeOlimpica] PRIMARY KEY ([IdSedeOlimpica],[IdTipoSede])
go

-- Table ComplejosDeportivos

CREATE TABLE [ComplejosDeportivos]
(
 [IdComplejoDeportivo] Int NOT NULL,
 [IdTipoComplejo] Int NULL,
 [IdSedeOlimpica] Int NOT NULL,
 [IdJefe] Int NOT NULL,
 [AreaOcupada] Decimal(18,2) NULL,
 [Localizacion] Nvarchar(4000) NULL,
 [IdTipoSede] Int NOT NULL
)
go

-- Create indexes for table ComplejosDeportivos

CREATE INDEX [IX_Relationship2] ON [ComplejosDeportivos] ([IdTipoComplejo])
go

-- Add keys for table ComplejosDeportivos

ALTER TABLE [ComplejosDeportivos] ADD CONSTRAINT [PK_ComplejosDeportivos] PRIMARY KEY ([IdComplejoDeportivo],[IdSedeOlimpica],[IdJefe],[IdTipoSede])
go

-- Table TiposComplejos

CREATE TABLE [TiposComplejos]
(
 [IdTipoComplejo] Int NOT NULL,
 [DescriTipoComplejo] Nvarchar(200) NULL
)
go

-- Add keys for table TiposComplejos

ALTER TABLE [TiposComplejos] ADD CONSTRAINT [PK_TiposComplejos] PRIMARY KEY ([IdTipoComplejo])
go

-- Table Deporte

CREATE TABLE [Deporte]
(
 [IdDeporte] Int NOT NULL,
 [DescripcionDeporte] Nvarchar(max) NULL
)
go

-- Add keys for table Deporte

ALTER TABLE [Deporte] ADD CONSTRAINT [PK_Deporte] PRIMARY KEY ([IdDeporte])
go

-- Table Jefe

CREATE TABLE [Jefe]
(
 [IdJefe] Int NOT NULL,
 [NombreJefe] Nvarchar(2000) NULL
)
go

-- Add keys for table Jefe

ALTER TABLE [Jefe] ADD CONSTRAINT [PK_Jefe] PRIMARY KEY ([IdJefe])
go

-- Table Evento

CREATE TABLE [Evento]
(
 [IdEvento] Int NOT NULL,
 [FechaInicio] Datetime NULL,
 [NumeroParticipantes] Int NULL,
 [FechaFin] Datetime NULL,
 [Duracion] Int NULL,
 [IdDeporte] Int NOT NULL
)
go

-- Add keys for table Evento

ALTER TABLE [Evento] ADD CONSTRAINT [PK_Evento] PRIMARY KEY ([IdEvento],[IdDeporte])
go

-- Table Comisario

CREATE TABLE [Comisario]
(
 [IdComisario] Int NOT NULL,
 [IdTipoComisario] Int NOT NULL,
 [NombreComisario] Nvarchar(200) NULL
)
go

-- Add keys for table Comisario

ALTER TABLE [Comisario] ADD CONSTRAINT [PK_Comisario] PRIMARY KEY ([IdComisario],[IdTipoComisario])
go

-- Table EventoComisario

CREATE TABLE [EventoComisario]
(
 [IdEvento] Int NOT NULL,
 [IdComisario] Int NOT NULL,
 [IdTipoComisario] Int NOT NULL,
 [IdDeporte] Int NOT NULL
)
go

-- Add keys for table EventoComisario

ALTER TABLE [EventoComisario] ADD CONSTRAINT [PK_EventoComisario] PRIMARY KEY ([IdEvento],[IdComisario],[IdTipoComisario],[IdDeporte])
go

-- Table ComplejoDeportivoEvento

CREATE TABLE [ComplejoDeportivoEvento]
(
 [IdComplejoDeportivo] Int NOT NULL,
 [IdSedeOlimpica] Int NOT NULL,
 [IdJefe] Int NOT NULL,
 [IdEvento] Int NOT NULL,
 [IdDeporte] Int NOT NULL,
 [IdTipoSede] Int NOT NULL
)
go

-- Add keys for table ComplejoDeportivoEvento

ALTER TABLE [ComplejoDeportivoEvento] ADD CONSTRAINT [PK_ComplejoDeportivoEvento] PRIMARY KEY ([IdComplejoDeportivo],[IdSedeOlimpica],[IdJefe],[IdEvento],[IdDeporte],[IdTipoSede])
go

-- Table TipoComisario

CREATE TABLE [TipoComisario]
(
 [IdTipoComisario] Int NOT NULL,
 [IdTipoComisario] Int NOT NULL
)
go

-- Add keys for table TipoComisario

ALTER TABLE [TipoComisario] ADD CONSTRAINT [PK_TipoComisario] PRIMARY KEY ([IdTipoComisario],[IdTipoComisario])
go

-- Table TipoComisario

CREATE TABLE [TipoComisario]
(
 [IdTipoComisario_PK] Int NOT NULL,
 [DescripcionTipoUsuario] Nvarchar(1) NULL
)
go

-- Add keys for table TipoComisario

ALTER TABLE [TipoComisario] ADD CONSTRAINT [PK_TipoComisario] PRIMARY KEY ([IdTipoComisario_PK])
go

-- Table Equipamiento

CREATE TABLE [Equipamiento]
(
 [IdEquipamiento] Int NOT NULL,
 [DescripcionEquipamiennto] Nvarchar(500) NULL
)
go

-- Add keys for table Equipamiento

ALTER TABLE [Equipamiento] ADD CONSTRAINT [PK_Equipamiento] PRIMARY KEY ([IdEquipamiento])
go

-- Table DeporteEquipamiento

CREATE TABLE [DeporteEquipamiento]
(
 [IdDeporte] Int NOT NULL,
 [IdEquipamiento] Int NOT NULL
)
go

-- Add keys for table DeporteEquipamiento

ALTER TABLE [DeporteEquipamiento] ADD CONSTRAINT [PK_DeporteEquipamiento] PRIMARY KEY ([IdDeporte],[IdEquipamiento])
go

-- Table Mantenimiento

CREATE TABLE [Mantenimiento]
(
 [IdMantenimiento] Int NOT NULL,
 [FechaMantenimiento] Datetime NULL,
 [IdEquipamiento] Int NOT NULL
)
go

-- Add keys for table Mantenimiento

ALTER TABLE [Mantenimiento] ADD CONSTRAINT [PK_Mantenimiento] PRIMARY KEY ([IdMantenimiento],[IdEquipamiento])
go

-- Table Usuarios

CREATE TABLE [Usuarios]
(
 [idUsuario] Int NOT NULL,
 [email] Nvarchar(200) NULL,
 [contrasenha] Nvarchar(100) NULL,
 [estado] Int NULL,
 [token] Nvarchar(max) NULL
)
go

-- Add keys for table Usuarios

ALTER TABLE [Usuarios] ADD CONSTRAINT [PK_Usuarios] PRIMARY KEY ([idUsuario])
go

-- Table DeporteEquipamiento

CREATE TABLE [DeporteEquipamiento]
(
 [IdDeporte] Int NOT NULL,
 [IdEquipamiento] Int NOT NULL
)
go

-- Add keys for table DeporteEquipamiento

ALTER TABLE [DeporteEquipamiento] ADD CONSTRAINT [PK_DeporteEquipamiento] PRIMARY KEY ([IdDeporte],[IdEquipamiento])
go

-- Table ComplejoDeportivoDeporte

CREATE TABLE [ComplejoDeportivoDeporte]
(
 [IdDeporte] Int NOT NULL,
 [IdComplejoDeportivo] Int NOT NULL,
 [IdSedeOlimpica] Int NOT NULL,
 [IdJefe] Int NOT NULL,
 [IdTipoSede] Int NOT NULL
)
go

-- Add keys for table ComplejoDeportivoDeporte

ALTER TABLE [ComplejoDeportivoDeporte] ADD CONSTRAINT [PK_ComplejoDeportivoDeporte] PRIMARY KEY ([IdDeporte],[IdComplejoDeportivo],[IdSedeOlimpica],[IdJefe],[IdTipoSede])
go

-- Table Area

CREATE TABLE [Area]
(
 [IdArea] Int NOT NULL,
 [DescripcionArea] Nvarchar(3000) NULL
)
go

-- Add keys for table Area

ALTER TABLE [Area] ADD CONSTRAINT [PK_Area] PRIMARY KEY ([IdArea])
go

-- Table ComplejoDeportivoArea

CREATE TABLE [ComplejoDeportivoArea]
(
 [IdComplejoDeportivo] Int NOT NULL,
 [IdSedeOlimpica] Int NOT NULL,
 [IdJefe] Int NOT NULL,
 [IdArea] Int NOT NULL,
 [IdTipoSede] Int NOT NULL
)
go

-- Add keys for table ComplejoDeportivoArea

ALTER TABLE [ComplejoDeportivoArea] ADD CONSTRAINT [PK_ComplejoDeportivoArea] PRIMARY KEY ([IdComplejoDeportivo],[IdSedeOlimpica],[IdJefe],[IdArea],[IdTipoSede])
go

-- Table TipoSede

CREATE TABLE [TipoSede]
(
 [IdTipoSede] Int NOT NULL,
 [TipoSede] Nvarchar(2000) NULL
)
go

-- Add keys for table TipoSede

ALTER TABLE [TipoSede] ADD CONSTRAINT [PK_TipoSede] PRIMARY KEY ([IdTipoSede])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [ComplejosDeportivos] ADD CONSTRAINT [Relationship2] FOREIGN KEY ([IdTipoComplejo]) REFERENCES [TiposComplejos] ([IdTipoComplejo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ComplejosDeportivos] ADD CONSTRAINT [Relationship3] FOREIGN KEY ([IdSedeOlimpica], [IdTipoSede]) REFERENCES [SedeOlimpica] ([IdSedeOlimpica], [IdTipoSede]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ComplejosDeportivos] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([IdJefe]) REFERENCES [Jefe] ([IdJefe]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [EventoComisario] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([IdEvento], [IdDeporte]) REFERENCES [Evento] ([IdEvento], [IdDeporte]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [EventoComisario] ADD CONSTRAINT [Relationship7] FOREIGN KEY ([IdComisario], [IdTipoComisario]) REFERENCES [Comisario] ([IdComisario], [IdTipoComisario]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ComplejoDeportivoEvento] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([IdComplejoDeportivo], [IdSedeOlimpica], [IdJefe], [IdTipoSede]) REFERENCES [ComplejosDeportivos] ([IdComplejoDeportivo], [IdSedeOlimpica], [IdJefe], [IdTipoSede]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ComplejoDeportivoEvento] ADD CONSTRAINT [Relationship9] FOREIGN KEY ([IdEvento], [IdDeporte]) REFERENCES [Evento] ([IdEvento], [IdDeporte]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [TipoComisario] ADD CONSTRAINT [Relationship10] FOREIGN KEY ([IdTipoComisario], [IdTipoComisario]) REFERENCES [Comisario] ([IdComisario], [IdTipoComisario]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [DeporteEquipamiento] ADD CONSTRAINT [Relationship12] FOREIGN KEY ([IdDeporte]) REFERENCES [Deporte] ([IdDeporte]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [DeporteEquipamiento] ADD CONSTRAINT [Relationship13] FOREIGN KEY ([IdEquipamiento]) REFERENCES [Equipamiento] ([IdEquipamiento]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Comisario] ADD CONSTRAINT [Relationship14] FOREIGN KEY ([IdTipoComisario]) REFERENCES [TipoComisario] ([IdTipoComisario_PK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Evento] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([IdDeporte]) REFERENCES [Deporte] ([IdDeporte]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [DeporteEquipamiento] ADD CONSTRAINT [Relationship18] FOREIGN KEY ([IdDeporte]) REFERENCES [Deporte] ([IdDeporte]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [DeporteEquipamiento] ADD CONSTRAINT [Relationship19] FOREIGN KEY ([IdEquipamiento]) REFERENCES [Equipamiento] ([IdEquipamiento]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ComplejoDeportivoDeporte] ADD CONSTRAINT [Relationship20] FOREIGN KEY ([IdDeporte]) REFERENCES [Deporte] ([IdDeporte]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ComplejoDeportivoDeporte] ADD CONSTRAINT [Relationship21] FOREIGN KEY ([IdComplejoDeportivo], [IdSedeOlimpica], [IdJefe], [IdTipoSede]) REFERENCES [ComplejosDeportivos] ([IdComplejoDeportivo], [IdSedeOlimpica], [IdJefe], [IdTipoSede]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Mantenimiento] ADD CONSTRAINT [Relationship22] FOREIGN KEY ([IdEquipamiento]) REFERENCES [Equipamiento] ([IdEquipamiento]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ComplejoDeportivoArea] ADD CONSTRAINT [Relationship23] FOREIGN KEY ([IdComplejoDeportivo], [IdSedeOlimpica], [IdJefe], [IdTipoSede]) REFERENCES [ComplejosDeportivos] ([IdComplejoDeportivo], [IdSedeOlimpica], [IdJefe], [IdTipoSede]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [ComplejoDeportivoArea] ADD CONSTRAINT [Relationship24] FOREIGN KEY ([IdArea]) REFERENCES [Area] ([IdArea]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [SedeOlimpica] ADD CONSTRAINT [Relationship25] FOREIGN KEY ([IdTipoSede]) REFERENCES [TipoSede] ([IdTipoSede]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




