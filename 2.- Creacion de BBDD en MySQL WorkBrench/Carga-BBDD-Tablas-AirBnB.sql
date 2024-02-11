/************************************************************
********************** Creando la BBDD **********************
************************************************************/

-- Eliminamos La BBDD a crear por si tenemos uno de nombre igual y no haya problemas
DROP DATABASE airbnb; 

-- Creamos nuestra BBDD y ponemos if no existe para q no nos salte error si existiera (es redundante pero es mas seguro, mientras aprendemos)
CREATE DATABASE IF NOT EXISTS airbnb; 
-- Llamamos a usar nuestra BBDD vacia
USE airbnb;  

-- Creamos las tablas a partir de los CSV proporcionado
-- No habilitamos los PrimaryKey ni los ForeinKey ya q no nos dejará hacer el ETL, Luego ya lo haremos
-- Para visualizar las columnas de los CSV use 'LibreOffice'

-- Para leer las Tablas tenemos que poner los Archivos CSV en la Carpeta de C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\ para que los lea

/***************************************************************************
********************** Cargando la tabla calendar.csv **********************
***************************************************************************/

-- Eliminamos por si existe alguna tabla llamada igual
DROP TABLE IF EXISTS `Calendar`; 

-- Creacion de la Tabla 'Calendar'
CREATE TABLE IF NOT EXISTS `Calendar` (
`IdListado`			INTEGER,
`Fecha`				DATE,
`Disponible`		CHAR(1),
`Precio`			VARCHAR(25), -- ponemos VARCHAR por que en nuestra data tiene el simbolo $ antes del numero
`PrecioAjustado`	VARCHAR(25),
`MinimoNoches`		VARCHAR(25), -- En nuestra data tenemos nulos y eso no lo reconoce como numero por eso le pondremos varchar
`MaximoNoches`		VARCHAR(25) -- luego corregiremos los tipos de datos
);

-- Mostrando las Tablas Creadas
SHOW TABLES;

-- Cargando la tabla Calendar con los datos del CSV
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Data\\Calendar.csv'
INTO TABLE `Calendar`
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1
LINES (IdListado,Fecha,Disponible,Precio,PrecioAjustado,MinimoNoches,MaximoNoches);

SELECT * FROM `Calendar`;

/**************************************************************************
********************** Cargando la tabla listing.csv **********************
**************************************************************************/

-- Eliminamos por si existe alguna tabla llamada igual
DROP TABLE IF EXISTS `Listing`; 

-- Creacion de la Tabla 'Calendar'
CREATE TABLE IF NOT EXISTS `Listing` (
    `IdListado` 			VARCHAR(50), 
    `Url` 					VARCHAR(100), 
    `IdScraping` 			VARCHAR(20),
    `UltimoBusqueda` 		VARCHAR(50), 
    `Nombre` 				VARCHAR(1000), 
    `Resumen` 				VARCHAR(1600), 
    `Espacio` 				VARCHAR(1000),
    `Descripcion` 			VARCHAR(1000), 
    `ExperienciaOfrecida` 	VARCHAR(100),
    `DescripcionVecindario` VARCHAR(1000), 
    `Notas` 				VARCHAR(1000), 
    `Transito` 				VARCHAR(1000), 
    `Acceso` 				VARCHAR(1000), 
    `Interaccion` 			VARCHAR(1000), 
    `ReglasCasa` 			VARCHAR(1000),
    `UrlMiniatura` 			VARCHAR(25), 
    `UrlMedia` 				VARCHAR(25), 
    `UrlImagen` 			VARCHAR(500), 
    `UrlXLImagen` 			VARCHAR(25), 
    `IdAnfitrion` 			VARCHAR(50), 
    `UrlAnfitrion` 			VARCHAR(50),
    `NombreAnfitrion` 		VARCHAR(100), 
    `AnfitrionDesde` 		VARCHAR(50), 
    `LocacionAnfitrion` 	VARCHAR(1000), 
    `AcercaAnfitrion` 		TEXT, 
    `TiempoRespuesta` 		VARCHAR(50), 
    `TasaRespuesta` 		VARCHAR(10), 
    `TasaAceptacion` 		VARCHAR(10), 
    `Superanfitrion` 		CHAR(1), 
    `UrlAnfiMiniatura` 		VARCHAR(300), 
    `UrlImagAnfit` 			VARCHAR(200), 
    `Barrio` 				VARCHAR(100), 
    `RecuenListAnfit` 		VARCHAR(50), 
    `TotalRecuenListAnfit` 	VARCHAR(50), 
    `DatosAnfit` 			VARCHAR(300), 
    `FotoAnfitrion` 		CHAR(1), 
    `AnfitVerificado` 		CHAR(1), 
    `Ciudad` 				VARCHAR(300), 
    `Vecindario` 			VARCHAR(25), 
    `VecindarioLimpio` 		VARCHAR(25), 
    `GrupoVecinLimp` 		VARCHAR(50), 
    `Provincia` 			VARCHAR(50), 
    `Estado` 				VARCHAR(50), 
    `Codigopostal` 			VARCHAR(50), 
    `Publicidad` 			VARCHAR(50), 
    `LocacionPublicidad` 	VARCHAR(100),
    `CodigoPais` 			VARCHAR(5), 
    `Pais` 					VARCHAR(25), 
    `Latitud` 				VARCHAR(25), 
    `Longitud` 				VARCHAR(25), 
    `LocacioExacta` 		CHAR(1), 
    `TipoPropiedad` 		VARCHAR(25), 
    `TipoDormitorio` 		VARCHAR(25), 
    `NumeroHuespedes` 		VARCHAR(50),
    `Baños` 				VARCHAR(50), 
    `Cuartos` 				VARCHAR(50), 
    `Camas` 				VARCHAR(50), 
    `TipoCama` 				VARCHAR(25), 
    `Comodidades` 			VARCHAR(2000), 
    `PiesCuadrados` 		VARCHAR(50), 
    `PrecioDia` 			VARCHAR(15),
    `PrecioSemanal` 		VARCHAR(15), 
    `PrecioMensual` 		VARCHAR(15), 
    `AdelantoPago` 			VARCHAR(15), 
    `LimpiezaGratis` 		VARCHAR(15), 
    `HuespedesAdicionales` 	VARCHAR(50), 
    `PagoExtraXPersona` 	VARCHAR(15), 
    `NochesMinimas` 		VARCHAR(50), 
    `NochesMaximas` 		VARCHAR(50),
    `NochesMinMin` 			VARCHAR(50), 
    `NochesMaxMin` 			VARCHAR(50), 
    `NochesMinMax` 			VARCHAR(50), 
    `NochesMaxMax` 			VARCHAR(50), 
    `PromedioMinNoches` 	VARCHAR(50), 
    `PromedioMaxNoches` 	VARCHAR(50),
    `ActualizacionCalen` 	VARCHAR(15), 
    `Disponible` 			CHAR(1), 
    `Disponi30Dias` 		VARCHAR(50), 
    `Disponi60Dias` 		VARCHAR(50), 
    `Disponi90Dias` 		VARCHAR(50),
    `Disponi365Dias` 		VARCHAR(50), 
    `CalendBuscadoUltim` 	VARCHAR(50), 
    `NumeroReseñas` 		VARCHAR(50), 
    `NumeroReseñasActu` 	VARCHAR(50), 
    `PrimeraReseña` 		VARCHAR(50),
    `UltimaReseña` 			VARCHAR(50), 
    `CalificaRecomendacion` VARCHAR(50), 
    `CalificaPresicion` 	VARCHAR(50), 
    `CalificaLimpieza` 		VARCHAR(50), 
    `CalificaCheckIn` 		VARCHAR(50),
    `CalificaComunicacion` 	VARCHAR(50), 
    `CalificaLocacion` 		VARCHAR(50), 
    `CalificaExperiencia` 	VARCHAR(50), 
    `TieneLicencia` 		CHAR(1), 
    `licencia` 				VARCHAR(15), 
    `NombreJurisdiccion` 	VARCHAR(100),
    `ReservaInstantanea` 	CHAR(1), 
    `ViajeNegocios` 		CHAR(1), 
    `PoliticCancela` 		VARCHAR(50), 
    `RequiereFotoHuesped` 	CHAR(1), 
    `RequiereTelefono` 		CHAR(1),
    `CalculoAnfitriones`	VARCHAR(50), 
    `CasasXAnfitriones`		VARCHAR(50), 
    `CuartosPrivados` 		VARCHAR(50), 
    `CuartosCompartidos` 	VARCHAR(50), 
    `RevicionesXMes` 		VARCHAR(50)
) CHARSET UTF8;

-- Mostrando las Tablas Creadas
SHOW TABLES;

-- Cargando la tabla Calendar con los datos del CSV
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Data\\listings.csv'
INTO TABLE `Listing`
CHARACTER SET utf8mb4 -- Especificar la codificación de caracteres utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' -- Añadir la secuencia de escape '\\' para manejar correctamente los caracteres especiales
LINES TERMINATED BY '\n' IGNORE 1 
LINES;

-- Vemos los datos en la tabla
SELECT * FROM `Listing`;

/**************************************************************************
********************** Cargando la tabla reviews.csv **********************
**************************************************************************/

-- Eliminamos por si existe alguna tabla llamada igual
DROP TABLE IF EXISTS `Reviews`; 

-- Creacion de la Tabla 'Reviews'
-- Crear la tabla Reviews con la codificación de caracteres UTF-8
CREATE TABLE IF NOT EXISTS `Reviews` (
    `IdListado`         VARCHAR(50),    
    `Id`                VARCHAR(100),   
    `Fecha`             VARCHAR(20),
    `IdCriticos`        VARCHAR(50),    
    `NombreCriticos`    VARCHAR(100),   
    `Comentarios`       TEXT CHARACTER SET utf8mb4 -- Cambiar la codificación de caracteres a utf8mb4
);

-- Mostrar las Tablas Creadas
SHOW TABLES;

-- Cargar la tabla Reviews con los datos del CSV
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Data\\reviews.csv'
INTO TABLE `Reviews`
CHARACTER SET utf8mb4 -- Especificar la codificación de caracteres utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

SELECT * FROM `Reviews`;


