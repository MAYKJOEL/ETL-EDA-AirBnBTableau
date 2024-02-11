-- LLamamos a la Base de Datos
USE `airbnb`; -- ok

-- Mostramos las tablas existentes
SHOW TABLES; -- ok

-- Vemos que hay dentro de la Tabla Calendar
SELECT * FROM `listing`;

-- Analizando antes de eliminar
-- como vemos esta columna nos da solo esta info y no nos sirve
SELECT * FROM listing WHERE IdScraping != 20200426042522; -- solo tiene ese dato numerico
SELECT * FROM listing WHERE ExperienciaOfrecida != 'none'; -- solo tiene el dato none
SELECT * FROM listing WHERE RecuenListAnfit != TotalRecuenListAnfit; -- ambos campos tienen la misma informacion
SELECT * FROM listing WHERE Vecindario != VecindarioLimpio; -- nos conviene quedarnos con Vecindario ya que tiene informacion de lugares mas conocidos ademas que son los mismos lugares de la otra columna
SELECT COUNT(*) FROM listing  WHERE PiesCuadrados = ''; -- 23346 de 23729 = 383 filas llenas el resto vacio, lo eliminamos
SELECT COUNT(*) FROM listing WHERE NochesMinimas != NochesMinMin; -- solo el 2% de datos diferentes, por tanto eliminamos NochesMinMin
SELECT COUNT(*) FROM listing WHERE NochesMinimas != NochesMaxMin; -- solo el 3% de datos diferentes, por tanto eliminamos NochesMaxMin
SELECT COUNT(*) FROM listing WHERE NochesMaximas != NochesMinMax;-- solo el 13% de datos diferentes, por tanto eliminamos NochesMinMax
SELECT COUNT(*) FROM listing WHERE NochesMaximas != NochesMaxMax;-- solo el 3% de datos diferentes, por tanto eliminamos NochesMaxMax

-- Comenzamos eliminando las columnas que no importan en las estadisticas como URL y mas 
ALTER TABLE `listing` DROP `Url`; -- tiene puro url y no nos sirve
ALTER TABLE `listing` DROP `IdScraping`; -- solo tiene un dato
ALTER TABLE `listing` DROP `Nombre`; -- nombre de la casa no nos da informacion
ALTER TABLE `listing` DROP `Resumen`; -- El resumen de la casa no nos da informacion estadistica
ALTER TABLE `listing` DROP `Espacio`; -- La descripcion del espacio no nos da informacion estadistica
ALTER TABLE `listing` DROP `Descripcion`; -- La descripcion no nos da informacion estadistica
ALTER TABLE `listing` DROP `ExperienciaOfrecida`; -- solo nos da la informacion de 'none'
ALTER TABLE `listing` DROP `DescripcionVecindario`; -- La descripcion del vecindario no nos da informacion estadistica
ALTER TABLE `listing` DROP `Notas`;-- La Notas no nos da informacion estadistica
ALTER TABLE `listing` DROP `Transito`; -- El transito no nos da informacion estadistica
ALTER TABLE `listing` DROP `Acceso`;-- La descripcion del acceso no nos da informacion estadistica
ALTER TABLE `listing` DROP `Interaccion`;-- La descripcion de interaccion no nos da informacion estadistica
ALTER TABLE `listing` DROP `ReglasCasa`;-- La descripcion de la regla de la casa no nos da informacion estadistica
ALTER TABLE `listing` DROP `UrlMiniatura`; -- url
ALTER TABLE `listing` DROP `UrlMedia`; -- url
ALTER TABLE `listing` DROP `UrlImagen`; -- url
ALTER TABLE `listing` DROP `UrlXLImagen`; -- url
ALTER TABLE `listing` DROP `UrlAnfitrion`; -- url
ALTER TABLE `listing` DROP `AcercaAnfitrion`;-- La descripcion del anfitrion no nos da informacion estadistica
ALTER TABLE `listing` DROP `UrlAnfiMiniatura`; -- url
ALTER TABLE `listing` DROP `UrlImagAnfit`; -- url
ALTER TABLE `listing` DROP `RecuenListAnfit`; -- tiene la misma info que TotalRecuenListAnfit
ALTER TABLE `listing` DROP `DatosAnfit`;  -- susu datos no es relevante para la estadistica
ALTER TABLE `listing` DROP `FotoAnfitrion`; -- no nos interesa si tiene foto el anfitrion
ALTER TABLE `listing` DROP `AnfitVerificado`; -- si es verificado o no, desde la perspectiva de inversor no es de importancia
ALTER TABLE `listing` DROP `VecindarioLimpio`; -- tiene la misma info que Vecindario
ALTER TABLE `listing` DROP `GrupoVecinLimp`; --  esta vacia el campo
ALTER TABLE `listing` DROP `Codigopostal`; -- no nos sirve ya q tenemos coordenadas
ALTER TABLE `listing` DROP `Publicidad`; -- la publicidad siempre es en la zona de la casa por tanto no es de importancia
ALTER TABLE `listing` DROP `LocacionPublicidad`; -- lo mismo que el anterior
ALTER TABLE `listing` DROP `CodigoPais`; -- no es de importancia ya tenemos el nombre del pais
ALTER TABLE `listing` DROP `LocacioExacta`; -- no es importancia ya que analizamos segun la perspectiva del inversor
ALTER TABLE `listing` DROP `PiesCuadrados`; -- pocos datos
ALTER TABLE `listing` DROP `NochesMinMin`; -- casi todo los datos don iguales a NochesMinimas
ALTER TABLE `listing` DROP `NochesMaxMin`;-- casi todo los datos don iguales a NochesMinimas
ALTER TABLE `listing` DROP `NochesMinMax`;-- casi todo los datos don iguales a NochesMaximas
ALTER TABLE `listing` DROP `NochesMaxMax`;-- casi todo los datos don iguales a NochesMaximas
ALTER TABLE `listing` DROP `PromedioMinNoches`; -- casi todo los datos don iguales a NochesMinimas
ALTER TABLE `listing` DROP `PromedioMaxNoches`;-- casi todo los datos don iguales a NochesMaximas
ALTER TABLE `listing` DROP `ActualizacionCalen`; -- el que actualicen o no su calendario no nos da informacion relevante
ALTER TABLE `listing` DROP `NumeroReseñas`; -- numero de reseñas no nos da informacion
ALTER TABLE `listing` DROP `NumeroReseñasActu`;-- numero de reseñas no nos da informacion
ALTER TABLE `listing` DROP `PrimeraReseña`; -- no tiene muchos datos mayoria vacios
ALTER TABLE `listing` DROP `UltimaReseña`; -- no tiene muchos datos mayoria vacios
ALTER TABLE `listing` DROP `CalificaPresicion`; -- no se entiende el tranfondo de esta puntuacion
ALTER TABLE `listing` DROP `CalificaLocacion`; -- ya tenemos info en el analisis de sentimiento
ALTER TABLE `listing` DROP `licencia`; -- columna vacia
ALTER TABLE `listing` DROP `NombreJurisdiccion`; -- columna vacia
ALTER TABLE `listing` DROP `CalculoAnfitriones`;
ALTER TABLE `listing` DROP `CasasXAnfitriones`;
ALTER TABLE `listing` DROP `Provincia`;
ALTER TABLE `listing` DROP `Estado`;
ALTER TABLE `listing` DROP `Comodidades`;
ALTER TABLE `listing` DROP `PrecioSemanal`;-- lo elimamos por q solo 1900 tiene datos 21000 sin datos
ALTER TABLE `listing` DROP `PrecioMensual`;-- lo elimamos por q solo 1900 tiene datos 21000 sin datos
ALTER TABLE `listing` DROP `Disponible`; -- todos estan disponible por tanto no hay dato que sacar aqui
ALTER TABLE `listing` DROP `Disponi30Dias`;
ALTER TABLE `listing` DROP `Disponi60Dias`;
ALTER TABLE `listing` DROP `Disponi90Dias`;
ALTER TABLE `listing` DROP `Disponi365Dias`;
ALTER TABLE `listing` DROP `TieneLicencia`; -- todos tienen licencia
ALTER TABLE `listing` DROP `ViajeNegocios`; -- Todos sirven para viajes de placer o negocio
ALTER TABLE `listing` DROP `CuartosCompartidos`; -- se eilimna por que todo es cero solo 10 datos diferente a 0, eso no nos da informacion relevante
-- seguir analizando columnas para seguir eliminando, si tiene datos suficiente o no y al final hacet el ETL
ALTER TABLE `listing` DROP `RevicionesXMes`; -- esta estadistica no nos da informacion general
ALTER TABLE `listing` DROP `CalendBuscadoUltim`; -- ya tenemos fecha 
ALTER TABLE `listing` DROP `Vecindario`; -- ya tengo esa informacion en otros campos
ALTER TABLE `listing` DROP `Ciudad`; -- ya tengo esa informacion en otros campos

-- Vemos la tabla despues de eliminar columnas innecesarias
SELECT * FROM `listing`; 

-- Cambiando el nombre de un campo LocacionAnfitrion = LocacionHuesped
ALTER TABLE `listing` CHANGE `LocacionAnfitrion` `LocacionHuesped` VARCHAR(1000);

-- ahora analizamos cada campo y curamos datos
SELECT COUNT(*) FROM `listing`; -- 23729 filas por culumna

-- Columna IdListado
SELECT COUNT(*) FROM `listing` WHERE `IdListado` = "" OR `IdListado` = NULL; -- nos dice q no tiene vacios o nulos
ALTER TABLE `listing` MODIFY `IdListado` CHAR(10); -- los id siempre es necesario ponerlos en tipo de dato CHAR

-- Columna UltimoBusqueda
SELECT COUNT(*) FROM `listing` WHERE `UltimoBusqueda` = "" OR `UltimoBusqueda` = NULL; -- nos dice q no tiene vacios o nulos
ALTER TABLE `listing` MODIFY `UltimoBusqueda` DATE; -- Cambiamos a DATE por q es una fecha

-- Columna IdAnfitrion
SELECT COUNT(*) FROM `listing` WHERE `IdAnfitrion` = "" OR `IdAnfitrion` = NULL; -- nos dice q no tiene vacios o nulos
ALTER TABLE `listing` MODIFY `IdAnfitrion` CHAR(10); -- los id siempre es necesario ponerlos en tipo de dato CHAR

-- Columna NombreAnfitrion
SELECT COUNT(*) FROM `listing` WHERE `NombreAnfitrion` = "" OR `NombreAnfitrion` = NULL; -- nos dice q tiene 3 vacios
UPDATE `listing` SET `NombreAnfitrion` = "Sin Dato" WHERE `NombreAnfitrion` = "" OR `NombreAnfitrion` = NULL; -- llenamos con sin dato

-- Columna AnfitrionDesde
SELECT COUNT(*) FROM `listing` WHERE `AnfitrionDesde` = "" OR `AnfitrionDesde` = NULL; -- nos dice q tiene 3 vacios o nulos
DELETE FROM `listing` WHERE `AnfitrionDesde` = ''; -- Hemos eliminado esas 3 filas de la tabla
ALTER TABLE `listing` MODIFY `AnfitrionDesde` DATE; -- Cambiamos a DATE por q es una fecha

-- Columna LocacionHuesped
SELECT COUNT(*) FROM `listing` WHERE `LocacionHuesped` = "" OR `LocacionHuesped` = NULL; -- nos dice q tiene 100 vacios o nulos
UPDATE `listing` SET `LocacionHuesped` = "Sin Dato" WHERE `LocacionHuesped` = "" OR `LocacionHuesped` = NULL OR `LocacionHuesped` = '-'; -- llenamos con sin dato
UPDATE `listing` SET `LocacionHuesped` = "Estados Unidos" WHERE `LocacionHuesped` REGEXP 'New York|United States|USA|US|EEUU|California'; -- Cambiamos a los paises de donde solicitaron el hospedaje
UPDATE `listing` SET `LocacionHuesped` = "Argentina" WHERE `LocacionHuesped` REGEXP 'Buenos Aires|Capital Federal|Argentina|AR|Capital Federal|buenos aires|Ciudad Autónoma de Buenos Aires|Recoleta|BA|Belgrano|Patagonia|Rio Negro|Buenos Airers|c.a.b.a|Palermo|CA|Río Grande|Tierra del Fuego';
UPDATE `listing` SET `LocacionHuesped` = "España" WHERE `LocacionHuesped` REGEXP 'ES|Benicàssim|Valencian Community|Spain|Madrid|Community of Madrid|Espinosa 575 2do A|Sant Cugat del Vallès|Catalonia|Alsina 2079 Piso 9 Depto D|Vigo|Galicia|Fuengirola|Andalucía|Andorra|Alicante|Europe|Nuñez 2439 6to 12';
UPDATE `listing` SET `LocacionHuesped` = "Canadá" WHERE `LocacionHuesped` REGEXP 'Canada|Canadá';                                                                                
UPDATE `listing` SET `LocacionHuesped` = "Italia" WHERE `LocacionHuesped` REGEXP 'Italy|Veneto|Treviso|IT';                                                                                
UPDATE `listing` SET `LocacionHuesped` = "Alemania" WHERE `LocacionHuesped` REGEXP 'Berlin|Germany|Hamburg';                                                                                
UPDATE `listing` SET `LocacionHuesped` = "México" WHERE `LocacionHuesped` REGEXP 'Mexico City|Federal District|Mexico|México|MX';                                                                                
UPDATE `listing` SET `LocacionHuesped` = "Suiza" WHERE `LocacionHuesped` REGEXP 'Geneva|Geneva|Switzerland|Zürich|Zurich';                                                                                
UPDATE `listing` SET `LocacionHuesped` = "Noruega" WHERE `LocacionHuesped` REGEXP 'Florø|Sogn og Fjordane|Norway'; 
UPDATE `listing` SET `LocacionHuesped` = "Brazil" WHERE `LocacionHuesped` REGEXP 'Brasilia|State of São Paulo|São Paulo|Brazil|Rio|Rio de Janeiro|BR'; 
UPDATE `listing` SET `LocacionHuesped` = "Singapur" WHERE `LocacionHuesped` REGEXP 'Singapore'; 
UPDATE `listing` SET `LocacionHuesped` = "Turkia" WHERE `LocacionHuesped` REGEXP 'Istanbul|Turkey'; 
UPDATE `listing` SET `LocacionHuesped` = "Reino Unido" WHERE `LocacionHuesped` REGEXP 'London|United Kingdom|UK|England|Brighton|GB'; 
UPDATE `listing` SET `LocacionHuesped` = "Uruguay" WHERE `LocacionHuesped` REGEXP 'Montevideo|Uruguay|UY'; 
UPDATE `listing` SET `LocacionHuesped` = "Paises Bajos" WHERE `LocacionHuesped` REGEXP 'The Hague|South Holland|Netherlands|Leiden|Amsterdam|North Holland|The Netherlands'; 
UPDATE `listing` SET `LocacionHuesped` = "Chile" WHERE `LocacionHuesped` REGEXP 'Chile|CH|CL'; 
UPDATE `listing` SET `LocacionHuesped` = "Irlanda" WHERE `LocacionHuesped` REGEXP 'Dublin|Ireland|LT'; 
UPDATE `listing` SET `LocacionHuesped` = "Portugal" WHERE `LocacionHuesped` REGEXP 'Lisbon|Portugal';
UPDATE `listing` SET `LocacionHuesped` = "Chequia" WHERE `LocacionHuesped` REGEXP 'Prague|Czechia';
UPDATE `listing` SET `LocacionHuesped` = "Suecia" WHERE `LocacionHuesped` REGEXP 'Stockholm|Stockholm County|Sweden';
UPDATE `listing` SET `LocacionHuesped` = "Francia" WHERE `LocacionHuesped` REGEXP 'Villemomble|Ile-de-France|France|Bordeaux|Nouvelle-Aquitaine|FR';
UPDATE `listing` SET `LocacionHuesped` = "Marruecos" WHERE `LocacionHuesped` REGEXP 'Tangier|Tangier-Tetouan|Morocco';
UPDATE `listing` SET `LocacionHuesped` = "Colombia" WHERE `LocacionHuesped` REGEXP 'Bogota|Colombia'; 
UPDATE `listing` SET `LocacionHuesped` = "Santo Tome y principe" WHERE `LocacionHuesped` REGEXP 'São Tomé|Sao Tome|São Tomé and Príncipe|SE'; 
UPDATE `listing` SET `LocacionHuesped` = "Rumania" WHERE `LocacionHuesped` REGEXP 'Sibiu|Romania|RU'; 
UPDATE `listing` SET `LocacionHuesped` = "Ecuador" WHERE `LocacionHuesped` REGEXP 'EC|Ecuador'; 
UPDATE `listing` SET `LocacionHuesped` = "Peru" WHERE `LocacionHuesped` REGEXP 'PE|Lima'; 
UPDATE `listing` SET `LocacionHuesped` = "Resto del Mundo" WHERE `LocacionHuesped` NOT REGEXP 'Argentina|Estados Unidos|España|Canadá|Italia|Alemania|México|Suiza|Noruega|Brazil|Singapur|Turkia|Reino Unido|Uruguay|Paises Bajos|Chile|Irlanda|Portugal|Chequia|Suecia|Francia|Marruecos|Colombia|Santo Tome y principe|Rumania|Ecuador|Peru';
ALTER TABLE `listing` MODIFY `LocacionHuesped` VARCHAR(20); -- Cambiamos a VARCHAR(20) caracteres

-- Columna TiempoRespuesta
SELECT COUNT(*) FROM `listing` WHERE `TiempoRespuesta` = "" OR `TiempoRespuesta` = NULL; -- nos dice q no tiene vacios o nulos
SELECT COUNT(*) FROM `listing` WHERE `TiempoRespuesta` = "N/A"; -- nos dice q tiene mas de 6883
SELECT DISTINCT `TiempoRespuesta` FROM `listing`; -- vemos que solo tiene 5  opciones, cambiaremos N/A por Sin Dato
UPDATE `listing` SET `TiempoRespuesta` = "Sin Datos" WHERE `TiempoRespuesta` = 'N/A'; -- 
ALTER TABLE `listing` MODIFY `LocacionHuesped` VARCHAR(25); -- Cambiamos a VARCHAR(20) caracteres

-- Columna TasaRespuesta
SELECT COUNT(*) FROM `listing` WHERE `TasaRespuesta` = "" OR `TasaRespuesta` = NULL; -- nos dice q no tiene vacios o nulos
SELECT COUNT(*) FROM `listing` WHERE `TasaRespuesta` = "N/A"; -- nos dice q tiene mas de 6883
SELECT DISTINCT `TasaRespuesta` FROM `listing`; -- vemos que tiene varias opciones, cambiaremos N/A por Sin Dato
UPDATE `listing` SET `TasaRespuesta` = "Sin Datos" WHERE `TasaRespuesta` = 'N/A'; -- 

-- Columna TasaAceptacion
SELECT COUNT(*) FROM `listing` WHERE `TasaAceptacion` = "" OR `TasaAceptacion` = NULL; -- nos dice q no tiene vacios o nulos
SELECT COUNT(*) FROM `listing` WHERE `TasaAceptacion` = "N/A"; -- nos dice q tiene mas de 6883
SELECT DISTINCT `TasaAceptacion` FROM `listing`; -- vemos que solo tiene 5  opciones, cambiaremos N/A por Sin Dato
UPDATE `listing` SET `TasaAceptacion` = "Sin Datos" WHERE `TasaAceptacion` = 'N/A'; -- 

-- Columna Superanfitrion
SELECT COUNT(*) FROM `listing` WHERE `Superanfitrion` = "" OR `Superanfitrion` = NULL; -- nos dice q no tiene vacios o nulos
UPDATE `listing` SET `Superanfitrion` = "0" WHERE `Superanfitrion` = 'f'; -- lo llenamos de ceros los f
UPDATE `listing` SET `Superanfitrion` = "1" WHERE `Superanfitrion` = 't'; -- lo llenamos de ceros los t
SELECT DISTINCT `Superanfitrion` FROM `listing`; -- vemos que solo tiene 2  opciones, cambiaremos N/A por Sin Dato

-- Columna Barrio
SELECT COUNT(*) FROM `listing` WHERE `Barrio` = "" OR `Barrio` = NULL; -- nos dice q tiene 2856 vacios o nulos
UPDATE `listing` SET `Barrio` = "Sin Datos" WHERE `Barrio` = ''; -- 

-- Columna TotalRecuenListAnfit
SELECT COUNT(*) FROM `listing` WHERE `TotalRecuenListAnfit` = "" OR `TotalRecuenListAnfit` = NULL; -- nos dice q no tiene vacios o nulos
ALTER TABLE `listing` MODIFY `TotalRecuenListAnfit` INTEGER; -- Cambiamos el tipo de dato

-- Columna Pais
SELECT COUNT(*) FROM `listing` WHERE `Pais` = "" OR `Pais` = NULL; -- nos dice q tiene 0 vacios o nulos
SELECT DISTINCT `Pais` FROM `listing`; -- vemos que tiene como Pais Argentina y 'Saint Martin'
SELECT COUNT(*) FROM `listing` WHERE Pais='Saint Martin'; -- Nos da 1 fila
SELECT COUNT(*) FROM `listing` WHERE Pais='Argentina'; -- Nos da 23725 filas, eliminaremos la fila de Pais='Saint Martin'
DELETE FROM `listing` WHERE `Pais` = 'Saint Martin'; -- Hemos eliminado esa fila de la tabla
ALTER TABLE `listing` MODIFY `Pais` VARCHAR(10); -- Cambiamos a VARCHAR(10) caracteres

-- Columna Latitud
SELECT COUNT(*) FROM `listing` WHERE `Latitud` = "" OR `Latitud` = NULL; -- nos dice q tiene 0 vacios o nulos
SELECT `Latitud` FROM `listing` WHERE `Latitud` LIKE '%,%'; -- Las coordenadas no tiene coma, eso es bueno por q funciona con punto
ALTER TABLE `listing` MODIFY `Latitud` DECIMAL(10,7); -- Cambiamos a VARCHAR(10) caracteres

-- Columna Longitud
SELECT COUNT(*) FROM `listing` WHERE `Longitud` = "" OR `Longitud` = NULL; -- nos dice q tiene 0 vacios o nulos
SELECT `Longitud` FROM `listing` WHERE `Longitud` LIKE '%,%'; -- Las coordenadas no tiene coma, eso es bueno por q funciona con punto
ALTER TABLE `listing` MODIFY `Longitud` DECIMAL(10,7); -- Cambiamos a VARCHAR(10) caracteres

-- Columna TipoPropiedad
SELECT COUNT(*) FROM `listing` WHERE `TipoPropiedad` = "" OR `TipoPropiedad` = NULL; -- nos dice q tiene 0 vacios o nulos
SELECT DISTINCT `TipoPropiedad` FROM `listing`; -- vemos que tiene 34 variedades de propiedad

-- Columna TipoDormitorio
SELECT COUNT(*) FROM `listing` WHERE `TipoDormitorio` = "" OR `TipoDormitorio` = NULL; -- nos dice q tiene 0 vacios o nulos
SELECT DISTINCT `TipoDormitorio` FROM `listing`; -- vemos que tiene 4 tipos de dormitorio

-- Columna NumeroHuespedes
SELECT COUNT(*) FROM `listing` WHERE `NumeroHuespedes` = "" OR `NumeroHuespedes` = NULL; -- nos dice q tiene 0 vacios o nulos
SELECT DISTINCT `NumeroHuespedes` FROM `listing`; -- vemos que tiene 16 obsiones seleccionadas
ALTER TABLE `listing` MODIFY `NumeroHuespedes` INTEGER; -- Cambiamos a INTEGER

-- Columna Baños
SELECT COUNT(*) FROM `listing` WHERE `Baños` = "" OR `Baños` = NULL; -- nos dice q tiene 62 vacios o nulos
SELECT DISTINCT `Baños` FROM `listing`; -- vemos que tiene 16 opciones seleccionadas
DELETE FROM `listing` WHERE `Baños` = ''; -- Hemos eliminado 62 filas sin informacion de la tabla no es ni el 0.00001%
ALTER TABLE `listing` MODIFY `Baños` FLOAT; -- Cambiamos a FLOAT

-- Columna Cuartos
SELECT COUNT(*) FROM `listing` WHERE `Cuartos` = "" OR `Cuartos` = NULL; -- nos dice q tiene 40 vacios o nulos
SELECT DISTINCT `Cuartos` FROM `listing`; -- Vemos que son enteros
DELETE FROM `listing` WHERE `Cuartos` = ''; -- Hemos eliminado 40 filas sin informacion de la tabla no es ni el 0.00001%
ALTER TABLE `listing` MODIFY `Cuartos` INTEGER; -- Cambiamos a FLOAT

-- Columna Camas
SELECT COUNT(*) FROM `listing` WHERE `Camas` = "" OR `Camas` = NULL; -- nos dice q tiene 136 vacios o nulos
SELECT DISTINCT `Camas` FROM `listing`; -- Vemos que son enteros
DELETE FROM `listing` WHERE `Camas` = ''; -- Hemos eliminado 136 filas sin informacion de la tabla no es ni el 0.00001%
ALTER TABLE `listing` MODIFY `Camas` INTEGER; -- Cambiamos a FLOAT

-- Columna TipoCama
SELECT COUNT(*) FROM `listing` WHERE `TipoCama` = "" OR `TipoCama` = NULL; -- nos dice q tiene 0 vacios o nulos
SELECT DISTINCT `TipoCama` FROM `listing`; -- Vemos que tiene 5 opciones
ALTER TABLE `listing` MODIFY `TipoCama` VARCHAR(15); -- Cambiamos Tipo de Datos atributo

-- Columna PrecioDia
SELECT COUNT(*) FROM `listing` WHERE `PrecioDia` = "" OR `PrecioDia` = NULL; -- nos dice q tiene 0 vacios o nulos
UPDATE `listing` SET `PrecioDia` = REPLACE(`PrecioDia`,',',''); -- Quitamos la coma (,) ya que al graficar no nos lee con coma
UPDATE `listing` SET `PrecioDia` = REPLACE(`PrecioDia`,'$',''); -- Quitamos porque el simbolo no nos dejara multiplicar si deseamos mas adelante
ALTER TABLE `listing` MODIFY `PrecioDia` DECIMAL(10,2); -- Cambiamos Tipo de Datos atributo

-- Columna AdelantoPago
SELECT COUNT(*) FROM `listing` WHERE `AdelantoPago` = "" OR `AdelantoPago` = NULL; -- nos dice q tiene 16000 vacios o nulos
UPDATE `listing` SET `AdelantoPago` = "0" WHERE `AdelantoPago` = ''; --  Lo haremos booleano
UPDATE `listing` SET `AdelantoPago` = "1" WHERE NOT `AdelantoPago` = '0'; -- 
ALTER TABLE `listing` MODIFY `AdelantoPago` CHAR(1); -- Cambiamos Tipo de Datos atributo

-- Columna LimpiezaGratis
SELECT COUNT(*) FROM `listing` WHERE `LimpiezaGratis` = "" OR `LimpiezaGratis` = NULL; -- nos dice q tiene 16000 vacios o nulos
UPDATE `listing` SET `LimpiezaGratis` = "0" WHERE `LimpiezaGratis` = ''; -- lo haremos booleano
UPDATE `listing` SET `LimpiezaGratis` = "1" WHERE NOT `LimpiezaGratis` = '0'; -- 
ALTER TABLE `listing` MODIFY `LimpiezaGratis` CHAR(1); -- Cambiamos Tipo de Datos atributo

-- Columna HuespedesAdicionales
SELECT COUNT(*) FROM `listing` WHERE `HuespedesAdicionales` = "" OR `HuespedesAdicionales` = NULL; -- nos dice q tiene 0 vacios o nulos
ALTER TABLE `listing` MODIFY `HuespedesAdicionales` INTEGER; -- Cambiamos Tipo de Datos atributo

-- Columna PagoExtraXPersona
SELECT COUNT(*) FROM `listing` WHERE `PagoExtraXPersona` = "" OR `PagoExtraXPersona` = NULL; -- nos dice q tiene 0 vacios o nulos
UPDATE `listing` SET `PagoExtraXPersona` = "0" WHERE `PagoExtraXPersona` = '$0.00'; -- lo haremos booleano
UPDATE `listing` SET `PagoExtraXPersona` = "1" WHERE NOT `PagoExtraXPersona` = '0'; -- 
ALTER TABLE `listing` MODIFY `PagoExtraXPersona` CHAR(1); -- Cambiamos Tipo de Datos atributo

-- Columna NochesMinimas
SELECT COUNT(*) FROM `listing` WHERE `NochesMinimas` = "" OR `NochesMinimas` = NULL; -- nos dice q tiene 0 vacios o nulos
ALTER TABLE `listing` MODIFY `NochesMinimas` INTEGER; -- Cambiamos Tipo de Datos atributo

-- Columna NochesMaximas
SELECT COUNT(*) FROM `listing` WHERE `NochesMaximas` = "" OR `NochesMaximas` = NULL; -- nos dice q tiene 0 vacios o nulos
ALTER TABLE `listing` MODIFY `NochesMaximas` INTEGER; -- Cambiamos Tipo de Datos atributo

-- Columna CalificaRecomendacion
SELECT COUNT(*) FROM `listing` WHERE `CalificaRecomendacion` = "" OR `CalificaRecomendacion` = NULL; -- nos dice q tiene 6721 vacios o nulos
UPDATE `listing` SET `CalificaRecomendacion` = "0" WHERE `CalificaRecomendacion` = ''; -- lo llenamos de ceros los que estan vacios
ALTER TABLE `listing` MODIFY `CalificaRecomendacion` INTEGER; -- Cambiamos Tipo de Datos atributo

-- Columna CalificaLimpieza
SELECT COUNT(*) FROM `listing` WHERE `CalificaLimpieza` = "" OR `CalificaLimpieza` = NULL; -- nos dice q tiene 6721 vacios o nulos
UPDATE `listing` SET `CalificaLimpieza` = "0" WHERE `CalificaLimpieza` = ''; -- lo llenamos de ceros los que estan vacios
ALTER TABLE `listing` MODIFY `CalificaLimpieza` INTEGER; -- Cambiamos Tipo de Datos atributo

-- Columna CalificaCheckIn
SELECT COUNT(*) FROM `listing` WHERE `CalificaCheckIn` = "" OR `CalificaCheckIn` = NULL; -- nos dice q tiene 6721 vacios o nulos
UPDATE `listing` SET `CalificaCheckIn` = "0" WHERE `CalificaCheckIn` = ''; -- lo llenamos de ceros los que estan vacios
ALTER TABLE `listing` MODIFY `CalificaCheckIn` INTEGER; -- Cambiamos Tipo de Datos atributo

-- Columna CalificaComunicacion
SELECT COUNT(*) FROM `listing` WHERE `CalificaComunicacion` = "" OR `CalificaComunicacion` = NULL; -- nos dice q tiene 6721 vacios o nulos
UPDATE `listing` SET `CalificaComunicacion` = "0" WHERE `CalificaComunicacion` = ''; -- lo llenamos de ceros los que estan vacios
ALTER TABLE `listing` MODIFY `CalificaComunicacion` INTEGER; -- Cambiamos Tipo de Datos atributo

-- Columna CalificaExperiencia
SELECT COUNT(*) FROM `listing` WHERE `CalificaExperiencia` = "" OR `CalificaExperiencia` = NULL; -- nos dice q tiene 6721 vacios o nulos
UPDATE `listing` SET `CalificaExperiencia` = "0" WHERE `CalificaExperiencia` = ''; -- lo llenamos de ceros los que estan vacios
ALTER TABLE `listing` MODIFY `CalificaExperiencia` INTEGER; -- Cambiamos Tipo de Datos atributo

-- Columna ReservaInstantanea
SELECT COUNT(*) FROM `listing` WHERE `ReservaInstantanea` = "" OR `ReservaInstantanea` = NULL; -- nos dice q tiene 0 vacios o nulos
UPDATE `listing` SET `ReservaInstantanea` = "0" WHERE `ReservaInstantanea` = 'f'; -- lo llenamos de ceros los f
UPDATE `listing` SET `ReservaInstantanea` = "1" WHERE `ReservaInstantanea` = 't'; -- lo llenamos de ceros los t
ALTER TABLE `listing` MODIFY `ReservaInstantanea` CHAR(1); -- Cambiamos Tipo de Datos atributo

-- Columna PoliticCancela
SELECT DISTINCT COUNT(*) FROM `listing` WHERE `PoliticCancela` = "" OR `PoliticCancela` = NULL; -- nos dice q tiene 0 vacios o nulos
SELECT DISTINCT `PoliticCancela` FROM `listing`; -- 5 variantes

-- Columna RequiereFotoHuesped
SELECT COUNT(*) FROM `listing` WHERE `RequiereFotoHuesped` = "" OR `RequiereFotoHuesped` = NULL; -- nos dice q tiene 0 vacios o nulos
UPDATE `listing` SET `RequiereFotoHuesped` = "0" WHERE `RequiereFotoHuesped` = 'f'; -- lo llenamos de ceros los f
UPDATE `listing` SET `RequiereFotoHuesped` = "1" WHERE `RequiereFotoHuesped` = 't'; -- lo llenamos de ceros los t
ALTER TABLE `listing` MODIFY `RequiereFotoHuesped` CHAR(1); -- Cambiamos Tipo de Datos atributo

-- Columna RequiereTelefono
SELECT COUNT(*) FROM `listing` WHERE `RequiereTelefono` = "" OR `RequiereTelefono` = NULL; -- nos dice q tiene 0 vacios o nulos
UPDATE `listing` SET `RequiereTelefono` = "0" WHERE `RequiereTelefono` = 'f'; -- lo llenamos de ceros los f
UPDATE `listing` SET `RequiereTelefono` = "1" WHERE `RequiereTelefono` = 't'; -- lo llenamos de ceros los t
ALTER TABLE `listing` MODIFY `RequiereTelefono` CHAR(1); -- Cambiamos Tipo de Datos atributo

-- Columna CuartosPrivados
SELECT COUNT(*) FROM `listing` WHERE `CuartosPrivados` = "" OR `CuartosPrivados` = NULL; -- nos dice q tiene 0 vacios o nulos
ALTER TABLE `listing` MODIFY `CuartosPrivados` INTEGER; -- Cambiamos Tipo de Datos atributo

SELECT * FROM `listing`;

-- Vemos ahora la tabla completa que ya esta terminada su ETL